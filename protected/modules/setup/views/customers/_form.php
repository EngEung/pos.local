
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
	<div style=" width: 340px; margin: 0; padding:0; float: left;">

		<?php echo $form->hiddenField($model, 'id'); ?>
		<?php echo $form->textFieldRow($model, 'firstName', array('placeholder' => '')); ?>
		<?php echo $form->textFieldRow($model, 'lastName', array('placeholder' => '')); ?>
		<?php echo $form->dropDownListRow($model,'titleId', $model->titles,
						array('empty'=>'--Select--','style'=>'margin-left:00px;')); 
				?>
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
	
	<div id="left_col" style="width: 340px; margin: 0; padding:0; float: left;">
		<?php echo $form->textFieldRow($model, 'email1', array('placeholder' => '', 'labelOptions'=>array('id'=>'label_'))); ?>
		<div class="fileinput fileinput-new" data-provides="fileinput" style="margin-left: 100px;">
		  <div class="fileinput-new thumbnail" style="width: 200px; height: 145px;">
		    <img data-src="http://placehold.it/135x450" alt="">
		    <div id="output"></div> 
		  </div>
		  <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;"></div>
		  <div>
		    <span class="btn btn-default btn-file"><span class="fileinput-new">Select image</span><span class="fileinput-exists">Change</span><input id="imageInput" type="file" name="..."></span>
		    <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
		  </div>
		</div>
	</div>
<?php    
    $this->endWidget();
    unset($form);
?>
<style>
	.form-horizontal #left_col .control-label { width:80px;}
	.form-horizontal #left_col .controls {margin-left: 100px;}
	.form-horizontal .control-label { width:100px;}
	.form-horizontal .controls {margin-left: 120px;}

</style>