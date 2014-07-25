<?php
	$this->pageTitle=Yii::app()->name;
	$this->widget('bootstrap.widgets.TbBreadcrumbs', array(
	'links'=>array('Staff'=>$this->createUrl('/staff/overTime/'), 'Overtime Approval'),
	));
	
	Yii::app()->clientScript->registerCoreScript('jquery');
	$cs = Yii::app()->clientscript;						
	$cs->registerCssFile( Yii::app()->baseUrl . '/js/jquery-easyui/themes/bootstrap/easyui.css' );
	$cs->registerScriptFile( Yii::app()->baseUrl . '/js/jquery-easyui/jquery.easyui.min.js', CClientScript::POS_HEAD);
	$cs->registerScriptFile( Yii::app()->baseUrl . '/js/validationform.js');
?>
<table id="dg"></table>

<?php 
$this->beginWidget('ext.yii-easyui.widgets.EuiWindow', array(
'title' => 'Overtime Approval',
	'id'=> 'windowForm',
	'style'=> 'width:880px',
	'closed' => true,
	'modal' => true,
	'buttons' => '#dlg-buttons'	// for button save
));?>
	<br/>
	<p style="margin-left: 10px;">Note : <?php $this->widget('bootstrap.widgets.TbLabel',array(
	    'type' => 'info',
	    // 'default', 'primary', 'success', 'info', 'warning', 'danger'
	    'label' => 'Time Scanners',
    ));?>
    
    <?php $this->widget('bootstrap.widgets.TbLabel',array(
	    'type' => 'default',
	    // 'default', 'primary', 'success', 'info', 'warning', 'danger'
	    'label' => 'Over Time',
	   'htmlOptions' => array('style' => 'background-color: #000000')
    ));?>
    </p>
	<table id="dgOTDetail"></table>
<?php $this->endWidget(); ?>

<script>
var dgRowIndex = undefined;

var dg =$("#dg");
var dgOTDetail = $("#dgOTDetail");
var formatter = function(value, ro){
					for(var i=0; i<_otType.length; i++){
						if (_otType[i].id == value) return _otType[i].type_name;
					}
					return value;
				}

dg.datagrid({
	title: 'Approval Over Time',
	height:400,
	singleSelect:true,
	url : 'getOverTimeApproved',
	nowrap:false,
	fitColumns:true,
	toolbar: '#tb',
	idField: 'employe_ot_id',		
	//pagination: true,
	rownumbers: true,
	scrollbarSize: 5,
	columns:[[
		{title:"OT ID",field:"employe_ot_id",width:5,"align":"center"},
		{title:"Requested Date",field:"requested_date",width:10},
		{title:"Employee Name",field:"request_name",width:10},
		{title:"Total (hours)",field:"total_hour", width:7},
		{title:"Status",field:"status", width:5},
		{title:"Approved By",field:"approved_by_name",width:15},
		{title:"employee_validation_rule_id",field:"employee_validation_rule_id", width:20, hidden:true},
		{title:"approved_no",field:"approved_no",width:100,hidden:true},
		{title:"is_final",field:"is_final",width:100,hidden:true},
		{field:'action',title:'Action',width:10,align:'center',
			formatter:function(value,row,index){
				var e = '<a id="btn-approved" title="Approve" class="btn btn-mini btn-primary" onclick="onApprove(this)">Approve</a>';
				var d = '<a id="btn-cacnel" title="Reject" class="btn btn-mini btn-danger" onclick="onCancelApprove(this)">Reject</a>';
				return e+d;
			}
		}
		
	]],
	onDblClickCell: function(index,field,value){
		onGetOvertimeDetails();
	}
});


dgOTDetail.datagrid({
	height:250,
	singleSelect:true,
	url : 'getOvertimeDetails',
	nowrap:false,
	fitColumns:true,
	toolbar: '#tb',
	idField: 'employe_ot_id',		
	//pagination: true,
	rownumbers: true,
	scrollbarSize: 5,
	columns:[[
		{title:"Type",field:"type_name",width:60,},
		{title:"OT Date",field:"ot_date",width:30,"align":"center"},
		{title:"From (am)",field:"from_time_am",width:30},
		{title:"To (am)",field:"to_time_am",width:30},
		{title:"From (pm)",field:"from_time_pm",width:30},
		{title:"To (pm)",field:"to_time_pm",width:30},
		{title:"Hours",field:"num_of_hour",width:18,},
		//{title:"Assigned By",field:"assigned_by", width:30},
		{title:"Activity",field:"activity",width:100,},
		{title:"Is Scan",field:"is_scan",width:100, hidden:true},
		
	]],
	 rowStyler: function(index,row){
		if (row.is_scan == 1){
			return 'color:#3a87ad;font-weight:bold;';
		}
	}
});

