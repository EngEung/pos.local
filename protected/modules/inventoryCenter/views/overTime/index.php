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

<div id="p" class="easyui-panel" title="Over Time Requests" style="width:1080px;height:900px;padding:10px;">
	
	<?php 
	    /** @var TbActiveForm $form */
	    $form = $this->beginWidget(
	    'bootstrap.widgets.TbActiveForm',array(
	    	'id' => 'OverTimeForm',
	    	'type' => 'horizontal',
	    	'enableClientValidation' => true,
			'clientOptions' => array(
						'validationOnSubmit' => true,
						'validateOnChange' => true,
						'validateOnType' => true,
			),
	   ));
	?>	
	<table style="width: 600px; margin-left: 50px;">
		<tr>
			<td><?php echo $form->labelEx($model,'employeeId'); ?></td>
			<td><?php echo $model->employeeId;?></td>
			<td><?php echo $form->labelEx($model,'fullName'); ?></td>
			<td><?php echo $model->fullName;?></td>
		</tr>
		<tr>
			<td><?php echo $form->labelEx($model,'position'); ?></td>
			<td><?php echo $model->position;?></td>
			<td><?php echo $form->labelEx($model,'cardId'); ?></td>
			<td><?php echo $model->cardId;?></td>
		</tr>
	</table>
	<hr style="border-color: #0088cc;"/>
			<div style="">
				<?php echo $form->hiddenField($model, 'otId');?>
				<?php echo $form->textFieldRow($model, 'requestedDate', array('style' => 'width:235px;')); ?>
				<?php //echo $form->dropDownListRow($model, 'assignById', $model->otTypes, array('empty'=>'--Select--'));?>
				<?php echo $form->dropDownListRow($model, 'otTypeId', $model->otTypes, array('style' => 'width:245px;','empty'=>'--Select--'));?>
				<?php echo $form->datepickerRow($model,'otDate',array('style' => 'width:210px;', 'prepend' => '<li class="icon-calendar"></li>', 'options' => array( 'format'=>'yyyy-mm-dd'))); ?>
				<?php echo $form->radioButtonListInlineRow($model, 'timezone',
					array('All' => 'All',  'AM' => 'AM', 'PM' => 'PM')); ?>
				<div id="timeAM">
					<div style="float: left; width: 150px;" >
						<?php echo $form->timePickerRow($model,'fromTime',array('hint' => '',
								  'prepend' => '<li class="icon-time"></li>',
								  'style' => 'width:60px;',
								  'options' => array('showMeridian' => true, 'defaultTime'=> '8:00 AM')
							)); ?>
					</div>
					<div style="float: left;" >
						<?php echo $form->timePickerRow($model,'toTime',array('hint' => '',
								  'prepend' => '<li class="icon-time"></li>',
								  'style' => 'width:60px;',
								  'options' => array('showMeridian' => true, 'defaultTime'=> '12:00 PM',)
							)); ?>
					</div>
				</div><div style="clear: both;"></div>
				<div id ="timePM">
					<div style="float: left; width: 150px;">
						<?php echo $form->timePickerRow($model,'formTimePm',array('hint' => '',
								  'prepend' => '<li class="icon-time"></li>',
								  'style' => 'width:60px;',
								  'options' => array('showMeridian' => true, 'defaultTime'=> '12:00 PM')
							)); ?>
					</div>
					<div style="float: left;">
						<?php echo $form->timePickerRow($model,'toTimePm',array('hint' => '',
								  'prepend' => '<li class="icon-time"></li>',
								  'style' => 'width:60px;',
								  'options' => array('showMeridian' => true, 'defaultTime'=> '5::00 PM',)
							)); ?>
					</div>
				</div><div style="clear: both;"></div>
				<?php echo $form->textAreaRow($model, 'activity', array('style' => 'margin-left:1px; width:235px;')); ?>
		</div>
			<div>
				<div style="float: left; width: 960px;">
					<table id="dg"></table>
					
					<div style="float: right; margin: 10px 0 0 0;" >
						<?php echo $form->textFieldRow($model, 'totalHour', array('style' => 'width:30px;','readonly' => 'readonly')); ?>
					</div>
					<div style="float: left; margin: 10px 0 0 0; width:165px;">
						<?php echo $form->textFieldRow($model, 'totalSunday', array('style' => 'width:30px;', 'readonly' => 'readonly')); ?>
					</div>
					<div style="float: left; margin: 10px 0 0 0;width:165px;">
						<?php echo $form->textFieldRow($model, 'totalWeekDay', array('style' => 'width:30px;', 'readonly' => 'readonly')); ?>
					</div>
					<div style="float: left; margin: 10px 0 0 0;width:215px;">
						<?php echo $form->textFieldRow($model, 'totalNight', array('style' => 'width:30px;', 'readonly' => 'readonly')); ?>
					</div>
					<div style="float: left; margin: 10px 0 0 0;width:150px;">
						<?php echo $form->textFieldRow($model, 'totalPublicHoliday', array('style' => 'width:30px;','readonly' => 'readonly')); ?>
					</div>
					
				</div>
				<div style="float: left; width: 70px; margin-left: 10px;">
					<?php 
						$this->widget('bootstrap.widgets.TbButton',array(
							'id'=>"btn-add",
							'label' => 'Add',
							'size' => 'mini',
								'htmlOptions' => array('style' => 'margin-top:5px; width:40px;')
						));?>
						<?php 
						$this->widget('bootstrap.widgets.TbButton',array(
							'id'=>"btn-edit",
							'label' => 'Edit',
							'size' => 'mini',
							'htmlOptions' => array('style' => 'margin-top:5px;width:40px;')
						));?>
						<?php 
						$this->widget('bootstrap.widgets.TbButton',array(
							'id'=>"btn-remove",
							'label' => 'Remove',
							'size' => 'mini',
							'htmlOptions' => array('style' => 'margin-top:5px;width:40px;')
						));?>
						
						<?php 
						$this->widget('bootstrap.widgets.TbButton',array(
							'id'=>"btn-cancel",
							'label' => 'Cancel',
							'size' => 'mini',
							'htmlOptions' => array('style' => 'margin-top:5px;width:40px;')
						));?>
						
						<?php 
						$this->widget('bootstrap.widgets.TbButton',array(
							'id'=>"btn-save",
							'label' => 'Save',
							'size' => 'mini',
							'htmlOptions' => array('style' => 'margin-top:5px;width:40px;')
						));?>
				</div>
			</div>
	<?php    
	    $this->endWidget();
	    unset($form);
	?>
