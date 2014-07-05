<?php 
	/** Client Script**/
	Yii::app()->clientScript->registerCoreScript('jquery');
	$cs = Yii::app()->clientscript;						
	$cs->registerCssFile( Yii::app()->baseUrl . '/js/jquery-easyui/themes/bootstrap/easyui.css' );
	$cs->registerCssFile( Yii::app()->baseUrl . '/js/jasny-bootstrap/css/jasny-bootstrap.min.css' );
	
	$cs->registerScriptFile( Yii::app()->baseUrl . '/js/jquery-easyui/jquery.easyui.min.js', CClientScript::POS_HEAD);
	$cs->registerScriptFile( Yii::app()->baseUrl . '/js/jasny-bootstrap/js/jasny-bootstrap.min.js', CClientScript::POS_HEAD);
	$cs->registerScriptFile(Yii::app()->baseUrl . '/js/ajaxupload/processupload.js',CClientScript::POS_HEAD );
	$cs->registerScriptFile(Yii::app()->baseUrl . '/js/masktextbox/masktextbox.js',CClientScript::POS_HEAD );
?>
<?php echo $this->renderPartial('_form', array('model' => $model));?>
		
