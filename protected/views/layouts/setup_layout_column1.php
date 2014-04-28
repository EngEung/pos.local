<?php /* @var $this Controller */ ?>
<?php $this->beginContent('//layouts/main'); ?>

<div class="page-container row-fluid" >
	<div class="page-content">
		<div class="container-fluid">
			<div class="row-fluid">
				<div id="cc" class="easyui-layout" style="width:1340px;height:500px;">
				    <div data-options="region:'west',title:'Managin Customers',split:true" style="width:200px;">
				    	<?php $this->widget('bootstrap.widgets.TbMenu',array(
				    		'type' => 'list',
				    		'items' => $this->getLeftMenu(), 
							));
				    	
				   	 	?>
				    </div>
				    <div data-options="region:'center',title:''" style="padding:5px;background:#eee;">
				    	<div id="tt" class="easyui-tabs" style="width:auto;height:480px;">
							
						</div>
				    </div>
				</div>
				<?php //echo $content; ?>
			</div>
		</div>
	</div>
</div><!-- content -->
<?php $this->endContent(); ?>
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