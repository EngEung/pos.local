<br/>
<?php 
    /** @var TbActiveForm $form */
    $form = $this->beginWidget(
    'bootstrap.widgets.TbActiveForm',array(
    	'id' => 'supplierForm',
    	'type' => 'horizontal',
    	'enableClientValidation' => true,
	    'clientOptions' => array(
	             	'validationOnSubmit' => true,
	             	'validateOnChange' => true,
					'validateOnType' => true,
		),
   		'htmlOptions' => array('class' => 'well-small','enctype' => 'multipart/form-data'), // for inset effect
   ));
?>		

	<div class="row-fluid">
		<?php if(Yii::app()->user->hasFlash('error_message')): ?>
			<div class="alert alert-warning alert-dismissable">
			  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			  <strong>Warning!</strong> <?php echo Yii::t('translation',Yii::app()->user->getFlash('error_message')); ?>.
			</div>
		<?php endif; ?>
		
		<?php if(Yii::app()->user->hasFlash('suc_message')): ?>
			<div class="alert in fade alert-success">
			  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			  <strong>Warning!</strong> <?php echo Yii::t('translation',Yii::app()->user->getFlash('suc_message')); ?>.
			</div>
		<?php endif; ?>
	</div>
	
	<div style=" width: 380px; margin: 0; padding:0; float: left;">
		<?php echo $form->hiddenField($model, 'id'); ?>
		<?php echo $form->textFieldRow($model, 'name', array('placeholder' => '')); ?>
		<?php echo $form->textFieldRow($model, 'code', array('placeholder' => '')); ?>
		<?php echo $form->textFieldRow($model, 'address1', array('placeholder' => '')); ?>
		<?php echo $form->textFieldRow($model, 'address2', array('placeholder' => '')); ?>
		<?php echo $form->textFieldRow($model, 'cityId', array('placeholder' => '')); ?>
		<?php echo $form->textFieldRow($model, 'stateProvinceId', array('placeholder' => '')); ?>
		<?php echo $form->textFieldRow($model, 'postalCode', array('placeholder' => '')); ?>
		<?php echo $form->textFieldRow($model, 'countryId', array('placeholder' => '')); ?>
	</div>
	

	<div id="left_col" style="width: 400px; margin: 0; padding:0; float: left;">
		<?php echo $form->textFieldRow($model, 'accountNum', array('placeholder' => '')); ?>
		<?php echo $form->textFieldRow($model, 'contact', array('placeholder' => '')); ?>
		<?php echo $form->textFieldRow($model, 'phone', array('placeholder' => '')); ?>
		<?php echo $form->textFieldRow($model, 'fax', array('placeholder' => '')); ?>
		<?php echo $form->textFieldRow($model, 'email', array('placeholder' => '')); ?>
		<?php echo $form->textFieldRow($model, 'website', array('placeholder' => '')); ?>
		<?php echo $form->textAreaRow($model, 'note'); ?>
	</div>
	<div style="clear:both;"></div>
	
	<div id="dlg-buttons" class="dialog-button" style=" margin-top: 15px;">
		 <?php 
		 
		 	  $this->widget('bootstrap.widgets.TbButton',array(
				 'id' => 'btn-new',	
				 'label' => 'New',
				 'size' => 'small',
				 'buttonType'=>'submit',
				 'htmlOptions' => array('style' => 'margin-left:5px;'),
			  ));
		 	
			   $this->widget('bootstrap.widgets.TbButton',array(
				 'id' => 'btn-save-close',	
				 'label' => 'Save',
				 'size' => 'small',
				 'buttonType'=>'submit',
				 'htmlOptions' => array('style' => 'margin-left:5px;'),
			  ));
			  
			   $this->widget('bootstrap.widgets.TbButton',array(
						 'id' => 'btn-cancel',	
						 'label' => 'Cancel',
						 'size' => 'small',
						 'htmlOptions' => array('style' => 'margin-left:5px;'),
				));
		?>
	</div>
<?php    
    $this->endWidget();
    unset($form);
?>
<style>

	.form-horizontal #left_col .control-label { width:110px;}
	.form-horizontal #left_col .controls {margin-left: 130px; }

	.form-horizontal .control-label { width:120px;}
	.form-horizontal .controls {margin-left: 140px;}
	.form-horizontal .radio label{margin-right: 10px;}
	.form-horizontal .div-customer-type{margin-left: -40px;}
	.form-horizontal .div-customer-note{margin-left: -40px;}
	
</style>
<script>
	var defaultReload = function(){
		$.mask.definitions['e']='[0-9]{1}';
		$("#SupplierForm_phone").mask("(999) 999-999?e");
		$("#SupplierForm_fax").mask("(999) 999-999?e");
	} 
		
	defaultReload();
	
	$("#btn-new").click(function(){
		resetForm();
	});
	
	function resetForm(){
		$('#supplierForm')[0].reset();
	}
</script>