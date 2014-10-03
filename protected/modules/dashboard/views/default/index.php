<?php
$this->breadcrumbs=array(
	$this->module->id,
);

    Yii::app()->clientScript->registerCoreScript('jquery');
	$cs = Yii::app()->clientscript;

	$cs->registerCssFile( Yii::app()->baseUrl . '/js/jquery-easyui/themes/icon.css' );							
	$cs->registerCssFile( Yii::app()->baseUrl . '/js/jquery-easyui/themes/bootstrap/easyui.css' );
	$cs->registerScriptFile( Yii::app()->baseUrl . '/js/jquery-easyui/jquery.easyui.min.js');	
?>
<div title="Dashboard">     
	<h1><?php echo $this->uniqueId . '/' . $this->action->id; ?></h1>
	
	<p>
	This is the view content for action "<?php echo $this->action->id; ?>".
	The action belongs to the controller "<?php echo get_class($this); ?>" in the "<?php echo $this->module->id; ?>" module.
	</p>
	<p>
	You may customize this page by editing <tt><?php echo __FILE__; ?></tt>
<?php 
	$this->widget('ext.chart.Dialog', array(
	'url' => Yii::app()->baseUrl. '/dialog/DialogCategory',
	'id' => 'dddd',
	'title' => 'Categories',
	'columns' => array(
		array('title' => 'dd', 'field'=>'idd', 'width'=> 10, 'sortable'=>true),
		array('title' => 'Descr', 'field'=>'id', 'width'=> 10, 'sortable'=>true),
			)
	));
	?> 
</div>


