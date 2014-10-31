<?php /* @var $this Controller */ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="language" content="en" />
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/js/jquery-easyui/themes/bootstrap/easyui.css" />
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/main.css" />
</head>

<body class="easyui-layout layout panel-noscroll easyui-fluid" style="text-align: left;">
    
		<div data-options="region:'north'" style="height:70px;background:#F5F5F5;">
			<div id="header">
				<div id="header-content">
					<div id="logo">
						<a href="/">
							Logo
						</a>
					</div>
					<div id="top-panel">
				   	   <div id="top-menu">
							<div class="top-hori-menu">
								<ul>
									<li title=""><a href="/account"><span>Sign In</span></a></li>|
									<li title=""><a href="/account"><span>About</span></a></li>|
									<li title=""><a href="/account"><span>Contact</span></a></li>|
									<li title=""><a href="/account"><span>My Account</span></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div data-options="region:'east',split:true" title="Operations" style="width:200px;"></div>
		<div data-options="region:'west',split:true" title="Operations" style="width:250px;">
			 <ul class="easyui-tree">
				<li>
				<span>My Documents</span>
				<ul>
				<li data-options="state:'closed'">
				<span>Photos</span>
				<ul>
				<li>
				<span>Friend</span>
				</li>
				<li>
				<span>Wife</span>
				</li>
				<li>
				<span>Company</span>
				</li>
				</ul>
				</li>
				<li>
				<span>Program Files</span>
				<ul>
				<li>Intel</li>
				<li>Java</li>
				<li>Microsoft Office</li>
				<li>Games</li>
				</ul>
				</li>
				<li>index.html</li>
				<li>about.html</li>
				<li>welcome.html</li>
				</ul>
				</li>
				</ul>
		</div>
		<div data-options="region:'center',title:'Main Title',iconCls:'icon-ok'">
			<?php echo $content; ?>
		</div>
</body>
</html>