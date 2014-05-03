<?php

class SetupModule extends CWebModule
{
	public function init()
	{
		// this method is called when the module is being created
		// you may place code here to customize the module or the application

		// import the module-level models and components
		$this->setImport(array(
			'setup.models.*',
			'setup.components.*',
		));
<<<<<<< HEAD
	}
	
	$this->layout = '//layouts/setup_layout_column1';
=======
			
		$this->layoutPath = Yii::getPathOfAlias('setup.views.layouts');
		$this->layout = 'setup_layout_column1';
	}
	
>>>>>>> 3933f5d16a38708c95979b8367751dfc17a921a6
	public function beforeControllerAction($controller, $action)
	{
		if(parent::beforeControllerAction($controller, $action))
		{
			// this method is called before any module controller action is performed
			// you may place customized code here
			return true;
		}
		else
			return false;
	}
}
