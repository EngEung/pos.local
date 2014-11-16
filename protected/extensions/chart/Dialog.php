<?php

class Dialog extends  CWidget{
	
	public $url = "";
	public $id= "";
	public $title ="";
	public $columns = array();
	public function init()
	{
		$content = '';
		$content = $this->renderTag();
		$this->clientChange();
		echo $content;
	}
	
	protected  function clientChange()
	{
		$cs=Yii::app()->getClientScript();
		$cs->registerCoreScript('jquery');
		$handler = $this->javascript();
		$cs->registerScript('Yii.CHtml.#' . $this->id,"{$handler}");
	}

	
	private function renderTag()
	{
		$content = '<div id="dlg" class="easyui-dialog" title="Sign In" style="width:400px;padding:10px" 
		              data-options="collapsible:true, closable:false, modal:true, shadow:true, iconCls:\'icon-lock\',buttons: \'#dlg-buttons\'">';
            $content .= CHtml::beginForm();
                $content .=  '<div style="float:left; width:100px; text-align:right;">';
                    $content .= CHtml::label('Username', 'user_name', array('class' => 'control-label required'));
                    $content .= "<br/>" .CHtml::label('Password', 'passwd');
                $content .= "</div>"; 
                $content .=  '<div style="float:left; width:200px; margin-left:10px;">';
                    $content .= CHtml::textField('user_name','', array('autocomplete'=> 'off','placeholder' => 'Username','style' => 'height:30px;'));
                    $content .= CHtml::passwordField('passwd','', array('placeholder' => 'Password','style' => 'height:30px;'));
                $content .= "</div>";
            $content .= CHtml::endForm(); 
		$content .=	'</div>';            
        $content .= '<div id="dlg-buttons">
                        <button id="btnSignins" class="btn btn-small" type="button" name="yt0" style="margin-left:5px;">Sign In</button>
                    </div>';
		return $content;
	}
	
	private function javascript(){
		/*$javacript = "dg = $('#dg');
		dg.datagrid({
			title:'{$this->title}',
			height:200,
			singleSelect:true,
			nowrap:false,
			fitColumns:true,
			url:'{$this->url}',
			toolbar: '#tb',
			idField: 'id',		
			scrollbarSize: 4,
			collapsible:true,
			tools:'#ttAcc',
			columns:[". CJSON::encode($this->columns) ."],
		});";*/
		$javacript ="$('#dlg').dialog('move',{top:50});";
		return $javacript;
	}
}
?>