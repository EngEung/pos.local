<?php

class DefaultController extends Controller
{
	public function actionIndex()
	{ 
            $this->layout = 'layout_setup_main';
			$model = new ItemCodeForm();
            $this->render('index', array('model' => $model));
	}
}