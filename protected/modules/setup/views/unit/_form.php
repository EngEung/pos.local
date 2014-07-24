<div  style="margin-left: -80px;">
<?php 
CHtml::$errorCss = 'fsgdfsgdfsfdsadgfqweas';
    /** @var TbActiveForm $form */
    $form = $this->beginWidget(
    'bootstrap.widgets.TbActiveForm',array(
    	'id' => 'itemUnitForm',
    	'type' => 'horizontal',
    	'enableClientValidation' => true,
	    'clientOptions' => array(
	             	'validationOnSubmit' => true,
	             	'validateOnChange' => true,
					'validateOnType' => true,
		),
   		'htmlOptions' => array('class' => 'well-small'), // for inset effect
   ));
   
?>		

		<fieldset>
			<legend style="margin: 0 0 0 80px;font-weight:bold; font-size: 14px; width:420px;">Unit Group Details</legend>
			<?php echo $form->textFieldRow($model, 'unitCode', array('placeholder' => '')); ?>
			<?php echo $form->textFieldRow($model, 'unitDescr', array('placeholder' => '')); ?>
		</fieldset>
		
		<fieldset>
			<legend style="margin: 0 0 0 80px;font-weight:bold; font-size: 14px; width:420px;">Unit Details</legend>
			<?php echo $form->textFieldRow($model, 'unitDetailCode', array('placeholder' => '')); ?>
			<?php echo $form->textFieldRow($model, 'unitDetailDescr', array('placeholder' => '')); ?>
			<div style="margin-left: 80px;">
				<table id="dgGroupDetail"></table>
			</div>
		</fieldset>
		
<?php    
    $this->endWidget();
    unset($form);
?>
</div>
<script>
	/** easyui gridView Javascript */
	dgGroupDetail = $("#dgGroupDetail");
	dgGroupDetail.datagrid({
		height:150,
		width:350,
		singleSelect:true,
		//url:'<?php echo $this->createUrl('getCategories')?>',
		toolbar: '#tb',
		idField: 'id',		
		scrollbarSize: 5,
		collapsible:true,
		columns:[[
			{title:"ID",field:"id",width:20,sortable:true},
            {title:"Name",field:"name",width:60,sortable:true},
            {title:"Description",field:"descr",width:100,sortable:true},
			
		]],
		onDblClickRow:function(index,row,value){
			title = 'Update Supplier: ' + row.name;
			addTab(title, "<?php echo $this->createUrl('/inventorycenter/supplier/update/?sup_id=');?>" + row.id);
		}
	});
	
	
</script>
