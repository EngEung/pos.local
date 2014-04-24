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
	$cs->registerScriptFile(Yii::app()->baseUrl . '/js/masktextbox/masktextbox.js',CClientScript::POS_HEAD );
?>
<div style="margin-bottom:10px">
		<a href="#" class="easyui-linkbutton" onclick="addTab('google','http://www.google.com')">google</a>
		<a href="#" class="easyui-linkbutton" onclick="addTab('jquery','http://jquery.com/')">jquery</a>
		<a href="#" class="easyui-linkbutton" onclick="addTab('easyui','http://jeasyui.com/')">easyui</a>
		<a href="#" class="easyui-linkbutton" onclick="addTab('twitter','http://twitter.com/')">easyui</a>
		<a href="#" class="easyui-linkbutton" onclick="addTab('fb','http://fb.com/')">easyui</a>
		<a href="#" class="easyui-linkbutton" onclick="addTab('dd','http://fb.com/')">easyui</a>
	</div>
<div id="cc" class="easyui-layout" style="width:1200px;height:600px;">
    <div data-options="region:'east',title:'East',split:true" style="width:100px;"></div>
    <div data-options="region:'west',title:'Managin Customers',split:true" style="width:200px;"></div>
    <div data-options="region:'center',title:''" style="padding:5px;background:#eee;">
    	<div id="tt" class="easyui-tabs" style="width:auto;height:auto;">
			<div title="Home">
			</div>
		</div>
    	<div id="p" class="easyui-panel" title="Create a new customer" style="width:730px;height:545px;padding-top:10px;"
			data-options="collapsible:true,minimizable:false,maximizable:true, closable:false, buttons:'#dlg-buttons'">
			<?php echo $this->renderPartial('_form', array('model' => $model));?>
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