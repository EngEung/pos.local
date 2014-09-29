<?php 
	$this->pageTitle=Yii::app()->name;
	Yii::app()->clientScript->registerCoreScript('jquery');
	$cs = Yii::app()->clientscript;
	$cs->registerCssFile( Yii::app()->baseUrl . '/js/jquery-easyui-1.3.6/themes/icon.css' );							
	$cs->registerCssFile( Yii::app()->baseUrl . '/js/jquery-easyui-1.3.6/themes/bootstrap/easyui.css' );
	$cs->registerScriptFile( Yii::app()->baseUrl . '/js/jquery-easyui-1.3.6/jquery.easyui.min.js');
	$cs->registerScriptFile( Yii::app()->baseUrl . '/js/jquery-easyui-1.3.6/jquery.crud.js');	
?>       
<?php echo $this->renderPartial('/render/_dataGrid');?>
<div id="winItemCode" class="easyui-window" title="Basic Window" data-options="iconCls:'icon-save'" style="width:500px;height:200px;padding:10px;"></div>

<script>
   
    /** easyui gridView Javascript */
	dgItemUnit = $("#dg");
	dgItemUnit.datagrid({
		title:'Item Codes List',
		height:400,
		width:700,
		singleSelect:true,
		nowrap:false,
		fitColumns:true,
		url:'<?php echo $this->createUrl('getItemCodes')?>',
		toolbar: '#tb',
		idField: 'id',		
		pagination: true,
		rownumbers: true,
		scrollbarSize: 5,
		ctrlSelect: true,
		collapsible:true,
		columns:[[
			{title:"Item Code",field:"id",width:70,sortable:true},
           	{title:"Description",field:"code",width:150,sortable:true},
            {title:"Item Type",field:"descr",width:150,sortable:true},
            {title:"Category",field:"descr",width:150,sortable:true},
			{title:"Created At",field:"created_at",width:150,sortable:true},
			{title:"Created By",field:"created_by",width:150,sortable:true}	
			
		]],
	});
	
	$('#btn-add').click(function(){
		$('#unit-win').dialog('open');
		resetForm($("#itemUnitForm"));
		clearGrid(dgGroupDetail);
	});
	$('#btn-cancel').click(function(){
		$('#unit-win').dialog('close');
	});	
	
	
$("#btn-save").click(function(){
	var count = dgGroupDetail.datagrid('getData').total;
	if(count > 0){
		var ss = [];
		var rows = dgGroupDetail.datagrid('getRows');
		for(i=0;i<rows.length;i++){
			items = {'id': rows[i].id, 'code':rows[i].code, 'descr':rows[i].descr, 'deleted':rows[i].deleted};
			ss.push(items);
		}
		$.ajax({
				url: '<?php echo $this->createUrl('createItemUnit');?>',
		        type: 'post',
		       	data: {unitGroupId : $("#UnitForm_groupId").val(),unitGroupCode: $("#UnitForm_unitCode").val(), unitGroupDescr: $("#UnitForm_unitDescr").val(), items : JSON.stringify(ss), totalHour : $("#OverTimeForm_totalHour").val()},
		        dataType: 'json',
		        success: function (response) {
		      		//$.messager.alert('Sucess','Your action has been successfully.');
		      		refreshGrid(dgItemUnit);
		      		$('#unit-win').dialog('close');
		       	},
		       erorr: function (){
		       		$.messager.alert('Error','Error occured.please try again.','warning');
		       }
		});
	}else{
		$.messager.alert('Error','Please insert data.','warning');
	}
});	


$("#btn-edit").click(function(){
	
	var row = dgItemUnit.datagrid('getSelected');
	if (row){
		$('#unit-win').dialog('open');
		$("#UnitForm_groupId").val(row.id);
		$("#UnitForm_unitCode").val(row.code);
		$("#UnitForm_unitDescr").val(row.descr);
		dgGroupDetail.datagrid({url: 'unit/getItemUnitDetail'});
		dgGroupDetail.datagrid('load',{code: row.code});
	}else{
		$.messager.alert('Error','No seleted.','warning');
	}
});	


function refreshGrid(dgItemUnit){
	dgItemUnit.datagrid('clearSelections');
	dgItemUnit.datagrid('reload');
}

function clearGrid(dgGroupDetail){
	dgGroupDetail.datagrid('loadData', {"total":0,"rows":[]});
}

function resetForm(e){
	$(':input',e)
	 .val('')
 	.removeAttr('checked')
 	.removeAttr('selected');
 	e[0].reset(); 
}		
</script>