<?php 

	Yii::app()->clientScript->registerCoreScript('jquery');
	$cs = Yii::app()->clientscript;

	$cs->registerCssFile( Yii::app()->baseUrl . '/js/jquery-easyui-1.3.6/themes/icon.css' );							
	$cs->registerCssFile( Yii::app()->baseUrl . '/js/jquery-easyui-1.3.6/themes/bootstrap/easyui.css' );
	$cs->registerScriptFile( Yii::app()->baseUrl . '/js/jquery-easyui-1.3.6/jquery.easyui.min.js');	
	
	$cs->registerScriptFile(Yii::app()->baseUrl . '/js/ajaxupload/jquery.form.js', CClientScript::POS_HEAD);
	$cs->registerScriptFile(Yii::app()->baseUrl . '/js/ajaxupload/processupload.js',CClientScript::POS_HEAD );
	
?>
<div id="ddd" class="easyui-tabs" style="width:auto; height:540px;">
	
	
</div>
<script>

    $('#ddd').tabs({
		   onSelect:function(title){
		   		if(title == 'Customer Info'){
		   		//	win = $.messager.progress({title:'Please waiting',msg:'Loading data...'});
		   			//$.ajax({
		   			
		   		//	});
		   			//$.messager.progress('close');	
		   		}
	       }
    });
	    // add a new tab panel
   
    $('#ddd').tabs('add',{
    	   id:"#customer-info",
	       title:'Customer Info',
	       selected : true,
	       content:'<iframe scrolling="auto" frameborder="0"  src="<?php echo $this->createUrl("/setup/customers/create/?custId=$custId");?>" style="width:100%;height:100%;"></iframe>',
	      
    	}
    );
    
    $('#ddd').tabs('add',{
    		id:"#customer-shipping",
	       title:'Customer shipping',
	       selected : false,
	       content:'Tab Body',
    	}
    );
    
    $('#ddd').tabs('add',{
    	   id:"#customer-purchase-history",
	       title:'Purchase History',
	       selected : false,
	       content:'Tab Body',
    	}
    );
    
     $('#ddd').tabs('add',{
    	   id:"#customer-purchase-history",
	       title:'Account Recievable',
	       selected : false,
	       content:'Tab Body',
    	}
    );
    
    function loadContentCustomerInfo(){
    	
    }
</script>