function getRowIndex(target){
	var tr = $(target).closest('tr.datagrid-row');
	return parseInt(tr.attr('datagrid-row-index'));
}

function onCancelApprove(e){
	var row = getRowIndex(e);
	var rows = dg.datagrid('getRows');
	employeeOTId = rows[row].employe_ot_id;
	approvedNo = rows[row].approved_no;
	isFinal = rows[row].is_final;
	employeeId = rows[row].employee_id;
	$.ajax({
				url: '<?php echo $this->createUrl('overtimeReject');?>',
		        type: 'post',
		       	data: {employee_ot_Id: employeeOTId, employee_id : employeeId, approved_no : approvedNo},
		        dataType: 'json',
		        success: function (response) {
		        	if(response){
			      		$.messager.alert('Sucess','Your action has been successfully.');
			      		refreshGrid(dg);
		      		}
		      		else{
		      			$.messager.alert('Error','Error occured.please try again.','warning');
		      		}
		       	},
		       erorr: function (){
		       		$.messager.alert('Error','Error occured.please try again.','warning');
		       }
		});
}
function onApprove(e){
	var row = getRowIndex(e);
	var rows = dg.datagrid('getRows');
	employeeOTId = rows[row].employe_ot_id;
	employeeValidationRuleId = rows[row].employee_validation_rule_id;
	approvedNo = rows[row].approved_no;
	isFinal = rows[row].is_final;
	employeeId = rows[row].employee_id;
	$.ajax({
				url: '<?php echo $this->createUrl('overtimeApprovaled');?>',
		        type: 'post',
		       	data: {employee_ot_Id: employeeOTId, employee_validation_rule_id : employeeValidationRuleId, 
		       		   approved_no : approvedNo, is_final: isFinal, employee_id : employeeId},
		        dataType: 'json',
		        success: function (response) {
		        	if(response){
		      			$.messager.alert('Sucess','Your action has been successfully.');
		      			refreshGrid(dg);
		      		}
		      		else{
		      			$.messager.alert('Error','Error occured.please try again.','warning');
		      		}
		       	},
		       erorr: function (){
		       		$.messager.alert('Error','Error occured.please try again.','warning');
		       }
		});
}

function onGetOvertimeDetails(){
	var row = dg.datagrid('getSelected');
	$('#windowForm').window({title:'Overtime Details: '+row.request_name,iconCls:'icon-share'});
	$('#windowForm').window('open');
	
	dgOTDetail.datagrid('load',{otId: row.employe_ot_id, isFinal : row.is_final});
}


$("#btn-save").click(function(){
	var count = dg.datagrid('getData').total;
	if(count > 0){
		var ss = [];
		var rows = dg.datagrid('getRows');
		for(i=0;i<rows.length;i++){
			items = {'type':rows[i].type, 'date':rows[i].date, 'from_time':rows[i].from_time, 'to_time':rows[i].to_time, 
					 'num_of_hour':rows[i].total_hour, 'activity': rows[i].activity};
			ss.push(items);
		}
		$.ajax({
				url: '<?php echo $this->createUrl('addOverTime');?>',
		        type: 'post',
		       	data: {requestedDate: $("#OverTimeForm_requestedDate").val(), items : JSON.stringify(ss), totalHour : $("#OverTimeForm_totalHour").val()},
		        dataType: 'json',
		        success: function (response) {
		        	if(response){
			      		$.messager.alert('Sucess','Your action has been successfully.');
			      		refreshGrid(dg);
		      		}else{
		      			$.messager.alert('Error','Error occured.please try again.','warning');
		      		}
		       	},
		       erorr: function (){
		       		$.messager.alert('Error','Error occured.please try again.','warning');
		       }
		});
	}else{
		$.messager.alert('Error','Please insert data.','warning');
	}
});



function resetForm(e){
	$(':input',e)
	 .val('')
 	.removeAttr('checked')
 	.removeAttr('selected');
 	e[0].reset(); 
}	

function refreshGrid(controll){
	$('#dg').datagrid('clearSelections');
	$('#dg').datagrid('reload');
}
</script>