<?php 
	$this->pageTitle=Yii::app()->name;
	$this->widget('bootstrap.widgets.TbBreadcrumbs', array(
	'links'=>array('Staff'=>$this->createUrl('/setup/customers/'), 'Lists Of Customers'),
	));
	
	Yii::app()->clientScript->registerCoreScript('jquery');
	$cs = Yii::app()->clientscript;
	$cs->registerCssFile( Yii::app()->baseUrl . '/js/jquery-easyui/themes/icon.css' );							
	$cs->registerCssFile( Yii::app()->baseUrl . '/js/jquery-easyui/themes/bootstrap/easyui.css' );
	$cs->registerScriptFile( Yii::app()->baseUrl . '/js/jquery-easyui/jquery.easyui.min.js');	
	$cs->registerScriptFile( Yii::app()->baseUrl . '/js/jquery-easyui/jquery.crud.js');	
	
	$cs->registerScriptFile(Yii::app()->baseUrl . '/js/ajaxupload/jquery.form.js', CClientScript::POS_HEAD);
	$cs->registerScriptFile(Yii::app()->baseUrl . '/js/ajaxupload/processupload.js',CClientScript::POS_HEAD );
	$cs->registerCssFile( Yii::app()->baseUrl . '/js/ajaxupload/style/style.css', CClientScript::POS_HEAD);
	
?>

<table id="dg"></table>

<script>
	/** easyui gridView Javascript */
dg.datagrid({
	title:'Education',
	height:200,
	singleSelect:true,
	nowrap:false,
	fitColumns:true,
	url:<?php echo "'".$this->createUrl('getCustomerLists')."'"?>,
	toolbar: '#tb',
	idField: 'id',		
	pagination: true,
	rownumbers: true,
	scrollbarSize: 5,
	columns:[[
		{title:"ID",field:"id",width:5,sortable:true},
			formatter: function(value,row,index){
				if(value != null){
					var url = <?php echo "'".$this->createUrl('/staff/empEducation/viewFile/?id=')."'";?>;
					return '<a target="_blank" id="file_link" href="'+url+row.file_id+'"><i class="icon-file"> </i></a>';
				}else{
					return 'N/A';
				}
			}
		}
	]]
});

</script>