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
		$content = '<div id="dlg" class="easyui-dialog" title="Item Unit Groups" style="width:535px;height:350px;padding:10px" data-options="closed: true">
					 <table id="dg"></table>
					</div>';
					$content = '<table id="dg"></table>';
		return $content;
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