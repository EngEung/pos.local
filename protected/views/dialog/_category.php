<div id="dlg" class="easyui-dialog" title="Item Unit Groups" style="width:535px;height:350px;padding:10px" data-options="resizable:true, maximizable:true,  modal: true, closed: true,iconCls:'icon-th-large',toolbar: '#dlg-toolbar',buttons: '#dlg-search-buttons'">
	<table id="dgCategory"></table>
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

<script>
   
    /** easyui gridView Javascript */
	dgCategory = $("#dgCategory");
	dgCategory.datagrid({
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
			{title:"Category",field:"id",width:70,sortable:true},
           	{title:"Description",field:"code",width:150,sortable:true},
		]],
	});
</script>