<?php 
    $this->pageTitle=Yii::app()->name;
    Yii::app()->clientScript->registerCoreScript('jquery');
    $cs = Yii::app()->clientscript;
    Yii::app()->bootstrap->registerAssetCss("bootstrap.css");
    $cs->registerCssFile( Yii::app()->baseUrl . '/js/jquery-easyui/themes/icon.css' );                          
    $cs->registerCssFile( Yii::app()->baseUrl . '/js/jquery-easyui/themes/bootstrap/easyui.css' );
    $cs->registerScriptFile( Yii::app()->baseUrl . '/js/jquery-easyui/jquery.easyui.min.js');
?>      
<?php echo $this->renderPartial('/render/_dataGrid', array('model' => $model));?>
<script>
   
    /** easyui gridView Javascript */
    dg = $("#dg");
    dg.datagrid({
        title:'Customer List',
        height:400,
        singleSelect:true,
        //nowrap:false,
        //fitColumns:true,
        url:'<?php echo $this->createUrl('getCustomerLists');?>',
        toolbar: '#tb',
        idField: 'id',      
        pagination: true,
        //rownumbers: true,
        scrollbarSize: 5,
        ctrlSelect: true,
        collapsible:true,
        tools:'#ttAcc',
       columns:[[
            {title:"ID",field:"id",width:10,sortable:true},
            {title:"First Name",field:"first_name",width:100,sortable:true},
            {title:"Last Name",field:"last_name",width:100,sortable:true},
            {title:"Type",field:"customer_type_name",width:80,sortable:true},
            {title:"Phone",field:"phone1",width:120,sortable:true},
            {title:"Address",field:"address",width:120,sortable:true},
            
        ]],
    });
    
   
</script>