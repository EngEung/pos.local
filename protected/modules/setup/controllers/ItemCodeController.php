<?php

class ItemCodeController extends Controller
{
	public function actionIndex()
	{
		$this->authenticate();        
        $this->layout = 'setup_layout';
		$model = new SizeForm();
		$this->render('index', array('model' => $model));
	}
}