/* License http://www.gnu.org/licenses/gpl.html GNU/GPL */


(function (d) {
	dg = $("#dg");
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
			{title:"Category",field:"id",width:70,sortable:true},
           	{title:"Description",field:"code",width:150,sortable:true},
		]],
	});
})(jQuery);