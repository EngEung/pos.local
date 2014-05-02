<?php 
	$this->pageTitle=Yii::app()->name;
	$this->widget('bootstrap.widgets.TbBreadcrumbs', array(
	'links'=>array('Staff'=>$this->createUrl('/setup/customers/'), 'Lists Of Customers'),
	));
	
	Yii::app()->clientScript->registerCoreScript('jquery');
	$cs = Yii::app()->clientscript;
	$cs->registerCssFile( Yii::app()->baseUrl . '/js/jquery-easyui/themes/icon.css' );							
	$cs->registerCssFile( Yii::app()->baseUrl . '/js/jquery-easyui/themes/bootstrap/easyui.css' );
	$cs->registerScriptFile( Yii::app()->baseUrl . '/js/jquery-easyui/jquery.easyui.min.js');	
	$cs->registerScriptFile( Yii::app()->baseUrl . '/js/jquery-easyui/jquery.crud.js');	
	
	$cs->registerScriptFile(Yii::app()->baseUrl . '/js/ajaxupload/jquery.form.js', CClientScript::POS_HEAD);
	$cs->registerScriptFile(Yii::app()->baseUrl . '/js/ajaxupload/processupload.js',CClientScript::POS_HEAD );
	$cs->registerCssFile( Yii::app()->baseUrl . '/js/ajaxupload/style/style.css', CClientScript::POS_HEAD);
	
?>
<?php 
	$mcnId 	= 1; // Menu Child Node ID
	$smcnId = 6; // Sub Menu Childe Node ID
	$menu 	= $this->getTabMenu($mcnId,$smcnId);
	$this->widget('bootstrap.widgets.TbMenu', array(
    			'type'=>'tabs', // '', 'tabs', 'pills' (or 'list')
   				'stacked'=>false, // whether this is a stacked menu
    			'items'=>$menu
	)); 
?>


	<div class="_search_form" style="display: none;">
		<?php //$this->renderPartial('_searchUser', array('searchUserForm' => $searchUserForm));?>
	</div>
	
	
	<?php
	    /*$this->widget('bootstrap.widgets.TbGridView',
				   array(
					   'id' => 'search-user',
					   'type' => 'bordered',
					   'dataProvider' => $userProvider,
					   'template' => "{summary}{items}{pager}",
					   'enablePagination' => true,
						'columns' => $gridColumns
			    ));*/
	?>

<?php 

