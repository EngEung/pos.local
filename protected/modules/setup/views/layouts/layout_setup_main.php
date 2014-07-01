
<?php /* @var $this Controller */ ?>
<?php $this->beginContent('//layouts/main'); ?>
    <div id="layout_main" class="easyui-layout" style="width: auto; height: 560px; margin-top: 10px; overflow: hidden;">
        <div data-options="region:'center'" style="padding:0px;background:#eee;">
            <div id="tab_dashboard" class="easyui-tabs" style="width:auto; height:540px;">
                <?php echo $content; ?>
            </div>
        </div>
    </div><!-- content -->
<?php $this->endContent(); ?>
<script>
     function addTabDashboard(title, url){
		if ($('#tab_dashboard').tabs('exists', title)){
			$('#tab_dashboard').tabs('select', title);
		} else {
			var content ='<iframe scrolling="yes" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
			$('#tab_dashboard').tabs('add',{
                            title:title,
                            content:content,
                            closable:true
			});
		}
        }
    
</script>
