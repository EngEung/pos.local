<?php 
/**
 * @version 1.0
 * Date: 2012-10-11
 */

Yii::import('ext.yii-easyui.widgets.EuiDataGrid');
class Test extends CComponent {
	public function showGrid(){
		$e = new EuiDataGrid();
		$e->id = "dgItemTpye";
		$e->columns =  array(
				array('title' => 'id', 'field'=>'id', 'width'=> 10, 'sortable'=>true),
				array('title' => 'Name', 'field'=>'name', 'width'=> 50, 'sortable'=>true),
				array('title' => 'Description', 'field'=>'name', 'width'=> 100, 'sortable'=>true)
			);
		$e->url = Yii::app()->baseUrl. '/dialog/DialogItemType';
		return $e->run();
	}
	
	public function showGrid1(){
		return EuiDataGrid::widget('ext.yii-easyui.widgets.EuiDataGrid', array(
			'id' => 'edgCategory',
			'style' => 'width:auto; height: 200px',
			
			'singleSelect' => true,
			'showFooter' => true,
			'columns' => array(
				array('title' => 'id', 'field'=>'id', 'width'=> 10, 'sortable'=>true),
				array('title' => 'Name', 'field'=>'name', 'width'=> 50, 'sortable'=>true),
				array('title' => 'Description', 'field'=>'name', 'width'=> 100, 'sortable'=>true),
			),
			
		));
	}
}
?>