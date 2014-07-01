<?php 
	$this->pageTitle=Yii::app()->name;
	
	
	Yii::app()->clientScript->registerCoreScript('jquery');
	$cs = Yii::app()->clientscript;
	$cs->registerCssFile( Yii::app()->baseUrl . '/js/jquery-easyui/themes/icon.css' );							
	$cs->registerCssFile( Yii::app()->baseUrl . '/js/jquery-easyui/themes/bootstrap/easyui.css' );
	$cs->registerScriptFile( Yii::app()->baseUrl . '/js/jquery-easyui/jquery.easyui.min.js');	
	$cs->registerScriptFile( Yii::app()->baseUrl . '/js/jquery-easyui/jquery.crud.js');
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
                                    'url' => "javascript:addTab('New Supplier','".Yii::app()->request->baseUrl. "/setup/supplier/create/');"
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
		url:<?php echo "'".$this->createUrl('getSupplierLists')."'"?>,
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
			{title:"Contact",field:"contact",width:150,sortable:true},
			{title:"Phone",field:"phone",width:100,sortable:true},
                        {title:"Email",field:"email",width:140,sortable:true},
			{title:"Address",field:"address1",width:300,sortable:true},
			
		]],
		/*onDblClickRow:function(index,row,value){
			title = 'Customer: ' + row.first_name + ' ' + row.last_name;
			addTab(title, "<?php echo $this->createUrl('/setup/customers/general/?cust_id=');?>" + row.id);
		}*/
	});
</script>