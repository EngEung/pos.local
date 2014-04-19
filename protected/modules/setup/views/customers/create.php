<?php 
	$this->pageTitle=Yii::app()->name . ' - Customers';
	$this->breadcrumbs=array(
		'Create Customer',
	);
	/** Client Script**/
	Yii::app()->clientScript->registerCoreScript('jquery');
	$cs = Yii::app()->clientscript;						
	$cs->registerCssFile( Yii::app()->baseUrl . '/js/jquery-easyui/themes/bootstrap/easyui.css' );
	
	$cs->registerCssFile( Yii::app()->baseUrl . '/js/jasny-bootstrap/css/jasny-bootstrap.min.css' );
	
	$cs->registerScriptFile( Yii::app()->baseUrl . '/js/jquery-easyui/jquery.easyui.min.js', CClientScript::POS_HEAD);
	$cs->registerScriptFile( Yii::app()->baseUrl . '/js/jasny-bootstrap/js/jasny-bootstrap.min.js', CClientScript::POS_HEAD);
	$cs->registerScriptFile(Yii::app()->baseUrl . '/js/ajaxupload/processupload.js',CClientScript::POS_HEAD );
?>

<div id="p" class="easyui-panel" title="Create a new customer" style="width:730px;height:545px;padding-top:10px;"
	data-options="collapsible:true,minimizable:false,maximizable:true, closable:false, buttons:'#dlg-buttons'">
	<?php echo $this->renderPartial('_form', array('model' => $model));?>
	
</div>