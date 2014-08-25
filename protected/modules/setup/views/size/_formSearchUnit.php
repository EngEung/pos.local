<table id="dgUnit"></table>
<script>
	dgUnit = $("#dgUnit");
	dgUnit.datagrid({
		title:'Item Sizes List',
		height:200,
		width:300,
		singleSelect:true,
		fitColumns:true,
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
</script>