
<?php /* @var $this Controller */ ?>
<?php $this->beginContent('//layouts/main'); ?>
    <div id="layout_main" class="easyui-layout" style="width: auto; height: 560px; margin-top: 10px; overflow: hidden;">
        <div data-options="region:'center'" style="padding:0px;background:#eee;">
            <div id="tt12" class="easyui-tabs" style="width:auto; height:540px;">
                <?php //echo $content; ?>
            </div>
        </div>
    </div><!-- content -->
<?php $this->endContent(); ?>

<style>	
	.container-fluid{padding: 0px;}
</style>
<script>
     function addTab12(title, url){
		if ($('#tt12').tabs('exists', title)){
			$('#tt12').tabs('select', title);
		} else {
			var content ='<iframe scrolling="yes" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
			$('#tt12').tabs('add',{
                            title:title,
                            content:content,
                            closable:true
			});
		}
        }
    
</script>
