<div id="dlg" class="easyui-dialog" title="Item Unit Groups" style="width:535px;height:350px;padding:10px" data-options="resizable:true, maximizable:true,  modal: true, closed: true,iconCls:'icon-th-large',toolbar: '#dlg-toolbar',buttons: '#dlg-search-buttons'">
	<table id="dgUnit"></table>
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
	dgUnit = $("#dgUnit");
	dgUnit.datagrid({
		height:200,
		width:500,
		singleSelect:true,
		fitColumns:true,
		url:'<?php echo $this->createUrl('GetUnitGroupLists')?>',
		toolbar: '#tb',
		idField: 'id',
		rownumbers: true,
		columns:[[
			{title:"No",field:"id",width:10,sortable:true, hidden:true,},
            {title:"Groups",field:"unit_group_code",width:50,sortable:true},
			{title:"Description",field:"descr",width:50,sortable:true},
            {title:"Unit Details",field:"group_detail",width:200,sortable:true},
			
		]],
		onDblClickRow: function(index,field){
			onGetUnitGroup(field);
		}
	});
	
	function onGetUnitGroup(field){
		$("#SizeForm_unitGroupCode").val(field.unit_group_code);
		$("#SizeForm_unitGroupDescr").val(field.descr);
		$("#SizeForm_sizeDetailCode").val(field.group_detail);
		$("#btn-search").attr('disabled', 'disabled');
		$("#btn-search-cancel").removeAttr('disabled');
		$("#dlg").dialog('close');
	}
</script>