<div class="pus" style="margin-top: 20px;">
	<table id="dg"></table>
</div>
	
<div id="tb" style="padding:5px;height:auto">
	<div style="margin-bottom:5px">
	        <?php 
	        $this->widget('bootstrap.widgets.TbButton',array(
	                'id'=>"btn-add",
	                'label' => 'Add',
	                'icon' => 'plus-sign',
	                'size' => 'small'
	        ));
	
	        $this->widget('bootstrap.widgets.TbButton',array(
	                'id'=>"btn-edit",
	                'label' => 'Edit',
	                'icon' => 'pencil',
	                'size' => 'small',
	        ));
	
	        $this->widget('bootstrap.widgets.TbButton',array(
	                'id'=>"btn-remove",
	                'label' => 'Remove',
	                'icon' => 'remove-sign',
	                'size' => 'small',
	        ));
	
	        $this->widget('bootstrap.widgets.TbButton',array(
	                'id'=>"btn-refresh",
	                'label' => 'Refresh',
	                'icon' => 'refresh',
	                'size' => 'small',
	        ));
	?>    	
	</div>
</div>


<script>
	
</script>