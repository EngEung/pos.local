<?php 
	$this->pageTitle=Yii::app()->name;
	
	
	Yii::app()->clientScript->registerCoreScript('jquery');
	$cs = Yii::app()->clientscript;
	$cs->registerCssFile( Yii::app()->baseUrl . '/js/jquery-easyui/themes/icon.css' );							
	$cs->registerCssFile( Yii::app()->baseUrl . '/js/jquery-easyui/themes/bootstrap/easyui.css' );
	$cs->registerScriptFile( Yii::app()->baseUrl . '/js/jquery-easyui/jquery.easyui.min.js');	
	$cs->registerScriptFile( Yii::app()->baseUrl . '/js/jquery-easyui/jquery.crud.js');
?>
 <div id="tt" class="easyui-tabs" style="width:auto; height:540px;">
                      <div title="Suppliers">
                
	<div class="pus" style="margin-top: 20px;">
		<table id="dg"></table>
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
<script>
    /** easyui gridView Javascript */
	dg = $("#dg");
	dg.datagrid({
		title:'Supplier List',
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
		ctrlSelect: true,
		collapsible:true,
		columns:[[
			{title:"ID",field:"id",width:10,sortable:true},
			{title:"First Name",field:"first_name",width:100,sortable:true},
			{title:"Last Name",field:"last_name",width:100,sortable:true},
			{title:"Type",field:"customer_type_name",width:80,sortable:true},
			{title:"Phone",field:"phone1",width:120,sortable:true},
			{title:"Address",field:"address",width:120,sortable:true},
			
		]],
		onDblClickRow:function(index,row,value){
			title = 'Customer: ' + row.first_name + ' ' + row.last_name;
			addTab(title, "<?php echo $this->createUrl('/setup/customers/general/?cust_id=');?>" + row.id);
		}
	});
</script>