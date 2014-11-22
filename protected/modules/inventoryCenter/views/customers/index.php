<?php 
    $this->pageTitle=Yii::app()->name;
    Yii::app()->clientScript->registerCoreScript('jquery');
    $cs = Yii::app()->clientscript;
    Yii::app()->bootstrap->registerAssetCss("bootstrap.css");
    $cs->registerCssFile( Yii::app()->baseUrl . '/js/jquery-easyui/themes/icon.css' );                          
    $cs->registerCssFile( Yii::app()->baseUrl . '/js/jquery-easyui/themes/bootstrap/easyui.css' );
    $cs->registerScriptFile( Yii::app()->baseUrl . '/js/jquery-easyui/jquery.easyui.min.js');
?>      
<div class="pus" style="margin-top: 20px;">
    <table id="dg"></table>
    <div id="ttAcc">
        <a href="javascript:void(0)" class="iconreload" onclick="javascript:dg.datagrid('reload');"></a>
    </div>
</div>


<div id="tb" style="padding:5px;height:auto">
    <div style="margin-bottom:5px">
            <?php 
            $this->widget('bootstrap.widgets.TbButton',array(
                    'id'=>"btn-add",
                    'label' => 'Add',
                    'icon' => 'plus-sign',
                    'size' => 'small'
            ));
    
            $this->widget('bootstrap.widgets.TbButton',array(
                    'id'=>"btn-edit",
                    'label' => 'Edit',
                    'icon' => 'pencil',
                    'size' => 'small',
            ));
    
            $this->widget('bootstrap.widgets.TbButton',array(
                    'id'=>"btn-remove",
                    'label' => 'Remove',
                    'icon' => 'remove-sign',
                    'size' => 'small',
            ));
    ?>      
    </div>
</div>

<div id="win-form" class="easyui-dialog" title="Add Customer" 
    data-options="maximized:true, buttons:'#dlg-buttons', maximizable:true, resizable:true, closed: true, iconCls:'icon-save'" style="width:850px;height:350px;padding:10px;">
    <?php $this->renderPartial('_form', array('model' => $model));?>
</div>

<div id="win-form-edit" class="easyui-dialog" title="Edit Customer" 
    data-options="maximized:true, buttons:'#dlg-buttons-edit', maximizable:true, resizable:true, closed: true, iconCls:'icon-save'" style="width:850px;height:350px;">
    
     <div class="easyui-tabs" style="width:100%;height:350px">
        <div title="General" style="padding:10px">
            <?php $this->renderPartial('_form', array('model' => $model));?>
        </div>
        <div title="Shipping" style="padding:10px">
            <ul class="easyui-tree" data-options="url:'tree_data1.json',method:'get',animate:true"></ul>
            </div>
           
     </div>
    
</div>

<div id="dlg-buttons" class="dialog-button" style="">
     <?php 
     
          $this->widget('bootstrap.widgets.TbButton',array(
             'id' => 'btn-new', 
             'label' => 'New',
             'size' => 'small',
             'buttonType'=>'submit',
             'htmlOptions' => array('style' => 'margin-left:5px;'),
          ));
        
           $this->widget('bootstrap.widgets.TbButton',array(
             'id' => 'btn-save-close',  
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
    
    $("#btn-add").click(function(){
        $("#win-form").dialog('open');
        //$('#win-form').dialog('refresh', '<?php //echo $this->createUrl('openForm');?>');
    });
 
    $("#btn-cancel").click(function(){
        $("#win-form").dialog('close');
    });
    
     $("#btn-edit").click(function(){
         var row = dg.datagrid("getSelected");
        $("#win-form-edit").dialog('open');
        $("#win-form-edit").dialog({title: 'Customer: ' + row.first_name +' '+ row.last_name});
        //$('#win-form').dialog('refresh', '<?php //echo $this->createUrl('openForm');?>');
    });
 
    
   
</script>