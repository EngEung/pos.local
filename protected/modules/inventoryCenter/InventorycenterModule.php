<?php

class InventorycenterModule extends CWebModule
{
	public function init()
	{
		// this method is called when the module is being created
		// you may place code here to customize the module or the application

		// import the module-level models and components
		$this->setImport(array(
			'inventorycenter.models.*',
			'inventorycenter.components.*',
		));
		$this->layoutPath = Yii::getPathOfAlias('inventorycenter.views.layouts');
		$this->layout = 'setup_layout_column1';
        $this->layout = 'layout_setup_main';
	}

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
