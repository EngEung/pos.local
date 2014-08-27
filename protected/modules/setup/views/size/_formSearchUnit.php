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
<div id="dlg-buttons">
	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:alert('save')">Save</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#dlg').dialog('close')">Close</a>
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
		onDblClickCell: function(index,field,value){
			alert('dsfdf');
		}
	});
	
</script>