<?php 

    $cs = Yii::app()->clientscript;
    $cs->registerScriptFile(Yii::app()->baseUrl .'/js/jasny-bootstrap/js/jasny-bootstrap.min.js');
    $cs->registerCssFile(Yii::app()->baseUrl . '/js/jasny-bootstrap/css/jasny-bootstrap.min.css');
    $cs->registerScriptFile(Yii::app()->baseUrl .'/js/masktextbox/masktextbox.js',CClientScript::POS_HEAD );
    $cs->registerScriptFile(Yii::app()->baseUrl .'/js/ajaxupload/processupload.js' );
    Yii::app()->getClientScript()->registerScriptFile(Yii::app()->baseUrl . '/js/jquery.cascadingdropdown.js');
?>
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
   		'htmlOptions' => array('class' => 'well-small','enctype' => 'multipart/form-data'), // for inset effect
   ));
?>		
	<div style=" width: 345px; margin: 0; padding:0; float: left;">
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
		<?php echo $form->textFieldRow($model, 'fax', array('placeholder' => '')); ?>
		
		<span style="margin-left:10px; color: #003BB3; font-weight: bold;">Address</span><hr style="margin:-8px 0 0 70px;">
		<br />
		<div id="cascade_dropdown_location">
		      <?php echo $form->dropDownListRow($model,'provinceId', $model->provinces,array('empty'=>'--Select--','style'=>'margin-left:00px;'));?>
              <?php echo $form->dropDownListRow($model, 'districtId', array(), array('prompt' => '--Select--','style'=>'width:220px')); ?>
              <?php echo $form->dropDownListRow($model, 'communeId', array(), array('prompt' => '--Select--','style'=>'width:220px')); ?>    
        </div>
	</div>
	

	<div id="left_col" style="width: 320px; margin: 0; padding:0; float: left;">
		<?php echo $form->textFieldRow($model, 'email1', array('placeholder' => '', 'labelOptions'=>array('id'=>'label_'))); ?>
		<div class="fileinput fileinput-new" data-provides="fileinput" style="margin-left: 100px; padding-bottom: 5px;">
		  <div class="fileinput-new thumbnail" style="width: 205px; height: 145px;">
		    <img  alt="">
		    <div id="output"></div> 
		  </div>
		  <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;"></div>
		  <div>
		    <span class="btn btn-default btn-file"><span class="fileinput-new"><i class="icon-picture"></i> Select picture</span><span class="fileinput-exists">Change</span>
		    <?php echo $form->fileField($model,'picture',array('id'=>'imageInput', 'style' => 'width:300px;')); ?></span>
		    <a id="remove_image" onclick="onRemoveImage();" href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
		  </div>
		</div>
		<br/>
		<span style="margin-left:25px; color: #003BB3; font-weight: bold;">Customer Options</span><hr style="margin:-8px 0 0 140px;">
		<br />
		 <?php echo $form->radioButtonListRow($model,'customerTypeId',$model->customerTypes, array('labelOptions'=>array('style'=> 'display:none;'), 'separator'=>'  ', 'divOptions'=>array('class'=>'div-customer-type'))); ?>
		
		<span style="margin-left:25px; color: #003BB3; font-weight: bold;">Note</span><hr style="margin:-8px 0 0 60px;">
		<br />
		<?php echo $form->textAreaRow($model, 'note', array('style' => 'width:250px;', 'divOptions'=>array('class'=>'div-customer-note'))); ?>
		
	</div>
<?php    
    $this->endWidget();
    unset($form);
?>
<style>

	.form-horizontal #left_col .control-label { width:80px;}
	.form-horizontal #left_col .controls {margin-left: 100px; }

	.form-horizontal .control-label { width:100px;}
	.form-horizontal .controls {margin-left: 120px;}
	.form-horizontal .radio label{margin-right: 10px;}
	.form-horizontal .div-customer-type{margin-left: -40px;}
	.form-horizontal .div-customer-note{margin-left: -40px;}
	
</style>
<script>
	function onRemoveImage(){
		$("#output").html("");
	}
	
	var defaultReload = function(){
		$.mask.definitions['e']='[0-9]{1}';
		$("#CustomerForm_phone1").mask("(999) 999-999?e");
		$("#CustomerForm_phone2").mask("(999) 999-999?e");
		$("#CustomerForm_fax").mask("(999) 999-999?e");
	} 
	defaultReload();
	
	$('#cascade_dropdown_location').cascadingDropdown({
        selectBoxes: [
            {
                selector: '#CustomerForm_provinceId',
                paramName: 'province_id',
               // url: '',
                textKey: 'label',
                valueKey: 'value',
                defaultValue:'<?php //echo $model->stateId;?>'
            },
            {
                selector: '#CustomerForm_districtId',
                requires: ['#CustomerForm_provinceId'],
                paramName: 'cityId',
                url: '/inventorycenter/customer/getDistrict',
                textKey: 'label',
                valueKey: 'value',
                defaultValue:'<?php //echo $model->cityId;?>'
            },
            {
                selector: '#CustomerForm_communeId',
                requires: ['#CustomerForm_districtId'],
                paramName: 'cityId',
                url: '/inventorycenter/customer/getCommune',
                textKey: 'label',
                valueKey: 'value',
                defaultValue:'<?php //echo $model->cityId;?>'
            },
        ]
    }); 
</script>