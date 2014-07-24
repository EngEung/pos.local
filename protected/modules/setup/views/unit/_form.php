<div  style="margin-left: -80px;">
<?php 
CHtml::$errorCss = 'fsgdfsgdfsfdsadgfqweas';
    /** @var TbActiveForm $form */
    $form = $this->beginWidget(
    'bootstrap.widgets.TbActiveForm',array(
    	'id' => 'unitForm',
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

	
		<?php echo $form->textFieldRow($model, 'name', array('placeholder' => '')); ?>
		<?php echo $form->textFieldRow($model, 'code', array('placeholder' => '')); ?>
		<?php echo $form->textAreaRow($model, 'descr', array('placeholder' => '')); ?>
	
<?php    
    $this->endWidget();
    unset($form);
?>
</div>
