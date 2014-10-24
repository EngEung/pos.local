<br/>
<?php 
    /** @var TbActiveForm $form */
    $form = $this->beginWidget(
    'bootstrap.widgets.TbActiveForm',array(
    	'id' => 'itemCodeForm',
    	'type' => 'horizontal',
    	'enableClientValidation' => true,
	    'clientOptions' => array(
	             	'validationOnSubmit' => true,
	             	'validateOnChange' => true,
					'validateOnType' => true,
		),
   	//	'htmlOptions' => array('class' => 'well-small','enctype' => 'multipart/form-data'), // for inset effect
   ));
?>		

	<div class="row-fluid">
		<?php if(Yii::app()->user->hasFlash('error_message')): ?>
			<div class="alert alert-warning alert-dismissable">
			  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			  <strong>Warning!</strong> <?php echo Yii::t('translation',Yii::app()->user->getFlash('error_message')); ?>.
			</div>
		<?php endif; ?>
		
		<?php if(Yii::app()->user->hasFlash('suc_message')): ?>
			<div class="alert in fade alert-success">
			  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			  <strong>Warning!</strong> <?php echo Yii::t('translation',Yii::app()->user->getFlash('suc_message')); ?>.
			</div>
		<?php endif; ?>
	</div>
	
	<div style=" width: 380px; margin: 0; padding:0; float: left;">
		<?php echo $form->hiddenField($model, 'id'); ?>
		<?php echo $form->textFieldRow($model, 'itemCode', array('placeholder' => '')); ?>
		<?php echo $form->textFieldRow($model, 'description', array('placeholder' => '')); ?>
		<?php 
				$this->widget('ext.chart.TextBoxWithSearch', array(
				'model' => $model,
				'attributeHiddenField' => 'unitGroupId',
				'attribute' => 'unitGroups',
				'url' => Yii::app()->baseUrl. '/dialog/DialogUnitGroup',
				'dialogTitle' => 'Unit Group Lists',
				'iconCls' => 'icon-th-large',
				'htmlOptions' => array('style' => 'width:170px;'),
				'columns' => array(
							array('title' => 'id', 'field'=>'id', 'width'=> 10, 'sortable'=>true),
							array('title' => 'Name', 'field'=>'name', 'width'=> 50, 'sortable'=>true),
							array('title' => 'Description', 'field'=>'name', 'width'=> 100, 'sortable'=>true),
						),
				));
				?> 
		
		<?php 
				$this->widget('ext.chart.TextBoxWithSearch', array(
				'model' => $model,
				'attributeHiddenField' => 'sizeGroupId',
				'attribute' => 'sizeGroups',
				'url' => Yii::app()->baseUrl. '/dialog/DialogCategory',
				'dialogTitle' => 'Size Group Lists',
				'iconCls' => 'icon-th-large',
				'htmlOptions' => array('style' => 'width:170px;'),
				'columns' => array(
							array('title' => 'id', 'field'=>'id', 'width'=> 10, 'sortable'=>true),
							array('title' => 'Name', 'field'=>'name', 'width'=> 50, 'sortable'=>true),
							array('title' => 'Description', 'field'=>'name', 'width'=> 100, 'sortable'=>true),
						),
				));
				?> 
		<?php echo $form->textFieldRow($model, 'barcode', array('placeholder' => '')); ?>
	</div>

	<div id="left_col" style="width: 400px; margin: 0; padding:0; float: left;">
      		<?php 
				$this->widget('ext.chart.TextBoxWithSearch', array(
				'model' => $model,
				'attributeHiddenField' => 'categoryId',
				'attribute' => 'category',
				'url' => Yii::app()->baseUrl. '/dialog/DialogCategory',
				'dialogTitle' => 'Category Lists',
				'iconCls' => 'icon-th-large',
				'htmlOptions' => array('style' => 'width:170px;'),
				'columns' => array(
							array('title' => 'id', 'field'=>'id', 'width'=> 10, 'sortable'=>true, 'checkbox' => true),
							array('title' => 'Name', 'field'=>'name', 'width'=> 50, 'sortable'=>true),
							array('title' => 'Description', 'field'=>'name', 'width'=> 100, 'sortable'=>true),
						),
				));
				?> 
				
				<?php 
				$this->widget('ext.chart.TextBoxWithSearchIndependent', array(
				'model' => $model,
				'attributeHiddenField' => 'itemTypeId',
				'attribute' => 'itemType',
				'requireField' => 'categoryId', 
				'url' => Yii::app()->baseUrl. '/dialog/DialogItemType',
				'dialogTitle' => 'Item Type Lists',
				'iconCls' => 'icon-th-large',
				'htmlOptions' => array('style' => 'width:170px;'),
				'columns' => array(
							array('title' => 'id', 'field'=>'id', 'width'=> 10, 'sortable'=>true,  'checkbox' => true),
							array('title' => 'Name', 'field'=>'name', 'width'=> 50, 'sortable'=>true),
							array('title' => 'Description', 'field'=>'name', 'width'=> 100, 'sortable'=>true),
						),
				));
				?> 
      		
 
		<div style="clear: both;"></div>
		<?php echo $form->textAreaRow($model, 'note'); ?>
	</div>
	<div style="clear:both;"></div>
<?php    
    $this->endWidget();
    unset($form);
?>

	
<style>

	.form-horizontal #left_col .control-label { width:110px;}
	.form-horizontal #left_col .controls {margin-left: 130px; }

	.form-horizontal .control-label { width:120px;}
	.form-horizontal .controls {margin-left: 140px;}
	.form-horizontal .radio label{margin-right: 10px;}
	.form-horizontal .div-customer-type{margin-left: -40px;}
	.form-horizontal .div-customer-note{margin-left: -40px;}
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
<script>
	var defaultReload = function(){
		//$.mask.definitions['e']='[0-9]{1}';
		//$("#SupplierForm_phone").mask("(999) 999-999?e");
		//$("#SupplierForm_fax").mask("(999) 999-999?e");
	} 
		
	defaultReload();
	
	$("#btn-new").click(function(){
		resetForm();
	});
	
	function resetForm(){
		$('#supplierForm')[0].reset();
	}
	
	$("#edgCategory").datagrid({
		onDblClickRow:function(row, data){
			$("#ItemCodeForm_category").val(data.name);
			$("#ItemCodeForm_categoryId").val(data.id);
			$("#edlCategory").dialog('close');
		}
	});
	
	
	
	
	$("#edgItemType").datagrid({
		onDblClickRow:function(row, data){
			$("#ItemCodeForm_itemType").val(data.name);
			$("#ItemCodeForm_itemTypeId").val(data.id);
			$("#edlItemType").dialog('close');
		}
	});
	
	//$("#btnItemCodeForm_itemTypeId").click(function(){
	//	$("#edlItemCodeForm_itemTypeId").dialog('open');
	//});
</script>