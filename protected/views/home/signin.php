<?php 
	$this->pageTitle=Yii::app()->name;

<<<<<<< HEAD
=======
/*
>>>>>>> 3933f5d16a38708c95979b8367751dfc17a921a6
	Yii::app()->clientScript->registerCoreScript('jquery');
	$cs = Yii::app()->clientscript;
						
	$cs->registerCssFile( Yii::app()->baseUrl . '/js/jquery-easyui/themes/bootstrap/easyui.css' );
	$cs->registerScriptFile( Yii::app()->baseUrl . '/js/jquery-easyui/jquery.easyui.min.js');	
	$cs->registerScriptFile( Yii::app()->baseUrl . '/js/jquery-easyui/jquery.crud.js');	
<<<<<<< HEAD
	
?>

<?php 
=======
*/
	
?>

<?php /*
>>>>>>> 3933f5d16a38708c95979b8367751dfc17a921a6
$this->beginWidget('ext.yii-easyui.widgets.EuiWindow', array(
	'title' => 'Sign In',
	'id'=> 'login-win',
	'style'=> 'width:400px',
	'closable' => false,
	'collapsible' => true,
	'iconCls'=> 'icon-lock',
	'modal' => true,
<<<<<<< HEAD
	'shadow'=> false,
	'buttons' => '#dlg-button'	
));?>
=======
	//'shadow'=> false,
	'buttons' => '#dlg-button'	
));*/?>
>>>>>>> 3933f5d16a38708c95979b8367751dfc17a921a6
		<?php $form = $this->beginWidget('bootstrap.widgets.TbActiveForm',
			   		array('id' => 'signInForm',
			   			  'type' => 'horizontal',
			   			  //'enableClientValidation'=>true,
						  'clientOptions'=>array(
		  				 	 'validateOnSubmit'=>true
							 )
					));?>
		
			<div>
				<?php if(Yii::app()->user->hasFlash('auth_message')): ?>
					<div class="alert alert-warning alert-danger">
						 <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
					  <strong>Warning!</strong> <?php echo Yii::app()->user->getFlash('auth_message'); ?>
					</div>
				<?php endif; ?>
			</div>
		
		  <?php
		    echo $form->textFieldRow($signInForm, 'username', array('autocomplete'=> 'off','placeholder' => 'Username', 'style'=> 'margin-left:-50px'));
		    echo $form->passwordFieldRow($signInForm, 'password',array('placeholder' => 'Password','style'=> 'margin-left:-50px'));
		  ?>  	
		   <div id="" class="dialog-button" style="margin-bottom: -20px;">
		 <?php 
			 	
				  $this->widget('bootstrap.widgets.TbButton',array(
							 'id' => 'btn-save',	
							 'label' => 'Sign In',
							 'size' => 'small',
							 'buttonType'=>'submit',
							 'htmlOptions' => array('style' => 'margin-left:5px;'),
						  ));
				 
		
		?>
		</div>
		    	
	
<?php 
	$this->endWidget();
	unset($form);	
<<<<<<< HEAD
	$this->endWidget();  
=======
	//$this->endWidget();  
>>>>>>> 3933f5d16a38708c95979b8367751dfc17a921a6
?>


<style>
	.btn{margin-left: 5px;}
	.form-horizontal .control-label{width: 110px;}
	#signInForm{padding-top: 20px;}
<<<<<<< HEAD
</style>

<script>
$(function(){
	//$('#login-win').window('open');
});

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
</script>
=======
</style>
>>>>>>> 3933f5d16a38708c95979b8367751dfc17a921a6