</div>
<script>
var dgRowIndex = undefined;
function parseTime(timeText) {
  timeText = timeText.replace(/^\s+|\s$/g, '');
  var regex = /^(\d{1,2}):(\d{1,2})\s*(am|pm)$/i;

  if (!regex.test(timeText)) { return null; }

  var
    timeParts = regex.exec(timeText)
    , hours = parseInt(timeParts[1])
    , ampm = timeParts[3].toLowerCase()
    , hoursOffset = (ampm === 'pm' && hours !== 12) ? 12 : 0;

  hoursOffset = (ampm === 'am' && hours === 12) ? -12 : hoursOffset;

  return getTodayWithTime(
    hours + hoursOffset
    , parseInt(timeParts[2])
  );
}
function getTodayWithTime(hours, minutes) {
  var today = new Date();
  today.setHours(hours);
  today.setMinutes(minutes);
  today.setSeconds(0);
  today.setMilliseconds(0);
  return today;
}

/**
 * validate form
 * @returns {Boolean}
 */
function onValidateFormWorkExperience() {
    var typeId = validationEmpty($("#OverTimeForm_otTypeId"));
    var toTime = validationEmpty($("#OverTimeForm_toTime"));
    var fromTime = validationEmpty($("#OverTimeForm_fromTime"));
    var otDate = validationEmpty($("#OverTimeForm_otDate"));
    var activity = validationEmpty($("#OverTimeForm_activity"));
	if( typeId != "" || toTime != "" || fromTime != "" || otDate != "" || activity != ""){
		return false;	
	}
	return true;
}

