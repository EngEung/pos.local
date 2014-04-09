
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
	<div style=" width: 400px; margin: 0; padding:0; float: left; margin-left:-20px; border: 1px solid;">
		<?php echo $form->hiddenField($model, 'id'); ?>
		<?php echo $form->textFieldRow($model, 'firstName', array('placeholder' => '')); ?>
		<?php echo $form->textFieldRow($model, 'lastName', array('placeholder' => '')); ?>
		<?php echo $form->textFieldRow($model, 'titleId', array('placeholder' => '')); ?>
		<span style="margin-left:70px; color: #003BB3; font-weight: bold;">Phone Numbers</span><hr style="margin:-8px 0 0 165px;"/>
		<br />
		<?php echo $form->textFieldRow($model, 'phone1', array('placeholder' => '')); ?>
		<?php echo $form->textFieldRow($model, 'phone2', array('placeholder' => '')); ?>
		
		<span style="margin-left:70px; color: #003BB3; font-weight: bold;">Address</span><hr style="margin:-8px 0 0 165px;"/>
		<br />
		<?php echo $form->textFieldRow($model, 'locationId', array('placeholder' => '')); ?>
		<?php echo $form->textFieldRow($model, 'address', array('placeholder' => '')); ?>
		
		<?php echo $form->textAreaRow($model, 'descr', array('class' => 'company-address')); ?>
	</div>
	
	<div style="width: 320px; margin: 0; padding:0; float: left;border: 1px solid;">
		<div style="margin-left: -20px;">
			<?php echo $form->textFieldRow($model, 'email1', array('placeholder' => '')); ?>
		</div>
	</div>
<?php    
    $this->endWidget();
    unset($form);
?>
<style>
	
</style>