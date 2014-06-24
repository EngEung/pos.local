
<?php /* @var $this Controller */ ?>
<?php $this->beginContent('//../modules/setup/views/layouts/layout_setup_main'); ?>

<div class="page-container row-fluid" >
    <div class="page-content">
        <div class="container-fluid">
            <div id="cc" class="easyui-layout" style="width: auto; height: 560px;">
                <div data-options="region:'west',title:'Managing Suppliers',split:true" style="width:250px;">
                    <?php $this->widget('bootstrap.widgets.TbMenu',array(
                            'type' => 'list',
                            'items' => $this->getLeftMenu(), 
                                    ));

                            ?>
                </div>

                <div data-options="region:'center',title:'Welcome'" style="padding:5px;background:#eee;">
                    <?php echo $content; ?>
                </div>
            </div>
           
        </div>
    </div>
</div><!-- content -->
<?php $this->endContent(); ?>

<style>	
	.container-fluid{padding: 0px;}
	.btn{margin-left: 5px;}
</style>

<script>

	function addTab(title, url){
		if ($('#tt').tabs('exists', title)){
			$('#tt').tabs('select', title);
		} else {
			var content ='<iframe scrolling="yes" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
			$('#tt').tabs('add',{
                            title:title,
                            content:content,
                            closable:true
			});
		}
	}
</script>