var _otType = <?php echo $model->_otTypes;?>;
var dg =$("#dg");
var formatter = function(value, ro){
					for(var i=0; i<_otType.length; i++){
						if (_otType[i].id == value) return _otType[i].type_name;
					}
					return value;
				}

dg.datagrid({
	title: 'Add Over Time',
	height:300,
	singleSelect:true,
	nowrap:false,
	fitColumns:true,
	toolbar: '#tb',
	idField: 'id',		
	//pagination: true,
	rownumbers: true,
	scrollbarSize: 5,
	columns:[[
		{title:"Type",field:"type",formatter:formatter,width:40,"align":"center"},
		{title:"Date",field:"date",width:25},
		{title:"Timezone",field:"timezone",width:18},
		{title:"From (am)",field:"from_time", width:20},
		{title:"To (am)",field:"to_time", width:20},
		{title:"From (pm)",field:"from_time_pm", width:20},
		{title:"To (pm)",field:"to_time_pm", width:20},
		{title:"Hours",field:"total_hour", width:18},
		{title:"Activity",field:"activity",width:80}
		
	]]
});
$("#btn-add").click(function(){
	if(onValidateFormWorkExperience()){
		var subTotal = 0;	
		var timezone = $("input:radio:checked").val();
		var formTime1 = "", toTime1 ="", formTimePM1 = "", toTimePM1 = "";
		
		fromTime1 = $("#OverTimeForm_fromTime").val();
		toTime1 = $("#OverTimeForm_toTime").val();
		formTimePM1 = $("#OverTimeForm_formTimePm").val();
		toTimePM1 = $("#OverTimeForm_toTimePm").val();
		if(timezone == "AM"){
			formTimePM1 = "";
			toTimePM1 ="";
		}else if(timezone=="PM"){
			fromTime1 ="";
			toTime1 ="";
		}
		
		
		var fromTime = parseTime(fromTime1);
		var toTime  = parseTime(toTime1);
		var fromTimePm = parseTime(formTimePM1);
		var toTimePm  = parseTime(toTimePM1);
			
		var totalHour =  ((toTime - fromTime)/1000/60/60) + ((toTimePm - fromTimePm)/1000/60/60) ;
		//var help = checkInsertRowAlready($("#OverTimeForm_otDate").val(), $("#OverTimeForm_fromTime").val(),$("#OverTimeForm_toTime").val());
		var help = false;
		if(help){
			$.messager.alert('Error','This data has been inserted already.','warning');
		}else{
			var column = {
					type: $("#OverTimeForm_otTypeId").val(),
					date: $("#OverTimeForm_otDate").val(),
					timezone:timezone,
					from_time: fromTime1,
					to_time: toTime1,
					from_time_pm: formTimePM1,
					to_time_pm: toTimePM1,
					total_hour:totalHour,
					activity:$("#OverTimeForm_activity").val()
				};
			if(dgRowIndex != undefined){
				dg.datagrid('deleteRow', dgRowIndex);
				dg.datagrid('insertRow', {
					index: dgRowIndex,
					row:column
				});
			}else{
				dg.datagrid('appendRow',column);
			}
			
			var rows = dg.datagrid('getRows');
			var weekDay = 0;
			var holiday = 0;
			var night = 0;
			var sunday = 0;
			for(i=0;i<rows.length;i++){
				if(rows[i].type == 2){
					weekDay += rows[i].total_hour;
				}else if(rows[i].type == 1){
					holiday += rows[i].total_hour;
				}else if(rows[i].type == 3){
					sunday += rows[i].total_hour;
				}else if(rows[i].type == 4){
					night += rows[i].total_hour;
				}
				subTotal += rows[i].total_hour;
			}
			$("#OverTimeForm_totalHour").val(subTotal);
			
			$("#OverTimeForm_totalWeekDay").val(weekDay);
			$("#OverTimeForm_totalSunday").val(sunday);
			$("#OverTimeForm_totalNight").val(night);
			$("#OverTimeForm_totalPublicHoliday").val(holiday);
			
		}
		toggleButton('add');
	}
	dgRowIndex = undefined;
});

