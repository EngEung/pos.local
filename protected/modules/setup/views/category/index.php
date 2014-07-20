<?php 
	$this->pageTitle=Yii::app()->name;
	Yii::app()->clientScript->registerCoreScript('jquery');
	$cs = Yii::app()->clientscript;
	$cs->registerCssFile( Yii::app()->baseUrl . '/js/jquery-easyui-1.3.6/themes/icon.css' );							
	$cs->registerCssFile( Yii::app()->baseUrl . '/js/jquery-easyui-1.3.6/themes/bootstrap/easyui.css' );
	$cs->registerScriptFile( Yii::app()->baseUrl . '/js/jquery-easyui-1.3.6/jquery.easyui.min.js');
	$cs->registerScriptFile( Yii::app()->baseUrl . '/js/jquery-easyui-1.3.6/jquery.crud.js');	
?>       
	<div class="pus" style="margin-top: 20px;">
		<table id="dgCategory"></table>
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

                            $this->widget('bootstrap.widgets.TbButton',array(
                                    'id'=>"btn-refresh",
                                    'label' => 'Refresh',
                                    'icon' => 'refresh',
                                    'size' => 'small',
                            ));
                    ?>    	
                    </div>
                </div>
                
                
                <?php 
						$this->beginWidget('ext.yii-easyui.widgets.EuiWindow', array(
							'id'=> 'category-win',
							'title'=> 'Category',
							'style'=> 'width:400px;',
							'closed' => true,
							'modal' => false,
							'buttons' => '#dlg-buttons'	
						));
						
						$this->renderPartial('_form', array('model'=>$model));
						
						$this->endWidget(); 
						?>
						 <div id="dlg-buttons">
						 <?php 
						 	$this->widget('ext.yii-easyui.widgets.EuiLinkbutton', array(
								'id' => 'btn-save',		
								'text' => 'Save',
								'iconCls' => 'iconsave',
								'plain' => false
							));
						
							$this->widget('ext.yii-easyui.widgets.EuiLinkbutton', array(
								'id' => 'btn-cancel',		
								'text' => 'Cancel',
								'iconCls' => 'iconcancel',
								'plain' => false				
							));
						?>	
	</div>
<script>
   
    /** easyui gridView Javascript */
	dgCategory = $("#dgCategory");
	dgCategory.datagrid({
		title:'Currencies List',
		height:400,
		singleSelect:true,
		//nowrap:false,
		//fitColumns:true,
		url:'<?php echo $this->createUrl('getCategories')?>',
		toolbar: '#tb',
		idField: 'id',		
		//pagination: true,
		//rownumbers: true,
		//scrollbarSize: 5,
		//ctrlSelect: true,
		//collapsible:true,
		columns:[[
			{title:"ID",field:"id",width:40,sortable:true},
            {title:"Name",field:"name",width:100,sortable:true},
			{title:"Code",field:"code",width:150,sortable:true},
            {title:"Description",field:"descr",width:200,sortable:true},
			{title:"Created At",field:"created_at",width:150,sortable:true}
			
		]],
		onDblClickRow:function(index,row,value){
			title = 'Update Supplier: ' + row.name;
			addTab(title, "<?php echo $this->createUrl('/inventorycenter/supplier/update/?sup_id=');?>" + row.id);
		}
	});
	
		
	var crud = new Crud({
		route: '<?php echo $this->createUrl("index");?>',
		grid: dgCategory,
		window: $('#category-win')	
	});
	$('#btn-add').click(function(){
		crud.add();
	});
	$('#btn-edit').click(function(){
		crud.edit();
	});
	$('#btn-remove').click(function(){
		crud.remove();
	});
	$('#btn-refresh').click(function(){
		crud.refresh();
	});
	$('#btn-save').click(function(){
		crud.save();
	});
	$('#btn-cancel').click(function(){
		$('#nationality-win').dialog('close');
	});	
</script>