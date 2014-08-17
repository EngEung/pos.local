<div  style="margin-left: -80px;">
<?php 
CHtml::$errorCss = 'fsgdfsgdfsfdsadgfqweas';
    /** @var TbActiveForm $form */
    $form = $this->beginWidget(
    'bootstrap.widgets.TbActiveForm',array(
    	'id' => 'itemsizeForm',
    	'type' => 'horizontal',
    	'enableClientValidation' => true,
	    'clientOptions' => array(
	             	'validationOnSubmit' => true,
	             	'validateOnChange' => true,
					'validateOnType' => true,
		),
   		'htmlOptions' => array('class' => 'well-small', 'style' => 'margin-left:80px;'), // for inset effect
   ));
   
?>		
		
		<fieldset>
			<legend style="margin: 0 0 0 -5px;font-weight:bold; font-size: 14px; width:540px;">Unit Group Details</legend>
			<?php echo $form->textFieldRow($model, 'unitGroupDetailCode', array('placeholder' => '', 'style' => 'width:120px;')); ?>
			<?php echo $form->textFieldRow($model, 'unitGroupDetailDescr', array('placeholder' => '')); ?>
		</fieldset>
		
		<fieldset>
			<legend style="margin: 0 0 0 -5px;font-weight:bold; font-size: 14px; width:540px;">size Group Details</legend>
			<?php echo $form->textFieldRow($model, 'sizeCode', array('placeholder' => '')); ?>
			<?php echo $form->textFieldRow($model, 'sizeDescr', array('placeholder' => '')); ?>
		</fieldset>
		
		<fieldset>
			<legend style="margin: 0 0 0 -5px;font-weight:bold; font-size: 14px; width:540px;">size Details</legend>
			<?php echo $form->textFieldRow($model, 'sizeDetailCode', array('placeholder' => '')); ?>
			<?php echo $form->textFieldRow($model, 'sizeDetailDescr', array('placeholder' => '')); ?>
			
		</fieldset>
		
<?php    
    $this->endWidget();
    unset($form);
?>
</div>
<script>
$("#btn-save-detail").click(function(){
	var count = dgGroupDetail.datagrid('getData').total;
	if(count > 0){
		var ss = [];
		var rows = dgGroupDetail.datagrid('getRows');
		for(i=0;i<rows.length;i++){
			items = {'name':rows[i].name, 'descr':rows[i].descr};
			ss.push(items);
		}
		$.ajax({
				url: '<?php echo $this->createUrl('addItemsize');?>',
		        type: 'post',
		       	data: {sizeGroupCode: $("#sizeForm_sizeCode").val(), sizeGroupDescr: $("#sizeForm_sizeDescr").val(), items : JSON.stringify(ss), totalHour : $("#OverTimeForm_totalHour").val()},
		        dataType: 'json',
		        success: function (response) {
		      		$.messager.alert('Sucess','Your action has been successfully.');
		      		refreshGrid(dg);
		      		resetForm($("#OverTimeForm"));
		       	},
		       erorr: function (){
		       		$.messager.alert('Error','Error occured.please try again.','warning');
		       }
		});
	}else{
		$.messager.alert('Error','Please insert data.','warning');
	}
});

$("#btn-add-detail").click(function(){
	//if(onValidateForm()){	
		var help = false;
		var help = checkInsertRowAlready($("#sizeForm_sizeDetailCode").val(), $("#sizeForm_sizeDetailDescr").val());
		
		if(help){
			$.messager.alert('Error','This data has been inserted already.','warning');
		}else{
			var column = {
					name: $("#sizeForm_sizeDetailCode").val(),
					descr: $("#sizeForm_sizeDetailDescr").val()
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
		$("#sizeForm_sizeDetailCode").val(row.name);
		$("#sizeForm_sizeDetailDescr").val(row.descr);
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
