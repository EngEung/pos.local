<?php 
$this->pageTitle=Yii::app()->name . ' - Customers';
$this->breadcrumbs=array(
	'Create Customer',
);
/** Client Script**/
Yii::app()->clientScript->registerCoreScript('jquery');
$cs = Yii::app()->clientscript;						
$cs->registerCssFile( Yii::app()->baseUrl . '/js/jquery-easyui/themes/bootstrap/easyui.css' );
$cs->registerScriptFile( Yii::app()->baseUrl . '/js/jquery-easyui/jquery.easyui.min.js', CClientScript::POS_HEAD);
?>

<div id="p" class="easyui-panel" title="Create a new customer" style="width:750px;height:500px;padding:10px;"
	data-options="collapsible:true,minimizable:false,maximizable:true, closable:false">
	<?php echo $this->renderPartial('_form', array('model' => $model));?>
</div>