function deleterow(index){
	$.messager.confirm('Confirm','Are you sure?',function(r){
		if (r){
			dg.datagrid('deleteRow', index);
		}
	});
}

$("#btn-save").click(function(){
	var count = dg.datagrid('getData').total;
	if(count > 0){
		var ss = [];
		var rows = dg.datagrid('getRows');
		for(i=0;i<rows.length;i++){
			items = {'type':rows[i].type, 'date':rows[i].date, 'from_time':rows[i].from_time, 'to_time':rows[i].to_time, 
					 'num_of_hour':rows[i].total_hour, 'activity': rows[i].activity, 'from_time_pm':rows[i].from_time_pm, 
					 'to_time_pm':rows[i].to_time_pm};
			ss.push(items);
		}
		$.ajax({
				url: '<?php echo $this->createUrl('addOverTime');?>',
		        type: 'post',
		       	data: {requestedDate: $("#OverTimeForm_requestedDate").val(), items : JSON.stringify(ss), totalHour : $("#OverTimeForm_totalHour").val()},
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

$("#btn-remove").click(function(){
	var selectedrow = dg.datagrid("getSelected");
    var rowIndex = dg.datagrid("getRowIndex", selectedrow);
	deleterow(rowIndex);
});

$("#btn-edit").click(function(){
	var row = dg.datagrid('getSelected');
	dgRowIndex = dg.datagrid("getRowIndex", row);
	
	if (row){
		$("#OverTimeForm_otTypeId").val(row.type);
		$("#OverTimeForm_otDate").val(row.date);
		$("#OverTimeForm_fromTime").val(row.from_time);
		$("#OverTimeForm_toTime").val(row.to_time);
		$("#OverTimeForm_activity").val(row.activity);
		toggleButton("edit");
	}else{
		$.messager.alert('Error','No seleted.','warning');
	}
});

$("#btn-cancel").click(function(){
	toggleButton('cancel');
});

function checkInsertRowAlready(otDate, fromTime, toTime){
	var help = false;
	var count = dg.datagrid('getData').total;
	
	if(count ==0) return false;
	var rows = dg.datagrid('getRows');
	for(i=0;i<rows.length;i++){
		if(i != dgRowIndex){
			if(rows[i].date == otDate && rows[i].from_time == fromTime && rows[i].to_time == toTime){
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
			$("#btn-edit").attr('disabled', 'disabled');
			$("#btn-remove").attr('disabled', 'disabled');
			$("#btn-save").attr('disabled', 'disabled');
			$("#btn-add").removeAttr('disabled');
		break;
		case "cancel":
			$("#btn-edit").removeAttr('disabled');
			$("#btn-remove").removeAttr('disabled');
			$("#btn-add").removeAttr('disabled');
			$("#btn-save").removeAttr('disabled');
			dgRowIndex = undefined;
		break;
		case "add":
			$("#btn-edit").removeAttr('disabled');
			$("#btn-remove").removeAttr('disabled');
			$("#btn-add").removeAttr('disabled');
			dgRowIndex = undefined;
			//resetForm($("#OverTimeForm"));
		break;
	}
}

function resetForm(e){
	$(':input',e)
	 .val('')
 	.removeAttr('checked')
 	.removeAttr('selected');
 	e[0].reset(); 
}	

function refreshGrid(controll){
	controll.datagrid('loadData',[]);	
}

$("#OverTimeForm_timezone_2").click(function(){
	$("#timeAM").css("display", "none");
	$("#timePM").css("display", "block");
});
$("#OverTimeForm_timezone_1").click(function(){
	$("#timePM").css("display", "none");
	$("#timeAM").css("display", "block");
});
$("#OverTimeForm_timezone_0").click(function(){
	$("#timePM").css("display", "block");
	$("#timeAM").css("display", "block");
});
</script>