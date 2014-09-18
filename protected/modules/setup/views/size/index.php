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
		<table id="dgSize"></table>
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
							'id'=> 'size-win',
							'title'=> 'Item Sizes',
							'style'=> 'width:580px; height:460px;',
							'closed' => true,
							'modal' => false,
							'resizable' => true, 
							'maximizable' => true,
							'buttons' => '#dlg-buttons'	,
							'iconCls'=>'icon-th-large'
						));
						
						$this->renderPartial('_form', array('model'=>$model));
						
						$this->endWidget(); 
						?>
						 <div id="dlg-buttons">
						 <?php 
						 	$this->widget('ext.yii-easyui.widgets.EuiLinkbutton', array(
								'id' => 'btn-save',		
								'text' => 'Save',
								'plain' => false
							));
						
							$this->widget('ext.yii-easyui.widgets.EuiLinkbutton', array(
								'id' => 'btn-cancel',		
								'text' => 'Cancel',
								'plain' => false				
							));
						?>	
	</div>
<script>
   
    /** easyui gridView Javascript */
	dgSize = $("#dgSize");
	dgSize.datagrid({
		title:'Item Sizes List',
		height:400,
		singleSelect:true,
		//nowrap:false,
		//fitColumns:true,
		url:'<?php echo $this->createUrl('getSizeLists')?>',
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
			
		]]
	});
$("#btn-add").click(function(){
	$('#size-win').window('open');
})

$("#btn-search").click(function(){
	$('#dlg').window('open');
})
$("#btn-save").click(function(){
	var data = $("#itemSizeForm").serialize();
	$.ajax({
			url: '<?php echo $this->createUrl('createItemSize');?>',
	        type: 'post',
	       	data: data,
	        dataType: 'json',
	        success: function (response) {
	      		//$.messager.alert('Sucess','Your action has been successfully.');
	      		refreshGrid(dgItemUnit);
	      		$('#unit-win').dialog('close');
	       	},
	       erorr: function (){
	       		$.messager.alert('Error','Error occured.please try again.','warning');
	       }
	})
});	

</script>