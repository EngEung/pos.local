
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
	<div style=" width: 400px; margin: 0; padding:0; float: left; margin-left:-20px;">
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
		<div style="margin-left: 10px;">
			<?php echo $form->textFieldRow($model, 'email1', array('placeholder' => '')); ?>
			<div class="fileinput fileinput-new" data-provides="fileinput">
			  <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
			    <img data-src="http://placehold.it/135x450" alt="">
			  </div>
			  <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;"></div>
			  <div>
			    <span class="btn btn-default btn-file"><span class="fileinput-new">Select image</span><span class="fileinput-exists">Change</span><input type="file" name="..."></span>
			    <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
			  </div>
			</div>

		</div>
	</div>
<?php    
    $this->endWidget();
    unset($form);
?>
<style>
	
</style>