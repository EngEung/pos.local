<?php /* @var $this Controller */ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="language" content="en" />
	<?php Yii::app()->bootstrap->registerAssetCss("bootstrap.css");?>	
</head>
<?php /* @var $this Controller */ ?>
<?php //$this->beginContent('//../modules/setup/views/layouts/layout_setup_main'); ?>

<div class="page-container row-fluid" >
	<div class="page-content">
		<div class="container-fluid">
				<div id="cc" class="easyui-layout" style="width: auto; height: 560px;">
				    <div data-options="region:'west',title:'Operation',split:true" style="width:250px;">
				    	<?php $this->widget('bootstrap.widgets.TbMenu',array(
				    		'type' => 'list',
				    		'items' => $this->getLeftMenu(), 
							));
				    	
				   	 	?>
				    </div>

				    <div data-options="region:'center',title:''" style="padding:5px;background:#eee;">
				    	<div id="tt" class="easyui-tabs" style="width:auto; height:500px;">
                             <?php echo $content; ?>
						</div>
				    </div>
				</div>
				
		</div>
	</div>
</div><!-- content -->
<?php //$this->endContent(); ?>
</body>
<style>	
	.container-fluid{padding: 0px;}
	.btn{margin-left: 5px;}
</style>

<script>
	function addTab(title, url){
		if ($('#tt').tabs('exists', title)){
			$('#tt').tabs('select', title);
		} else {
			var content = '<iframe scrolling="no" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
			$('#tt').tabs('add',{
				title:title,
				content:content,
				closable:true
			});
		}
        }
</script>
</html>