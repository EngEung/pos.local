<?php 
	$this->pageTitle=Yii::app()->name;
	
	
	Yii::app()->clientScript->registerCoreScript('jquery');
	$cs = Yii::app()->clientscript;
	$cs->registerCssFile( Yii::app()->baseUrl . '/js/jquery-easyui-1.3.6/themes/icon.css' );							
	$cs->registerCssFile( Yii::app()->baseUrl . '/js/jquery-easyui-1.3.6/themes/bootstrap/easyui.css' );
	$cs->registerScriptFile( Yii::app()->baseUrl . '/js/jquery-easyui-1.3.6/jquery.easyui.min.js');	
?>
  <div title="Suppliers">        
	<div class="pus" style="margin-top: 20px;">
		<table id="dgSupplier"></table>
                <div id="tb" style="padding:5px;height:auto">
                    <div style="margin-bottom:5px">
                            <?php 
                            $this->widget('bootstrap.widgets.TbButton',array(
                                    'id'=>"btn-add",
                                    'label' => 'Add',
                                    'icon' => 'plus-sign',
                                    'size' => 'small',
                                    'url' => "javascript:addTab('New Supplier','".Yii::app()->request->baseUrl. "/inventorycenter/supplier/create/');"
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
	dgSupplier = $("#dgSupplier");
	dgSupplier.datagrid({
		title:'Supplier List',
		height:400,
		singleSelect:true,
		//nowrap:false,
		//fitColumns:true,
		url:'<?php echo $this->createUrl('getSupplierLists')?>',
		toolbar: '#tb',
		idField: 'id',		
		//pagination: true,
		//rownumbers: true,
		//scrollbarSize: 5,
		//ctrlSelect: true,
		//collapsible:true,
		columns:[[
			{title:"ID",field:"id",width:40,sortable:true},
                        {title:"Account Number",field:"account_number",width:100,sortable:true},
			{title:"Name",field:"name",width:150,sortable:true},
                        {title:"Code",field:"code",width:100,sortable:true},
			{title:"Contact",field:"contact",width:100,sortable:true},
			{title:"Phone",field:"phone",width:100,sortable:true},
                        {title:"Email",field:"email",width:150,sortable:true},
			{title:"Address",field:"address1",width:250,sortable:true},
			
		]],
		onDblClickRow:function(index,row,value){
			title = 'Update Supplier: ' + row.name;
			addTab(title, "<?php echo $this->createUrl('/inventorycenter/supplier/update/?sup_id=');?>" + row.id);
		}
	});
	

	$('#btn-refresh').click(function(){
		refreshGrid();
	});
	
	
	$('#btn-edit').click(function(){
		var row = dgSupplier.datagrid('getSelected');
		if(row){
			title = 'Update Supplier: ' + row.name;
			addTab(title, "<?php echo $this->createUrl('/inventorycenter/supplier/update/?sup_id=');?>" + row.id);
		}
	});
	

	function refreshGrid(){
		dgSupplier.datagrid('clearSelections');
		dgSupplier.datagrid('reload');	
	}
		
	$("#btn-remove").click(function(){
		onRemove();
	});
	
	function onRemove(){
		var row = dgSupplier.datagrid('getSelected');
		if (row){
			$.messager.confirm('Remove Supplier', 'Are you sure you want to remove?', function(r){
			if (r){
				$.ajax({
					url: '<?php echo $this->createUrl('/inventorycenter/supplier/remove');?>',
			        type: 'get',
			        data: {id: row.id},
			        dataType: 'json',
			        success: function (response) {
						if(response == false){
							$.messager.alert('Error','Error occured.please try again.','warning');
						}else{
							refreshGrid();
						}
			       },
			       erorr: function (){
			       		$.messager.alert('Error','Error occured.please try again.','warning');
			       }
				});
			}
			});
		}else{
			$.messager.alert('Alert','No records selected.', 'alert');
		}
	}
</script>