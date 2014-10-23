<?php 
	$this->pageTitle=Yii::app()->name;
	Yii::app()->clientScript->registerCoreScript('jquery');
	$cs = Yii::app()->clientscript;
	
	$cs->registerScriptFile( Yii::app()->baseUrl . '/js/jquery-easyui/jquery.easyui.min.js');
	$cs->registerCssFile( Yii::app()->baseUrl . '/js/jquery-easyui/themes/icon.css' );							
	$cs->registerCssFile( Yii::app()->baseUrl . '/js/jquery-easyui/themes/bootstrap/easyui.css' );
?>      
<?php echo $this->renderPartial('/render/_dataGrid', array('model' => $model));?>
<script>
   
    /** easyui gridView Javascript */
	dg = $("#dg");
	dg.datagrid({
		title:'Item Codes List',
		height:400,
		singleSelect:true,
		nowrap:false,
		fitColumns:true,
		url:'<?php echo $this->createUrl('getItemCodes')?>',
		toolbar: '#tb',
		idField: 'id',		
		pagination: true,
		//rownumbers: true,
		scrollbarSize: 5,
		ctrlSelect: true,
		collapsible:true,
		tools:'#ttAcc',
		columns:[[
			{title:"Item Code",field:"id",width:70,sortable:true},
           	{title:"Description",field:"code",width:150,sortable:true},
            {title:"Item Type",field:"descr",width:150,sortable:true},
            {title:"Category",field:"descr",width:150,sortable:true},
			{title:"Created At",field:"created_at",width:150,sortable:true},
			{title:"Created By",field:"created_by",width:150,sortable:true}	
			
		]],
	});
</script>