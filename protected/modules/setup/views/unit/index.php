<?php 
	$this->pageTitle=Yii::app()->name;
	Yii::app()->clientScript->registerCoreScript('jquery');
	$cs = Yii::app()->clientscript;
	$cs->registerCssFile( Yii::app()->baseUrl . '/js/jquery-easyui-1.3.6/themes/icon.css' );							
	$cs->registerCssFile( Yii::app()->baseUrl . '/js/jquery-easyui-1.3.6/themes/bootstrap/easyui.css' );
	$cs->registerScriptFile( Yii::app()->baseUrl . '/js/jquery-easyui-1.3.6/jquery.easyui.min.js');
	$cs->registerScriptFile( Yii::app()->baseUrl . '/js/jquery-easyui-1.3.6/jquery.crud.js');	
?>       
	<div class="pus" style="margin-top: 20px;">
		<table id="dgItemUnit"></table>
                <div id="tb" style="padding:5px;height:auto">
                    <div style="margin-bottom:5px">
                            <?php 
                            $this->widget('bootstrap.widgets.TbButton',array(
                                    'id'=>"btn-add",
                                    'label' => 'Add',
                                    'icon' => 'plus-sign',
                                    'size' => 'small'
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
                
                
                <?php 
						$this->beginWidget('ext.yii-easyui.widgets.EuiWindow', array(
							'id'=> 'unit-win',
							'title'=> 'Setup Item Unit',
							'style'=> 'width:470px; height:460px;',
							'closed' => true,
							
							'buttons' => '#dlg-buttons'	
						));
						
						$this->renderPartial('_form', array('model'=>$model));
						
						$this->endWidget(); 
						?>
						 <div id="dlg-buttons">
						 <?php 
						 	$this->widget('ext.yii-easyui.widgets.EuiLinkbutton', array(
								'id' => 'btn-save',		
								'text' => 'Save',
								'plain' => false
							));
						
							$this->widget('ext.yii-easyui.widgets.EuiLinkbutton', array(
								'id' => 'btn-cancel',		
								'text' => 'Cancel',
								'plain' => false				
							));
						?>	
	</div>
<script>
   
    /** easyui gridView Javascript */
	dgItemUnit = $("#dgItemUnit");
	dgItemUnit.datagrid({
		title:'Item Units List',
		height:400,
		singleSelect:true,
		nowrap:false,
		fitColumns:true,
		url:'<?php echo $this->createUrl('getItemUnits')?>',
		toolbar: '#tb',
		idField: 'id',		
		pagination: true,
		rownumbers: true,
		scrollbarSize: 5,
		ctrlSelect: true,
		collapsible:true,
		columns:[[
			{title:"ID",field:"id",width:20,sortable:true},
           	{title:"Code",field:"code",width:150,sortable:true},
            {title:"Description",field:"descr",width:200,sortable:true},
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
			items = {'code':rows[i].code, 'descr':rows[i].descr};
			ss.push(items);
		}
		$.ajax({
				url: '<?php echo $this->createUrl('createItemUnit');?>',
		        type: 'post',
		       	data: {unitGroupCode: $("#UnitForm_unitCode").val(), unitGroupDescr: $("#UnitForm_unitDescr").val(), items : JSON.stringify(ss), totalHour : $("#OverTimeForm_totalHour").val()},
		        dataType: 'json',
		        success: function (response) {
		      		//$.messager.alert('Sucess','Your action has been successfully.');
		      		refreshGrid();
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
	$('#unit-win').dialog('open');
	var row = dgItemUnit.datagrid('getSelected');
	if (row){
		$("#UnitForm_groupId").val(row.id);
		$("#UnitForm_unitCode").val(row.code);
		$("#UnitForm_unitDescr").val(row.descr);
		dgGroupDetail.datagrid({url: 'unit/getItemUnitDetail'});
		dgGroupDetail.datagrid('load',{code: row.code});
	}else{
		$.messager.alert('Error','No seleted.','warning');
	}
});	


function refreshGrid(){
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