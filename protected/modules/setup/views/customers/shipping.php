<?php 
	$this->pageTitle=Yii::app()->name . ' - Customers';
	$this->breadcrumbs=array(
		'Create Customer',
	);
	/** Client Script**/
	Yii::app()->clientScript->registerCoreScript('jquery');
	$cs = Yii::app()->clientscript;						
	$cs->registerCssFile( Yii::app()->baseUrl . '/js/jquery-easyui/themes/bootstrap/easyui.css' );
	$cs->registerCssFile( Yii::app()->baseUrl . '/js/jasny-bootstrap/css/jasny-bootstrap.min.css' );
	
	$cs->registerScriptFile( Yii::app()->baseUrl . '/js/jquery-easyui/jquery.easyui.min.js', CClientScript::POS_HEAD);
	$cs->registerScriptFile(Yii::app()->baseUrl . '/js/masktextbox/masktextbox.js',CClientScript::POS_HEAD );
	$cs->registerScriptFile( Yii::app()->baseUrl . '/js/common.js');
?>
<table id="dgShipping"></table>

<div id="tb" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
		<?php 
		$this->widget('bootstrap.widgets.TbButton',array(
			'id'=>"btn-add",
			'label' => 'Add',
			//'type' => 'primary',
			'icon' => 'plus-sign',
			'size' => 'small',
		));
		
		$this->widget('bootstrap.widgets.TbButton',array(
			'id'=>"btn-edit",
			'label' => 'Edit',
			//'type' => 'primary',
			'icon' => 'pencil',
			'size' => 'small',
		));
		
		$this->widget('bootstrap.widgets.TbButton',array(
			'id'=>"btn-remove",
			'label' => 'Remove',
			//'type' => 'primary',
			'icon' => 'remove-sign',
			'size' => 'small',
		));
		
		$this->widget('bootstrap.widgets.TbButton',array(
			'id'=>"btn-refresh",
			'label' => 'Refresh',
			//'type' => 'primary',
			'icon' => 'refresh',
			'size' => 'small',
		));
	?>    	
	</div>
</div>
<?php 
$this->beginWidget('ext.yii-easyui.widgets.EuiWindow', array(
	'id'=> 'windowForm',
	'style'=> 'width:300px',
	'closed' => true,
	'modal' => true,
	'buttons' => '#dlg-buttons'	// for button save
));
	//$this->renderPartial('_form', array('model'=>$model));
	
$this->endWidget();  
?>


<div id="dlg-buttons">
	 <?php 
	 	 $this->widget('bootstrap.widgets.TbButton',array(
			'id' => 'btn-save',	
			'label' => 'Save & New',
			'size' => 'small',
			'htmlOptions' => array('style' => 'margin-left:5px;'),
		 ));
		 
		 $this->widget('bootstrap.widgets.TbButton',array(
			'id' => 'btn-save-close',	
			'label' => 'Save & close',
			'size' => 'small',
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


<style>
</style>
<script>
	dgShipping = $("#dgShipping");
	
	dgShipping.datagrid({
		title:'Shipping',
		height:400,
		singleSelect:true,
		nowrap:false,
		fitColumns:true,
		url:'<?php echo $this->createUrl('getCustomerShipping');?>',
		toolbar: '#tb',
		idField: 'id',		
		pagination: true,
		rownumbers: true,
		scrollbarSize: 5,
		ctrlSelect: true,
		collapsible:true,
		columns:[[
			{title:"ID",field:"id",width:10,sortable:true},
			{title:"Shipping To",field:"shipping_to",width:100,sortable:true},
			{title:"Shipping Address",field:"shipping_address",width:100,sortable:true},
			{title:"Created At",field:"created_at",width:80,sortable:true},
		]],
		onLoadSuccess:function(data){
           	showGridMessage(dgShipping);
   		},
	});

$('#btn-add').click(function(){
	//resetForm();
	$('#windowForm').window({title:'Add Customer\'s Shipping',iconCls:'icon-share'});
	$('#windowForm').window('open')
});	
</script>