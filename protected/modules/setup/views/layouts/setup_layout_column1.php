<?php /* @var $this Controller */ ?>
<?php $this->beginContent('//layouts/main'); ?>

<div class="page-container row-fluid" >
	<div class="page-content">
		<div class="container-fluid">
				<div id="cc" class="easyui-layout" style="width:auto;height:500px;">
				    <div data-options="region:'west',title:'Managin Customers',split:true" style="width:250px;">
				    	<?php $this->widget('bootstrap.widgets.TbMenu',array(
				    		'type' => 'list',
				    		'items' => $this->getLeftMenu(), 
							));
				    	
				   	 	?>
				    </div>
				    <div data-options="region:'center',title:''" style="padding:5px;background:#eee;">
				    	<div id="tt" class="easyui-tabs" style="width:auto;height:480px;">
							<div title="Customer Lists">
								<br />
								<table id="dg"></table>
							</div>
						</div>
				    </div>
				</div>
				<?php //echo $content; ?>
		</div>
	</div>
</div><!-- content -->
<?php $this->endContent(); ?>

<style>
	
	.container-fluid{padding: 0px;}
</style>
<script>

	/** easyui gridView Javascript */
	dg = $("#dg");
	dg.datagrid({
		title:'',
		height:200,
		singleSelect:true,
		nowrap:false,
		fitColumns:true,
		url:<?php echo "'".$this->createUrl('getCustomerLists')."'"?>,
		toolbar: '#tb',
		idField: 'id',		
		pagination: true,
		rownumbers: true,
		scrollbarSize: 5,
		columns:[[
			{title:"ID",field:"id",width:5,sortable:true},
			{title:"First Name",field:"first_name",width:100,sortable:true},
			{title:"Last Name",field:"last_name",width:100,sortable:true},
			{title:"Type",field:"customer_type_name",width:80,sortable:true},
			{title:"Phone",field:"phone1",width:120,sortable:true},
			
		]]
	});

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