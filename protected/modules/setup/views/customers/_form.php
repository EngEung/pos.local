
<?php 
    /** @var TbActiveForm $form */
    
    $form = $this->beginWidget(
    'bootstrap.widgets.TbActiveForm',array(
    	'id' => 'customerForm',
    	'type' => 'horizontal',
    	'enableClientValidation' => true,
	    'clientOptions' => array(
	             	'validationOnSubmit' => true,
	             	'validateOnChange' => true,
					'validateOnType' => true,
		),
   		'htmlOptions' => array('class' => 'well-small',), // for inset effect
   ));
?>		
	<div style=" width: 345px; margin: 0; padding:0; float: left;">
		<?php echo $form->hiddenField($model, 'id'); ?>
		<?php echo $form->textFieldRow($model, 'firstName', array('placeholder' => '')); ?>
		<?php echo $form->textFieldRow($model, 'lastName', array('placeholder' => '')); ?>
		<?php echo $form->textFieldRow($model, 'titleId', array('placeholder' => '')); ?>
		<span style="margin-left:10px; color: #003BB3; font-weight: bold;">Phone Numbers</span><hr style="margin:-8px 0 0 110px;"/>
		<br />
		<?php echo $form->textFieldRow($model, 'phone1', array('placeholder' => '')); ?>
		<?php echo $form->textFieldRow($model, 'phone2', array('placeholder' => '')); ?>
		
		<span style="margin-left:10px; color: #003BB3; font-weight: bold;">Address</span><hr style="margin:-8px 0 0 70px;">
		<br />
		<?php echo $form->textFieldRow($model, 'locationId', array('placeholder' => '')); ?>
		<?php echo $form->textFieldRow($model, 'address', array('placeholder' => '')); ?>
		
		<?php echo $form->textAreaRow($model, 'descr', array('class' => 'company-address')); ?>
	</div>
	
	<div style="width: 350px; margin: 0; padding:0; float: left; margin-left: -10px;">
		<?php echo $form->textFieldRow($model, 'email1', array('placeholder' => '')); ?>
		
	</div>
<?php    
    $this->endWidget();
    unset($form);
?>
<style>
	.form-horizontal .control-label { width:100px;}
	.form-horizontal .controls {margin-left: 120px;}
</style>