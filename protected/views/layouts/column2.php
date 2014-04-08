<?php /* @var $this Controller */ ?>
<?php $this->beginContent('//layouts/main'); ?>
<div class="span-19">
	<div id="content">
		<?php echo $content; ?>
	</div><!-- content -->
</div>
<div class="span-5 last">
	<div id="sidebar">
		<div class="span6">
		    <?php
		    	 $menu = array(
		    10 => array(
		      'name' => 'Dashboard',
		      'link' => $this->createUrl('/'),
		      'icon' => 'th-large',
		      'active' => 'dashboard'
		    ),
		    20 => array(
		      'name' => 'Demo',
		      'link' => $this->createUrl('/demo'), //'#', 
		      'icon' => 'text-width',
		      'active' => 'demo',
		      'sub' => array(
		        10 => array(
		          'name' => 'General',
		          'link' => $this->createUrl('demo/index'),
		          'active' => 'demo/index',
		        ),
		        20 => array(
		          'name' => 'Second',
		          'link' => $this->createUrl('demo/second'),
		          'active' => 'demo/second',
		        )
		      )
		    ),      
		    30 => array(
		      'name' => 'Documentation',
		      'link' => $this->createUrl('/documentation'),
		      'icon' => 'list',
		      'active' => 'documentation',
		      'sub' => array(
		        10 => array(
		          'name' => 'General',
		          'link' => $this->createUrl('documentation/index'),
		          'active' => 'documentation/feature',
		        ),
		        20 => array(
		          'name' => 'Icon',
		          'link' => $this->createUrl('documentation/icon'),
		          'active' => 'documentation/icon',
		        )         
		      )
		    ),
		    40 => array(
		      'name' => 'Usage',
		      'link' => $this->createUrl('/usage'),
		      'icon' => 'asterisk',
		      'active' => 'usage',
		    ),      
		    100 => array(
		      'name' => 'Download',
		      'link' => $this->createUrl('/download'),
		      'icon' => 'download',
		      'active' => 'download',
		    ),
		  );
		$this->widget('ext.menu.EMenu', array('items' => $menu));
			
			
			 ?>
		</div>
	</div><!-- sidebar -->
</div>
<?php $this->endContent(); ?>