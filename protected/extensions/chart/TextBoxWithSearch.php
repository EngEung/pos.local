<?php
Yii::import('ext.yii-easyui.widgets.EuiDataGrid');
class TextBoxWithSearch extends CInputWidget{
	
	public $url = "";
	public $title ="";
	public $dialogTitle = "";
	public $iconCls = "";
	public function init()
	{
		/*$content = '';
		$content = $this->renderTag();
		$this->clientChange();
		echo $content;*/
	}
	
	protected  function clientChange()
	{
		$cs=Yii::app()->getClientScript();
		$cs->registerCoreScript('jquery');
		$handler = $this->javascript();
		$cs->registerScript('Yii.CHtml.#' . $this->id,"{$handler}");
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

		if ($this->hasModel()){
			$tag = "<div class='control-group'><div class='controls'>";
			$tag .= CHtml::activeTextField($this->model, $this->attribute, $this->htmlOptions);
			$tag .= CHtml::htmlButton('<i class="icon-search"></i>',  array('style' => 'padding:7px;','class' => "btn btn-small",'id' => "btn{$id}"));
			$tag .="</div>";
			$tag .= $this->dialogBox($id) ."</div>";
			echo $tag;
			
		}
		else{
			$tag = "<div class='control-group'><div class='controls'>";
			$tag .= CHtml::textField($name, $this->value, $this->htmlOptions).CHtml::htmlButton('<i class="icon-search"></i>',  array('style' => 'padding:7px;','class' => "btn btn-small",'id' => "btn{$id}"));
			$tag .="</div>";
			$tag .= $this->dialogBox($id) ."</div>";
			echo $tag;
		}
			
		//$options = !empty($this->options) ? CJavaScript::encode($this->options) : '';
		//Yii::app()->clientScript->registerScript(__CLASS__.'#'.$id, "jQuery('#{$id}').typeahead({$options});");
	}
	
	
	private function dialogBox($id = null)
	{
		$dg = new EuiDataGrid();
		$dialogId = "edl$id";
		$dialogBox=<<<EOD
				<div id="$dialogId" class="easyui-dialog" title="Category Lists" style="width:535px;height:350px;padding:10px" data-options="resizable:true, maximizable:true,  modal: true, closed: true,iconCls:'$this->iconCls',toolbar: '#dlg-toolbar1',buttons: '#dlg-search-buttons1'">
					
				<div id="dlg-toolbar1" style="padding:0">
				<table cellpadding="0" cellspacing="0" style="width:100%">
					<tr>
						<td style="text-align:right;padding-right:2px">
						<input class="easyui-searchbox" data-options="prompt:'សូមPlease input somthing'" style="width:150px"></input>
						</td>
					</tr>
				</table>
			</div>
			<div id="dlg-search-buttons1">
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:alert('save')">Ok</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#dlg').dialog('close')">Cancel</a>
			</div>
				</div>
EOD;
		return $dialogBox;
	}
	
	private function javascript(){
		$javacript = "dg = $('#dg');
		dg.datagrid({
			title:'{$this->title}',
			height:400,
			singleSelect:true,
			nowrap:false,
			fitColumns:true,
			url:'{$this->url}',
			toolbar: '#tb',
			idField: 'id',		
			pagination: true,
			//rownumbers: true,
			scrollbarSize: 5,
			ctrlSelect: true,
			collapsible:true,
			tools:'#ttAcc',
			columns:[". CJSON::encode($this->columns) ."],
		});";
		return $javacript;
	}
}
?>