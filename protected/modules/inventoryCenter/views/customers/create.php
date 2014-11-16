<?php 
    $this->pageTitle=Yii::app()->name;

    $cs = Yii::app()->clientscript;
    
    $cs->registerScriptFile(Yii::app()->baseUrl .'/js/jasny-bootstrap/js/jasny-bootstrap.min.js');
    Yii::app()->bootstrap->registerAssetCss("bootstrap.css");
    $cs->registerCssFile(Yii::app()->baseUrl . '/js/jasny-bootstrap/css/jasny-bootstrap.min.css');
   
   
    $cs->registerScriptFile(Yii::app()->baseUrl .'/js/masktextbox/masktextbox.js',CClientScript::POS_HEAD );
    $cs->registerScriptFile(Yii::app()->baseUrl .'/js/ajaxupload/processupload.js' );
   
?>
<?php echo $this->renderPartial('_form', array('model' => $model));?>