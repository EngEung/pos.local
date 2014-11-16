<div  style="margin-left: -80px;">
<?php 
CHtml::$errorCss = 'fsgdfsgdfsfdsadgfqweas';
    /** @var TbActiveForm $form */
    $form = $this->beginWidget(
    'bootstrap.widgets.TbActiveForm',array(
    	'id' => 'itemSizeForm',
    	'type' => 'horizontal',
    	'enableClientValidation' => true,
	    'clientOptions' => array(
	             	'validationOnSubmit' => true,
	             	'validateOnChange' => true,
					'validateOnType' => true,
		),
   		'htmlOptions' => array('class' => 'well-small', 'style' => 'margin-left:80px;'), // for inset effect
   ));
   
?>		
	
	<?php echo $this->renderPartial('_formSearchUnit');?>

		<fieldset>
			<legend style="margin: 0 0 10px -5px;font-weight:bold; font-size: 14px; width:100%;">Unit Group Details</legend>
			<ul id="navlist">
				<li>
					<?php echo $form->textFieldRow($model, 'unitGroupCode', array('placeholder' => '', 'style' => 'width:130px;')); ?>
				</li>
				<li>
					<?php   $this->widget('bootstrap.widgets.TbButton',array(
		                                    'id'=>"btn-search",
		                                    'label' => '',
		                                    'icon' => 'search',
		                                    'size' => 'small',
		                                    'buttonType' => 'button',
		                                    'htmlOptions' => array('style' => 'padding:7px;')
		                            ));?>
		             <?php   $this->widget('bootstrap.widgets.TbButton',array(
		                                    'id'=>"btn-search-cancel",
		                                    'label' => '',
		                                    'icon' => 'remove',
		                                    'size' => 'small',
		                                    'buttonType' => 'button',
		                                    'htmlOptions' => array('style' => 'padding:7px;', 'disabled' => 'disabled')
		                            ));?>
	             </li>
      		</ul>
      		<div style="clear: both;"></div>
			<?php echo $form->textFieldRow($model, 'unitGroupDescr', array('disabled' => 'disabled')); ?>
		</fieldset>
		
		<fieldset>
			<legend style="margin: 0 0 0 -5px;font-weight:bold; font-size: 14px; width:100%;">Size Group Details</legend>
			<?php echo $form->textFieldRow($model, 'sizeCode', array('placeholder' => '')); ?>
			<?php echo $form->textFieldRow($model, 'sizeDescr', array('placeholder' => '')); ?>
		</fieldset>
		
		<fieldset>
			<legend style="margin: 0 0 0 -5px;font-weight:bold; font-size: 14px; width:100%;">Size Details</legend>
			<?php echo $form->textFieldRow($model, 'sizeDetailCode', array('disabled' => 'disabled')); ?>
			<?php echo $form->textFieldRow($model, 'sizeDetailDescr', array('placeholder' => '')); ?>
			<div class="hint" style="margin:-10px 0 0 180px; font-size: 10px; padding: 0px;">Example: 5x10 or 5x10x20</div>
		</fieldset>
		
<?php    
    $this->endWidget();
    unset($form);
?>
</div>
<style>
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
} 
#navlist li{
	display: inline;
	list-style-type: none;
	float: left;
}
</style>