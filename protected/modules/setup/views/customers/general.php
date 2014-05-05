<?php 

	Yii::app()->clientScript->registerCoreScript('jquery');
	$cs = Yii::app()->clientscript;

	$cs->registerCssFile( Yii::app()->baseUrl . '/js/jquery-easyui-1.3.6/themes/icon.css' );							
	$cs->registerCssFile( Yii::app()->baseUrl . '/js/jquery-easyui-1.3.6/themes/bootstrap/easyui.css' );
	$cs->registerScriptFile( Yii::app()->baseUrl . '/js/jquery-easyui-1.3.6/jquery.easyui.min.js');	
	
	$cs->registerScriptFile(Yii::app()->baseUrl . '/js/ajaxupload/jquery.form.js', CClientScript::POS_HEAD);
	$cs->registerScriptFile(Yii::app()->baseUrl . '/js/ajaxupload/processupload.js',CClientScript::POS_HEAD );
	
?>
<div id="ddd" class="easyui-tabs" style="width:auto; height:540px;">
	
	
</div>
<script>

    $('#ddd').tabs({
		  
    });
	    // add a new tab panel
   
    $('#ddd').tabs('add',{
    		id:"#customer-info",
	       title:'Customer Information',
	       content:'Tab Body',
    	}
    );
    $('#ddd').tabs('add',{
    		id:"#customer-shipping",
	       title:'Customer shipping',
	       content:'Tab Body',
    	}
    );
</script>
