<div  style="margin-left: -80px;">
<?php 
CHtml::$errorCss = 'fsgdfsgdfsfdsadgfqweas';
    /** @var TbActiveForm $form */
    $form = $this->beginWidget(
    'bootstrap.widgets.TbActiveForm',array(
    	'id' => 'ItemTypeForm',
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

		<?php echo $form->dropDownListRow($model,'category_id', $model->category_id,
						array('empty'=>'--Select--','style'=>'margin-left:00px;')); 
				?>
		<?php echo $form->textFieldRow($model, 'name', array('placeholder' => '')); ?>
		<?php echo $form->textFieldRow($model, 'code', array('placeholder' => '')); ?>
		<?php echo $form->textAreaRow($model, 'descr', array('placeholder' => '')); ?>
	</div>	
	
<?php    
    $this->endWidget();
    unset($form);
?>
</div>
<style>
	.errorMessage{color: #b94a48;}
</style>