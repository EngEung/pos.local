<?php 

	Yii::app()->clientScript->registerCoreScript('jquery');
	$cs = Yii::app()->clientscript;

	$cs->registerCssFile( Yii::app()->baseUrl . '/js/jquery-easyui-1.3.6/themes/icon.css' );							
	$cs->registerCssFile( Yii::app()->baseUrl . '/js/jquery-easyui-1.3.6/themes/bootstrap/easyui.css' );
	$cs->registerScriptFile( Yii::app()->baseUrl . '/js/jquery-easyui-1.3.6/jquery.easyui.min.js');	
	
	$cs->registerScriptFile(Yii::app()->baseUrl . '/js/ajaxupload/jquery.form.js', CClientScript::POS_HEAD);
	$cs->registerScriptFile(Yii::app()->baseUrl . '/js/ajaxupload/processupload.js',CClientScript::POS_HEAD );
	
?>
<div id="dd" class="easyui-tabs" style="width:auto; height:540px;">
	<div title="Customer Info">
	</div>
	<div title="Shipping">
	</div>
</div>
<script>

	function addTab(title, url){
		if ($('#dd').tabs('exists', title)){
			$('#dd').tabs('select', title);
		} else {
			var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
			$('#dd').tabs('add',{
				title:title,
				content:content,
				closable:true
			});
		}
	}
	
	addTab('Customer', '<?php $this->createUrl('/setup/customer/create/');?>');
</script>
