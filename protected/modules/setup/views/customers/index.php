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

<div style="margin-bottom:10px">
		<!--
		<a href="#" class="easyui-linkbutton" onclick="addTab('General','<?php echo $this->createUrl('create')?>')">google</a>
		-->
		</div>
<div id="cc" class="easyui-layout" style="width:1200px;height:500px;">
    <div data-options="region:'east',title:'East',split:true" style="width:100px;"></div>
    <div data-options="region:'west',title:'Managin Customers',split:true" style="width:200px;"></div>
    <div data-options="region:'center',title:''" style="padding:5px;background:#eee;">
    	<div id="tt" class="easyui-tabs" style="width:auto;height:480px;">
			
		</div>
    </div>
</div>

<script>
		function addTab(title, url){
			if ($('#tt').tabs('exists', title)){
				$('#tt').tabs('select', title);
			} else {
				var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
				$('#tt').tabs('add',{
					title:title,
					content:content,
					closable:true
				});
			}
		}
	</script>