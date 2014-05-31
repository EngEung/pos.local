
<?php 
    /** @var TbActiveForm $form */
    $form = $this->beginWidget(
    'bootstrap.widgets.TbActiveForm',array(
    	'id' => 'shippingForm',
    	'type' => 'horizontal',
    	'enableClientValidation' => true,
	    'clientOptions' => array(
	             	'validationOnSubmit' => true,
	             	'validateOnChange' => true,
					'validateOnType' => true,
		),
   		'htmlOptions' => array('class' => 'well-small'), // for inset effect
   ));
?>		
	<div style=" width: 345px; margin: 0; padding:0; float: left;">
		<?php echo $form->hiddenField($model, 'id'); ?>
                <?php echo $form->hiddenField($model, 'custId'); ?>
		<?php echo $form->textFieldRow($model, 'shippingTo', array('placeholder' => '')); ?>
		<?php echo $form->textFieldRow($model, 'shippingAddress', array('placeholder' => '')); ?>
                <?php echo $form->textAreaRow($model, 'note', array('placeholder' => '', 'style' => 'width:210px; height:48px;')); ?>
	</div>
<?php    
    $this->endWidget();
  //  unset($form);
?>