<?php
Yii::import('ext.yii-easyui.widgets.EuiDataGrid');
class TextBoxWithSearch extends CInputWidget{
	
	public $url = "";
	public $title ="";
	public $dialogTitle = "";
	public $iconCls = "";
	public $columns = array();
	public $keyword = "";
	public $attributeHiddenField = "";
    public $disabledSearch = false;
    public $enabledSearch = "";
	public function init()
	{
		/*$content = '';
		$content = $this->renderTag();
		$this->clientChange();
		echo $content;*/
	}
	
	protected  function clientChange($id)
	{
		$cs=Yii::app()->getClientScript();
		$cs->registerCoreScript('jquery');
		$handler = $this->javascript($id);
		$cs->registerScript('Yii.CHtml.#' . $id,"{$handler}");
	}
	
	public function run()
	{
		list($name, $id) = $this->resolveNameID();

		if (isset($this->htmlOptions['id']))
			$id = $this->htmlOptions['id'];
		else
			$this->htmlOptions['id'] = $id;
		
		if (isset($this->htmlOptions['name']))
			$name = $this->htmlOptions['name'];
		
		$openDialogBox = $this->openDialogBox($id);
		if ($this->hasModel()){
			$tag = "<div class='control-group'>";
				$tag .= CHtml::activeLabelEx($this->model, $this->attribute, array('class' => 'control-label'));
				$tag .= "<div class='controls'>";
					$tag .= CHtml::activeTextField($this->model, $this->attribute, $this->htmlOptions);
					$tag .= CHtml::htmlButton('<i class="icon-search"></i>',  array( 'disabled'=> $this->disabledSearch, 'style' => 'padding:7px;','class' => "btn btn-small",'id' => "btn{$id}", 'onclick' => "javascript:$openDialogBox;"));
				$tag .="</div>";
				$tag .= $this->dialogBox($id);
				$tag .= CHtml::activeHiddenField($this->model, $this->attributeHiddenField);
			$tag .="</div>";
			echo $tag;
		}
		else{
			$tag = "<div class='control-group'><div class='controls'>";
		//	$tag .= CHtml::activeHiddenField($this->model, $this->attributeHidden, $this->htmlOptions);
			$tag .= CHtml::label($this->model, $this->attribute, array('class' => 'control-label'));
			$tag .= CHtml::textField($name, $this->value, $this->htmlOptions).CHtml::htmlButton('<i class="icon-search"></i>',  array('style' => 'padding:7px;','class' => "btn btn-small",'id' => "btn{$id}"));
			$tag .="</div>";
			$tag .= $this->dialogBox($id) ."</div>";
			echo $tag;
		}
			
		//$options = !empty($this->options) ? CJavaScript::encode($this->options) : '';
		//Yii::app()->clientScript->registerScript(__CLASS__.'#'.$id, "jQuery('#{$id}').typeahead({''});");
	}
	
	
	private function dialogBox($id = null)
	{
		$dg = new EuiDataGrid();
		$dialogId = "edl$id";
		$dagridId = "edg$id";
		echo <<<EOD
				<div id="$dialogId" class="easyui-dialog" title="$this->dialogTitle" style="width:535px;height:350px;padding:10px" data-options="resizable:true, maximizable:true,  modal: true, closed: true,iconCls:'$this->iconCls',toolbar: '#dlg-toolbar-$id',buttons: '#dlg-search-buttons-$id'">
				
EOD;
			
		EuiDataGrid::widget('ext.yii-easyui.widgets.EuiDataGrid', array(
			'id' => $dagridId,
			'style' => 'width:auto; height: 200px',
			'singleSelect' => true,
			'showFooter' => true,
			'columns' => $this->columns,
			'queryParams' => array('dd' => $this->keyword)
			
		));
		echo '<div id="dlg-toolbar-'.$id.'" style="padding:0">
				<table cellpadding="0" cellspacing="0" style="width:100%">
					<tr>
						<td style="text-align:right;padding-right:2px">
						<input class="easyui-searchbox" data-options="prompt:\'សូមPlease input somthing\', searcher:function(value,name){alert(value);}" style="width:150px"></input>
						</td>
					</tr>
				</table>
			 </div>
			 <div id="dlg-search-buttons-'.$id.'">
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:'.$this->onDbClickRow($id).'">Ok</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:'. $this->closeDialogBox($id) .'">Cancel</a>
			 </div>
		</div>';

	}
	
	protected function openDialogBox($id){
		$javacript="$('#edl$id').dialog('open');$('#edg$id').datagrid({url: '$this->url', queryParams:{keyword:$('#$id').val()}});";
		return $javacript;
	}

	protected function closeDialogBox($id){
		$name=CHtml::activeName($this->model,$this->attributeHiddenField);
		$idHiddenField = CHtml::getIdByName($name);
		$javacript ="$('#edl$id').dialog('close');$('#$id').val('');$('#$idHiddenField').val('')";
		return $javacript;
	}

	public function onDbClickRow($id){
		$name=CHtml::activeName($this->model,$this->attributeHiddenField);
		$idHiddenField = CHtml::getIdByName($name);
		$javacript="var row = $('#edg$id').datagrid('getSelected');
				 	if (row){
						$('#$id').val(row.name);
						$('#$idHiddenField').val(row.id);
						$('#edl$id').dialog('close');
						$('#$this->enabledSearch').removeAttr('disabled');
					}";
		return $javacript;
	}
}
?>