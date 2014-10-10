<?php 
/**
 * @version 1.0
 * Date: 2012-10-11
 */

Yii::import('ext.yii-easyui.widgets.EuiDataGrid');
class Test extends EuiDataGrid {
	public function showGrid(){
		//$this= new EuiDataGrid;
		$this->idField = "id";
		$this->id = "dgItemTpye";
		$this->columns =  array(
				array('title' => 'id', 'field'=>'id', 'width'=> 10, 'sortable'=>true),
				array('title' => 'Name', 'field'=>'name', 'width'=> 50, 'sortable'=>true),
				array('title' => 'Description', 'field'=>'name', 'width'=> 100, 'sortable'=>true),
			);
		$this->url = Yii::app()->baseUrl. '/dialog/DialogItemType';
		return $this->run();
	}
}
?>