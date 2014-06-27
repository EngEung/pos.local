<?php
$this->breadcrumbs=array(
	$this->module->id,
);

        Yii::app()->clientScript->registerCoreScript('jquery');
	$cs = Yii::app()->clientscript;

	$cs->registerCssFile( Yii::app()->baseUrl . '/js/jquery-easyui-1.3.6/themes/icon.css' );							
	$cs->registerCssFile( Yii::app()->baseUrl . '/js/jquery-easyui-1.3.6/themes/bootstrap/easyui.css' );
	$cs->registerScriptFile( Yii::app()->baseUrl . '/js/jquery-easyui-1.3.6/jquery.easyui.min.js');	
?>
<h1><?php echo $this->uniqueId . '/' . $this->action->id; ?></h1>

<p>
This is the view content for action "<?php echo $this->action->id; ?>".
The action belongs to the controller "<?php echo get_class($this); ?>" in the "<?php echo $this->module->id; ?>" module.
</p>
<p>
You may customize this page by editing <tt><?php echo __FILE__; ?></tt>

<script>
      function addTab12(title, url){
		if ($('#tt12').tabs('exists', title)){
			$('#tt12').tabs('select', title);
		} else {
			var content ='<iframe scrolling="yes" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
			$('#tt12').tabs('add',{
                            title:title,
                            content:content,
                            closable:true
			});
		}
	}
</script>