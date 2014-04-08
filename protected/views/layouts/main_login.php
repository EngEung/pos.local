<?php /* @var $this Controller */ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="language" content="en" />
	
	<!-- BEGIN PAGE LEVEL STYLES -->
	<link href="assets/css/pages/login.css" rel="stylesheet" type="text/css"/>
	<!-- END PAGE LEVEL STYLES -->
	
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/pages/login.css" />
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/pages/style-metro.css" />
	<!--
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/pages/style.css" />
	-->

	<title><?php echo CHtml::encode($this->pageTitle); ?></title>
	<?php Yii::app()->bootstrap->registerAssetCss("bootstrap.css");?>
	
</head>

<body class="login">
	<div class="logo">
		<!--
			<img alt="" src="<?php echo Yii::app()->request->baseUrl; ?>/images/ui/logo-big.png">
		-->
	</div>

	<div class="content">
		<?php echo $content; ?>
	</div><!-- page -->
	<div class="clear"></div>
	
	<div class="copyright"> Copyright &copy; <?php echo date('Y'); ?> by mango solutions. </div>



</body>
</html>
