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
			<?php echo $form->hiddenField($model, 'groupId', array('placeholder' => '')); ?>
			
		</fieldset>
		
		<fieldset>
			<legend style="margin: 0 0 0 80px;font-weight:bold; font-size: 14px; width:420px;">Unit Details</legend>
			
			<?php echo $form->textFieldRow($model, 'unitDetailCode', array('placeholder' => '')); ?>
			<?php echo $form->textFieldRow($model, 'unitDetailDescr', array('placeholder' => '')); ?>
			<div style="margin-left: 80px; width: 430px;">
				<div style="float: left; width: 360px;">
					<table id="dgGroupDetail"></table>
				</div>
				<div style="float: left; width: 60px; margin: -125px 0 0  360px;">
					<?php 
						$this->widget('bootstrap.widgets.TbButton',array(
							'id'=>"btn-add-detail",
							'label' => 'Add',
							'size' => 'mini',
								'htmlOptions' => array('style' => 'margin-top:5px; width:40px;')
						));?>
						<?php 
						$this->widget('bootstrap.widgets.TbButton',array(
							'id'=>"btn-edit-detail",
							'label' => 'Edit',
							'size' => 'mini',
							'htmlOptions' => array('style' => 'margin-top:5px;width:40px;')
						));?>
						<?php 
						$this->widget('bootstrap.widgets.TbButton',array(
							'id'=>"btn-remove-detail",
							'label' => 'Remove',
							'size' => 'mini',
							'htmlOptions' => array('style' => 'margin-top:5px;width:40px;')
						));?>
						
						<?php 
						$this->widget('bootstrap.widgets.TbButton',array(
							'id'=>"btn-cancel-detail",
							'label' => 'Cancel',
							'size' => 'mini',
							'htmlOptions' => array('style' => 'margin-top:5px;width:40px;')
						));?>
				</div>
			</div>
			<?php echo $form->hiddenField($model, 'detailId', array('placeholder' => '')); ?>
		</fieldset>
		
<?php    
    $this->endWidget();
    unset($form);
?>
</div>
<script>
var dgRowIndex = undefined;
	/** easyui gridView Javascript */
	dgGroupDetail = $("#dgGroupDetail");
	dgGroupDetail.datagrid({
		height:120,
		width:350,
		singleSelect:true,
		idField: 'id',		
		scrollbarSize: 5,
		collapsible:true,
		columns:[[
			{title:"ID",field:"id",width:20,sortable:true},
            {title:"Code",field:"code",width:100,sortable:true},
            {title:"Description",field:"descr",width:200,sortable:true},
			
		]],
		onDblClickRow:function(index,row,value){
			title = 'Update Supplier: ' + row.name;
			addTab(title, "<?php echo $this->createUrl('/inventorycenter/supplier/update/?sup_id=');?>" + row.id);
		}
	});


$("#btn-add-detail").click(function(){
	//if(onValidateForm()){	
		var help = false;
		var help = checkInsertRowAlready($("#UnitForm_unitDetailCode").val(), $("#UnitForm_unitDetailDescr").val());
		
		if(help){
			$.messager.alert('Error','This data has been inserted already.','warning');
		}else{
			var column = {
					id: $("#UnitForm_detailId").val(),
					code: $("#UnitForm_unitDetailCode").val(),
					descr: $("#UnitForm_unitDetailDescr").val()
				};
			if(dgRowIndex != undefined){
				dgGroupDetail.datagrid('deleteRow', dgRowIndex);
				dgGroupDetail.datagrid('insertRow', {
					index: dgRowIndex,
					row:column
				});
			}else{
				dgGroupDetail.datagrid('appendRow',column);
			}
		}
		toggleButton('add');
	//	}
	dgRowIndex = undefined;
});	

$("#btn-remove-detail").click(function(){
	var selectedrow = dgGroupDetail.datagrid("getSelected");
    var rowIndex = dgGroupDetail.datagrid("getRowIndex", selectedrow);
	deleterow(rowIndex);
});

function deleterow(index){
	$.messager.confirm('Confirm','Are you sure?',function(r){
		if (r){
			dgGroupDetail	.datagrid('deleteRow', index);
		}
	});
}

$("#btn-edit-detail").click(function(){
	var row = dgGroupDetail.datagrid('getSelected');
	dgRowIndex = dgGroupDetail.datagrid("getRowIndex", row);
	
	if (row){
		$("#UnitForm_detailId").val(row.id);
		$("#UnitForm_unitDetailCode").val(row.code);
		$("#UnitForm_unitDetailDescr").val(row.descr);
		toggleButton("edit");
	}else{
		$.messager.alert('Error','No seleted.','warning');
	}
});

$("#btn-cancel-detail").click(function(){
	toggleButton('cancel');
});

function checkInsertRowAlready(name, descr){
	var help = false;
	var count = dgGroupDetail.datagrid('getData').total;
	
	if(count ==0) return false;
	var rows = dgGroupDetail.datagrid('getRows');
	for(i=0;i<rows.length;i++){
		if(i != dgRowIndex){
			if(rows[i].code == name && rows[i].descr == descr){
				help = true;
				break;
			}
		}
	}
	return help;
	
}


function toggleButton(toggle){
	switch(toggle){
		case "edit":
			$("#btn-edit-detail").attr('disabled', 'disabled');
			$("#btn-remove-detail").attr('disabled', 'disabled');
			$("#btn-save-detail").attr('disabled', 'disabled');
			$("#btn-add-detail").removeAttr('disabled');
		break;
		case "cancel":
			$("#btn-edit-detail").removeAttr('disabled');
			$("#btn-remove-detail").removeAttr('disabled');
			$("#btn-add-detail").removeAttr('disabled');
			$("#btn-save-detail").removeAttr('disabled');
			dgRowIndex = undefined;
		break;
		case "add":
			$("#btn-edit-detail").removeAttr('disabled');
			$("#btn-remove-detail").removeAttr('disabled');
			$("#btn-add-detail").removeAttr('disabled');
			dgRowIndex = undefined;
			//resetForm($("#OverTimeForm"));
		break;
	}
}


	
</script>
