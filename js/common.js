/**
     *Show message not record
     *http://stackoverflow.com/questions/16399567/how-to-show-a-message-ex-no-records-found-in-the-table-when-no-records-is-re 
     */
	function showGridMessage(dg){
	    var opts = dg.datagrid('options');
		var vc = dg.datagrid('getPanel').children('div.datagrid-view');
		vc.children('div.datagrid-empty').remove();
		if (!dg.datagrid('getRows').length){
			var d = $('<div class="datagrid-empty"></div>').html('No Records Found').appendTo(vc);
		    d.css({
		        position:'absolute',
		        left:0,
		        top:40,
		        width:'100%',
		        textAlign:'center'
		    });
		}else{
	      	vc.children('div.datagrid-empty').remove();
	    }
	}
	
	function refreshGrid(dg){
		dg.datagrid('clearSelections');
		dg.datagrid('reload');
	}

	function clearGrid(dg){
		dg.datagrid('loadData', {"total":0,"rows":[]});
	}