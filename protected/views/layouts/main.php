<?php /* @var $this Controller */ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="language" content="en" />
	<?php Yii::app()->bootstrap->registerAssetCss("bootstrap.css");?>
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/main.css" />
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/style.css" />
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/pages/style-responsive.css" />
	
	<title><?php echo CHtml::encode($this->pageTitle); ?></title>
</head>

<body class="page-header-fixed page-full-width">
	<!--Begin header-->
		 <?php 
			 $this->widget('bootstrap.widgets.TbNavbar', array(
		    'type'=>'inverse', // null or 'inverse'
		    'brand'=>'POS',
		    'brandUrl'=>'#',
		    'collapse'=>true, // requires bootstrap-responsive.css
		    'fixed' =>'top',
		    'fluid'=>true,
		    'htmlOptions'=>array('class' =>'header'),
		    'items'=>array(
				array(
					'class'=>'bootstrap.widgets.TbMenu',
					'items'=>array(
						array('label'=>'Home', 'url' => '#', 'active' => true),
						/*array('label'=>'Staff', 'url'=>'#', 'items'=>array(
							array('label'=>'Employee Management','icon'=>'home', 'url'=>'#'),
							array('label'=>'Leve Management', 'icon'=>'calendar', 'url'=>'#'),
							array('label'=>'Mission Management', 'icon'=>'ok','url'=>'#'),
							array('label'=>'User Management','icon'=>'user', 'url'=>'#'),
						)),*/
					),
				),
				array(
					'class'=>'bootstrap.widgets.TbMenu',
					'htmlOptions' => array('class' => 'pull-right'),
					'items'=>array(
						array('label'=>'Sign in', 'url' => $this->createUrl('/sec/signin'))
					),
				),	       
		    ),
		)); ?>
	
	<!--End header-->
	
	<?php if(isset($this->breadcrumbs)):?>
		<?php $this->widget('zii.widgets.CBreadcrumbs', array(
			'links'=>$this->breadcrumbs,
		)); ?><!-- breadcrumbs -->
	<?php endif?>

	<?php echo $content; ?>

	<!-- BEGIN FOOTER -->
	<div class="footer">
		<div class="footer-inner">
			2013 &copy; mango solutions.
		</div>
	</div>
	<!-- END FOOTER -->

</body>
</html>