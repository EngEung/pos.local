<?php 
	$this->pageTitle=Yii::app()->name;
	$this->widget('bootstrap.widgets.TbBreadcrumbs', array(
	'links'=>array('Staff'=>$this->createUrl('/setup/customers/'), 'Lists Of Customers'),
	));
	
	Yii::app()->clientScript->registerCoreScript('jquery');
	$cs = Yii::app()->clientscript;
	$cs->registerCssFile( Yii::app()->baseUrl . '/js/jquery-easyui/themes/icon.css' );							
	$cs->registerCssFile( Yii::app()->baseUrl . '/js/jquery-easyui/themes/bootstrap/easyui.css' );
	$cs->registerScriptFile( Yii::app()->baseUrl . '/js/jquery-easyui/jquery.easyui.min.js');	
	$cs->registerScriptFile( Yii::app()->baseUrl . '/js/jquery-easyui/jquery.crud.js');	
	
	$cs->registerScriptFile(Yii::app()->baseUrl . '/js/ajaxupload/jquery.form.js', CClientScript::POS_HEAD);
	$cs->registerScriptFile(Yii::app()->baseUrl . '/js/ajaxupload/processupload.js',CClientScript::POS_HEAD );
	$cs->registerCssFile( Yii::app()->baseUrl . '/js/ajaxupload/style/style.css', CClientScript::POS_HEAD);
	
?>



<script>


</script>