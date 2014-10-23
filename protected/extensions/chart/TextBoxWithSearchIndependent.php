<?php
class TextBoxWithSearchIndependent extends TextBoxWithSearch{
	public $requireField = "";
	protected function openDialogBox($id){
		$name=CHtml::activeName($this->model,$this->requireField);
		$idRequireField = CHtml::getIdByName($name);

		$javacript="$('#edl$id').dialog('open');$('#edg$id').datagrid({url: '$this->url', queryParams:{require:$('#$idRequireField').val(), keyword:$('#$id').val()}});";
		return $javacript;
	}
}
?>