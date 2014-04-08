<?php

// uncomment the following to define a path alias
// Yii::setPathOfAlias('local','path/to/local-folder');

// This is the main Web application configuration. Any writable
// CWebApplication properties can be configured here.

Yii::setPathOfAlias('bootstrap', dirname(__FILE__).'/../extensions/bootstrap');

return array(
	'basePath'=>dirname(__FILE__).DIRECTORY_SEPARATOR.'..',
	'name'=>'POS | Poin of Managment System',
	'defaultController' => 'home', 

	// preloading 'log' component
	'preload'=>array('log'),

	// autoloading model and component classes
	'import'=>array(
		'application.models.*',
		'application.components.*',
		'application.models.forms.*',
		'application.extensions.*',
		'application.modules.*',
		'application.modules.setup.models.forms.*',
	),

	'modules'=>array(
		// uncomment the following to enable the Gii tool
		/*
		'gii'=>array(
			'class'=>'system.gii.GiiModule',
			'password'=>'Enter Your Password Here',
			// If removed, Gii defaults to localhost only. Edit carefully to taste.
			'ipFilters'=>array('127.0.0.1','::1'),
		),
		*/
		'saleOrder',
		'setup'
	),

	// application components
	'components'=>array(
		'user'=>array(
			// enable cookie-based authentication
			'allowAutoLogin'=>true,
		),
		
		'bootstrap'=>array(
				'class'=>'bootstrap.components.Bootstrap',
				'responsiveCss' => true,
		),
		// uncomment the following to enable URLs in path-format
		
		// URL routes
		'urlManager'=>array(
				'urlFormat'=>'path',
				'rules'=>array(
						'<controller:\w+>/<id:\d+>'=>'<controller>/view',
						'<controller:\w+>/<action:\w+>/<id:\d+>'=>'<controller>/<action>',
						'<controller:\w+>/<action:\w+>'=>'<controller>/<action>',
				),
				'showScriptName'=>false,
				'caseSensitive'=>false,
		),
		
		// uncomment the following to use a MySQL database
		
		// Server 	
		/*
		'db'=>array(
					'connectionString' => 'mysql:host=192.168.17.11;dbname=hrms',
					'emulatePrepare' => true,
					'username' => 'root',
					'password' => 'ipcx',
					'charset' => 'utf8',
				),*/
	
		// localhost mysql
		'db'=>array(
			'connectionString' => 'mysql:host=localhost;dbname=pos_dev',
			'emulatePrepare' => true,
			'username' => 'root',
			'password' => '',
			'charset' => 'utf8',
		),
	
		// localhost sql server 2008
		/*
		'dbsql'=>array(
			'connectionString' => 'sqlsrv:Server=EngEung-LP\SQLEXPRESS;Database=posmango',
			'emulatePrepare' => true,
			'username' => 'EngEung-LP',
			'password' => '@lak@eng',
			'charset' => 'utf8',
		),
		*/
		// Yii session
		'session' => array (
				'sessionName' => 'hrmsession',
				'class'=> 'CDbHttpSession',
				'autoCreateSessionTable'=> true,
				'connectionID' => 'db',
				'sessionTableName' => 'yii_sessions',
				'autoStart' => true,
				'cookieMode' => 'only',
				'timeout' => 1800, // 1800/60 = 30 minutes; timeout is in seconds
		),
		
		'errorHandler'=>array(
			// use 'site/error' action to display errors
			'errorAction'=>'site/error',
		),
		'log'=>array(
			'class'=>'CLogRouter',
			'routes'=>array(
				array(
					'class'=>'CFileLogRoute',
					'levels'=>'error, warning',
				),
				// uncomment the following to show log messages on web pages
				/*
				array(
					'class'=>'CWebLogRoute',
				),
				*/
			),
		),
	),

	// application-level parameters that can be accessed
	// using Yii::app()->params['paramName']
	'params'=>array(
		// this is used in contact page
		'adminEmail'=>'ing.eng@cogetel.com.kh',
	),
);