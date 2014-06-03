
<br/>
<?php 
	$this->pageTitle=Yii::app()->name . ' - Customer Shippings';
	/** Client Script**/
	Yii::app()->clientScript->registerCoreScript('jquery');
	$cs = Yii::app()->clientscript;						
	$cs->registerCssFile( Yii::app()->baseUrl . '/js/jquery-easyui/themes/bootstrap/easyui.css' );
	$cs->registerCssFile( Yii::app()->baseUrl . '/js/jasny-bootstrap/css/jasny-bootstrap.min.css' );
	
	$cs->registerScriptFile( Yii::app()->baseUrl . '/js/jquery-easyui/jquery.easyui.min.js', CClientScript::POS_HEAD);
	$cs->registerScriptFile( Yii::app()->baseUrl . '/js/common.js');
        $cs->registerScriptFile( Yii::app()->baseUrl . '/js/jquery-easyui/jquery.crud.js');	
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
	'style'=> 'width:500px',
	'closed' => true,
	//'modal' => true,
	'buttons' => '#dlg-buttons'	// for button save
)); 
	$this->renderPartial('_formShipping', array('model'=>$model));
	        
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
    .datagrid-toolbar .btn{margin-left: 5px;}
</style>
<script>
	dgShipping = $("#dgShipping");
	form = $("#windowForm");
	dgShipping.datagrid({
		title:'Shipping',
		height:400,
		singleSelect:true,
		nowrap:false,
		fitColumns:true,
		url:'<?php echo $this->createUrl('getCustomerShipping', array('custId' => $model->custId));?>',
		toolbar: '#tb',
		idField: 'id',		
		pagination: true,
		rownumbers: true,
		scrollbarSize: 5,
		ctrlSelect: true,
		collapsible:true,
		columns:[[
			{title:"ID",field:"id",width:10,sortable:true, hidden:true},
			{title:"Shipping To",field:"shipping_to",width:100,sortable:true},
			{title:"Shipping Address",field:"shipping_address",width:100,sortable:true},
                        {title:"Note",field:"note",width:100,sortable:true},		
                        {title:"Created At",field:"created_at",width:50},
                        {title:"Created By",field:"created_by",width:50},
		]],
		onLoadSuccess:function(data){
                    showGridMessage(dgShipping);
   		},
	});

var crud = new Crud({
	route: '<?php echo $this->createUrl('index');?>',
	grid: dgShipping,
	window: form	
});
$('#btn-add').click(function(){
    crud.add('createShipping', 'New Shipping');
	//form.window({title:'New Shipping',iconCls:'icon-share'});
	//$('#windowForm').window('open')
});	

$('#btn-save').click(function(){
    crud.save('createShipping');
});
$("#btn-edit").click(function(){
   crud.edit(); 
});
</script>