Yii::app()->clientScript->registerScript('search', "

		
");
?> 

<div id="tb" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
		<?php 
		$this->widget('bootstrap.widgets.TbButton',array(
			'id'=>"btn-add",
			'label' => 'Add',
			'type' => 'primary',
			'icon' => 'plus',
			'htmlOptions' => array('onclick' => "$('#training-win').window('open')")
		));
		
		$this->widget('bootstrap.widgets.TbButton',array(
			'id'=>"btn-edit",
			'label' => 'Edit',
			'type' => 'primary',
			'icon' => 'pencil',
		));
		
		$this->widget('bootstrap.widgets.TbButton',array(
			'id'=>"btn-remove",
			'label' => 'Remove',
			'type' => 'primary',
			'icon' => 'remove',
		));
		
		$this->widget('bootstrap.widgets.TbButton',array(
			'id'=>"btn-refresh",
			'label' => 'Remove',
			'type' => 'primary',
			'icon' => 'refresh',
		));
	?>    	
	</div>
</div>
<div style="width: 1000px;">

	<?php $this->widget('ext.yii-easyui.widgets.EuiDataGrid', array(
		'id' => 'dg',
		'style' => 'width:auto; height: 400px',
		'url' => $this->createUrl('getTrainingList'),
		'singleSelect' => true,
		'toolbar' => '#tb',
		'idField' => 'id',		
		'pagination' => true,
		'rownumbers' => true,
		
		'columns' => array(
					array('title'=>'', 'checkbox' => true),
					array('title' =>'ID', 'field'=>'id', 'width'=> 10, 'sortable'=>true),
					array('title' => 'Course Title', 'field'=>'course_title', 'width'=> 30, 'sortable'=>true),
					array('title' => 'Organizer', 'field'=>'organizer', 'width'=> 40, 'sortable'=>true),
					array('title' => 'Place', 'field'=>'place', 'width'=> 30,'sortable'=>true),
					array('title' => 'Sponsor By', 'field'=>'sponsor_by', 'width'=> 30,'sortable'=>true),
					array('title' => 'Duration', 'field'=>'duration', 'width'=> 30,'sortable'=>true),
					array('title' => 'Created Date', 'field'=>'created_date', 'width'=> 50,'sortable'=>true),
					array('title' => 'Last Update', 'field'=>'modified_date', 'width'=> 50,'sortable'=>true),
					array('title' => 'File', 'field'=>'file_id', 'width'=> 1, 'hidden' => true, 'sortable'=>true),
					array('title' => 'File name', 'field'=>'file_name', 'width'=> 1, 'hidden' => true, 'sortable'=>true),
		)	
	));
	?>
</div>
<?php 
$this->beginWidget('ext.yii-easyui.widgets.EuiWindow', array(
'title' => 'Add Training Records',
	'id'=> 'training-win',
	'style'=> 'width:500px',
	'closed' => true,
	'iconCls'=> 'icon-lock',
	'modal' => true,
	'buttons' => '#dlg-buttons'	
));
	$this->renderPartial('_form', array('model'=>$model, 'fileUpload'=> $fileUpload));
	
$this->endWidget();  
?>


<style>
	
	.btn{
		margin-left: 5px;
	}
</style>

<script>
/*
var crud = new Crud({
	//route: <?php //echo "'".$this->createUrl('/staff/empTraining/getTrainingList/')."'"?>,
	grid: $('#dg'),
	window: $('#training-win')	
});*/

$('#btn-edit').click(function(){
	onUpdateTraining();
});

$('#btn-remove').click(function(){
	onRemove();
});

$('#btn-refresh').click(function(){
	crud.refresh();
});

$('#btn-cancel').click(function(){
	$('#training-win').dialog('close');
});	

function cellStyler(value,index){
	return 'background-color:#ffee00;color:red;';
}
function resetForm(){
	//$('#trainingForm')[0].reset();
	$('#MyUploadForm')[0].reset();
	$('#output').html('');
	$('#submit-btn').removeAttr('disabled');
}


/* Save Employee Training */
function onSaveTrainingRecor(button){
	var href = $('#file_link').attr('href');
	var fileId = '';
	if(href != null){
		fileId = href.substr(href.lastIndexOf("=") + 1);
	}
	$("#TrainingForm_fileId").val(fileId)
	var data = $('#MyUploadForm').serialize();
	var url = <?php echo "'". $this->createUrl('/staff/empTraining/saveUpdate/') ."'"?>;
	$.messager.progress({title:'Please waiting', msg:'Loading data...'});
	$.ajax({
        url: url,
        type: 'POST',
        data: data,
        dataType: 'json',
        success: function(response){
        	$.messager.progress('close');
        	if(response.validated == true){
	        	if(response.success==true){
	        		if(button == 'btn-save-close')
	        	 		$('#training-win').dialog('close');
	        	 	
	        	 	if(button == 'btn-save')
	        	 		resetForm();
	       
	        	 	crud.refresh();	
	        	}else{
	        	 	$.messager.alert('Warning','Save training record has not been successfully!','warning');
	        	}
        	}else {
        		$.messager.alert('Error','Error occured.please try again.','warning');
        	}
        },
        error: function(response){
        	$.messager.progress('close');
        }
	});
} 


function onUpdateTraining(){
	var row = $('#dg').datagrid('getSelected');
	if (row){
		resetForm();
		$('#training-win').dialog('open');
		$("#TrainingForm_courseTitle").val(row.course_title);
		$("#TrainingForm_organizer").val(row.organizer);
		$("#TrainingForm_sponsorBy").val(row.sponsor_by);
		$("#TrainingForm_place").val(row.place);
		$("#TrainingForm_duration").val(row.duration);
		$("#TrainingForm_trainingId").val(row.id);
		var fileId = row.file_id;
		var fileName = row.file_name;
		if(fileId != null && fileName != null){
			var file = '<a target="_blank" id="file_link" href="/hr/staff/empTraining/viewFile/?id='+ fileId+'"><i class="icon-file"> </i>' + fileName +'</a>';
			file = file + '<a id="file_delete" href="#" onclick="onDeleteFile('+ fileId +',\''+'/hr/staff/empTraining/deleteFile'+'\'' +')" ><i class="icon-remove"> </i></a>';
			$("#output").html(file);
			$('#submit-btn').attr('disabled','disabled');
		}
	}else{
		$.messager.alert('Alert','No records selected.', 'alert');
	}
}

function onRemove(){
	var row = $('#dg').datagrid('getSelected');
	if (row){
		 $.messager.confirm('Remove Traning record', 'Are you sure you want to remove the course that you selected.?', function(r){
			if (r){
				$.ajax({
					url: <?php echo "'" . $this->createUrl('/staff/empTraining/removeTraining/') ."'";?>,
			        type: 'get',
			        data: {trainingId: row.id},
			        dataType: 'json',
			        success: function (response) {
						if(response == false){
							$.messager.alert('Error','Error occured.please try again.','warning');
						}else{
							crud.refresh();	
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