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
/*	$this->widget('ext.chart.Dialog', array(
	'url' => Yii::app()->baseUrl. '/dialog/DialogCategory',
	'id' => 'dddd',
	'title' => 'Categories',
	'columns' => array(
		array('title' => 'id', 'field'=>'id', 'width'=> 10, 'sortable'=>true),
		array('title' => 'Descr', 'field'=>'name', 'width'=> 10, 'sortable'=>true),
			)
	));*/
	?>
	<?php /*
	$this->widget('ext.chart.TextBoxWithSearch', array(
	'model' => 'textBox',
	'id' => 'dddd',
	'title' => 'Categories',
	'dialogTitle' => 'Unit Type',
	'iconCls' => 'icon-th-large'
	));*/
	$test = new Test();
	$test->showGrid();
	?> 
	
	<button id="click">click me</button>
</div>


<script>
	$("#btntextBox").click(function(){
		$("#edldddd").dialog('open');
	});
</script>
