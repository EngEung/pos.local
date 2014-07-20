<div  style="margin-left: -80px;">
<?php 
    /** @var TbActiveForm $form */
    $form = $this->beginWidget(
    'bootstrap.widgets.TbActiveForm',array(
    	'id' => 'categoryForm',
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

	
		<?php echo $form->textFieldRow($model, 'name', array('placeholder' => '')); ?>
		<?php echo $form->textFieldRow($model, 'code', array('placeholder' => '')); ?>
		<?php echo $form->textAreaRow($model, 'descr', array('placeholder' => '')); ?>
	</div>	
	<div id="dlg-buttons" class="dialog-button" style=" margin-top: 15px;">
		 <?php 
		 
		 	  $this->widget('bootstrap.widgets.TbButton',array(
				 'id' => 'btn-save',	
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
</div>