<?php /* @var $this Controller */ ?>
<?php $this->beginContent('//layouts/main'); ?>

<div class="page-container row-fluid" >
	<div class="page-content">
		<div class="container-fluid">
				<div id="cc" class="easyui-layout" style="width: auto; height: 560px;">
				    <div data-options="region:'west',title:'Managin Customers',split:true" style="width:250px;">
				    	<?php $this->widget('bootstrap.widgets.TbMenu',array(
				    		'type' => 'list',
				    		'items' => $this->getLeftMenu(), 
							));
				    	
				   	 	?>
				    </div>
				    <div data-options="region:'center',title:'Welcome'" style="padding:5px;background:#eee;">
				    	<div id="tt" class="easyui-tabs" style="width:auto; height:540px;">
							<div title="Customer Lists">
								<div class="pus" style="margin-top: 20px;">
									<table id="dg"></table>
										<div id="tb" style="padding:5px;height:auto">
											<div style="margin-bottom:5px">
												<?php 
												$this->widget('bootstrap.widgets.TbButton',array(
													'id'=>"btn-add",
													'label' => 'Add',
													'icon' => 'plus-sign',
													'size' => 'small',
													'url' => "javascript:addTab('New Customer','/setup/customers/create/');"
												));
												
												$this->widget('bootstrap.widgets.TbButton',array(
													'id'=>"btn-edit",
													'label' => 'Edit',
													'icon' => 'pencil',
													'size' => 'small',
												));
												
												$this->widget('bootstrap.widgets.TbButton',array(
													'id'=>"btn-remove",
													'label' => 'Remove',
													'icon' => 'remove-sign',
													'size' => 'small',
												));
												
												$this->widget('bootstrap.widgets.TbButton',array(
													'id'=>"btn-refresh",
													'label' => 'Refresh',
													'icon' => 'refresh',
													'size' => 'small',
												));
											?>    	
											</div>
										</div>
								</div>
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
	.btn{margin-left: 5px;}
</style>

<script>
	/** easyui gridView Javascript */
	dg = $("#dg");
	dg.datagrid({
		title:'',
		height:400,
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
			{title:"ID",field:"id",width:10,sortable:true},
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