<?php
	$this->pageTitle=Yii::app()->name;
	$this->widget('bootstrap.widgets.TbBreadcrumbs', array(
	'links'=>array('Staff'=>$this->createUrl('/staff/overTime/'), 'Overtime Requests'),
	));
	
	Yii::app()->clientScript->registerCoreScript('jquery');
	$cs = Yii::app()->clientscript;						
	$cs->registerCssFile( Yii::app()->baseUrl . '/js/jquery-easyui/themes/bootstrap/easyui.css' );
	$cs->registerScriptFile( Yii::app()->baseUrl . '/js/jquery-easyui/jquery.easyui.min.js', CClientScript::POS_HEAD);
	$cs->registerScriptFile( Yii::app()->baseUrl . '/js/validationform.js');
?>
<table id="dg"></table>

<script>
var dgRowIndex = undefined;

var dg =$("#dg");

dg.datagrid({
	title: 'Approval Over Time',
	height:400,
	singleSelect:true,
	url : 'getOvertimeRequestHistory',
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
		
	]],
	
});



</script><?php
