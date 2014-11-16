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

<div id="win-form" class="easyui-dialog" title="Basic Window" 
	data-options="maximized:true, buttons:'#dlg-buttons', maximizable:true, resizable:true, closed: true, iconCls:'icon-save'" style="width:850px;height:350px;padding:10px;">
	<?php $this->renderPartial('_form', array('model' => $model));?>
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
	$("#btn-add").click(function(){

		$("#win-form").dialog('open');
		//$('#win-form').dialog('refresh', '<?php //echo $this->createUrl('openForm');?>');
	});
	
	$("#btn-cancel").click(function(){
		$("#win-form").dialog('close');
	});
</script>

