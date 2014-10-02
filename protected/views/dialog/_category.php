
<div id="win-form" class="easyui-dialog" title="Basic Window" 
	data-options="buttons:'#dlg-buttons', resizable:false, closed: true, iconCls:'icon-save'" style="width:850px;height:400px;padding:10px;">
	<table id="dgCategory"></table>
</div>
<script>
   
    /** easyui gridView Javascript */
	dgCategory = $("#dgCategory");
	dg.datagrid({
		title:'Item Codes List',
		height:400,
		singleSelect:true,
		nowrap:false,
		fitColumns:true,
		url:'<?php echo Yii::app()->baseURL . '/dialog/getCategory/'?>',
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