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
		<ul  id="navlist">
			<li>
				<?php echo $form->textFieldRow($model, 'unitGroupId', array('placeholder' => '', 'style' => 'width:170px;')); ?>
			</li>
			<li>
					<?php   $this->widget('bootstrap.widgets.TbButton',array(
		                                    'id'=>"btn-search-unit",
		                                    'label' => '',
		                                    'icon' => 'search',
		                                    'size' => 'small',
		                                    'buttonType' => 'button',
		                                    'htmlOptions' => array('style' => 'padding:7px;')
		                            ));?>
	             </li>
		</ul>
		
		<ul  id="navlist">
			<li>
			<?php echo $form->textFieldRow($model, 'sizeGroupId', array('placeholder' => '', 'style' => 'width:170px;')); ?>
			</li>
			<li>
					<?php   $this->widget('bootstrap.widgets.TbButton',array(
		                                    'id'=>"btn-search-size",
		                                    'label' => '',
		                                    'icon' => 'search',
		                                    'size' => 'small',
		                                    'buttonType' => 'button',
		                                    'htmlOptions' => array('style' => 'padding:7px;')
		                            ));?>
	             </li>
		</ul>
		<?php echo $form->textFieldRow($model, 'barcode', array('placeholder' => '')); ?>
	</div>

	<div id="left_col" style="width: 400px; margin: 0; padding:0; float: left;">
		<ul id="navlist">
				<li>
					<?php echo $form->hiddenField($model, 'categoryId'); ?>
					<?php echo $form->textFieldRow($model, 'category', array('placeholder' => '', 'style' => 'width:170px;')); ?>
				</li>
				<li>
					<?php   $this->widget('bootstrap.widgets.TbButton',array(
		                                    'id'=>"btn-search-cat",
		                                    'label' => '',
		                                    'icon' => 'search',
		                                    'size' => 'small',
		                                    'buttonType' => 'button',
		                                    'htmlOptions' => array('style' => 'padding:7px;')
		                            ));?>
	             </li>
      		</ul>
      		
      		<ul id="navlist">
				<li>
					<?php //echo $form->hiddenField($model, 'itemTypeId', array('placeholder' => '', 'style' => 'width:130px;')); ?>
					<?php echo $form->textFieldRow($model, 'itemType', array('placeholder' => '', 'style' => 'width:170px;')); ?>
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
	             </li>
      		</ul>
      			<?php 
	$this->widget('ext.chart.TextBoxWithSearch', array(
	'model' => $model,
	'attributeHiddenField' => 'testId',
	'attribute' => 'test',
	
	'url' => Yii::app()->baseUrl. '/dialog/DialogCategory',
	'dialogTitle' => 'Unit Type',
	'iconCls' => 'icon-th-large',
	'htmlOptions' => array('style' => 'width:170px;'),
	'columns' => array(
				array('title' => 'id', 'field'=>'id', 'width'=> 10, 'sortable'=>true),
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

<div id="edlCategory" class="easyui-dialog" title="Category Lists" style="width:535px;height:350px;padding:10px" data-options="resizable:true, maximizable:true,  modal: true, closed: true,iconCls:'icon-th-large',toolbar: '#dlg-toolbar',buttons: '#dlg-search-buttons'">
		<?php $this->widget('ext.yii-easyui.widgets.EuiDataGrid', array(
			'id' => 'edgCategory',
			'style' => 'width:auto; height: 200px',
			
			'singleSelect' => true,
			'showFooter' => true,
			'columns' => array(
				array('title' => 'id', 'field'=>'id', 'width'=> 10, 'sortable'=>true),
				array('title' => 'Name', 'field'=>'name', 'width'=> 50, 'sortable'=>true),
				array('title' => 'Description', 'field'=>'name', 'width'=> 100, 'sortable'=>true),
			),
			
		));
		?>
		<div id="dlg-toolbar" style="padding:0">
			<table cellpadding="0" cellspacing="0" style="width:100%">
				<tr>
					<td style="text-align:right;padding-right:2px">
					<input class="easyui-searchbox" data-options="prompt:'សូមPlease input somthing'" style="width:150px"></input>
					</td>
				</tr>
			</table>
		</div>
		<div id="dlg-search-buttons">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:alert('save')">Ok</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#dlg').dialog('close')">Cancel</a>
		</div>
</div>
	
	
<div id="edlItemType" class="easyui-dialog" title="Category Lists" style="width:535px;height:350px;padding:10px" data-options="resizable:true, maximizable:true,  modal: true, closed: true,iconCls:'icon-th-large',toolbar: '#dlg-toolbar1',buttons: '#dlg-search-buttons1'">
		<?php $this->widget('ext.yii-easyui.widgets.EuiDataGrid', array(
			'id' => 'edgItemType',
			'style' => 'width:auto; height: 200px',
			
			'singleSelect' => true,
			'showFooter' => true,
			'columns' => array(
				array('title' => 'id', 'field'=>'id', 'width'=> 10, 'sortable'=>true),
				array('title' => 'Name', 'field'=>'name', 'width'=> 50, 'sortable'=>true),
				array('title' => 'Description', 'field'=>'name', 'width'=> 100, 'sortable'=>true),
			),
			
		));
		?>
		<div id="dlg-toolbar1" style="padding:0">
			<table cellpadding="0" cellspacing="0" style="width:100%">
				<tr>
					<td style="text-align:right;padding-right:2px">
					<input class="easyui-searchbox" data-options="prompt:'សូមPlease input somthing'" style="width:150px"></input>
					</td>
				</tr>
			</table>
		</div>
		<div id="dlg-search-buttons1">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:alert('save')">Ok</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#dlg').dialog('close')">Cancel</a>
		</div>
</div>	
	
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
	
	$("#btn-search-cat").click(function(){
		$("#edlCategory").dialog('open');
		$("#edgCategory").datagrid({url: '<?php echo Yii::app()->baseUrl. '/dialog/DialogCategory';?>',});
	});
	$("#edgCategory").datagrid({
		onDblClickRow:function(row, data){
			$("#ItemCodeForm_category").val(data.name);
			$("#ItemCodeForm_categoryId").val(data.id);
			$("#edlCategory").dialog('close');
		}
	});
	
	
	$("#btn-search").click(function(){
		$("#edlItemType").dialog('open');
		$("#edgItemType").datagrid({url: '<?php echo Yii::app()->baseUrl. '/dialog/DialogItemType';?>',queryParams:{category_id:$("#ItemCodeForm_categoryId").val()}});
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