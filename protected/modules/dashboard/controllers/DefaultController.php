<?php

class DefaultController extends Controller
{
	public function actionIndex()
	{ 
		$model = new ItemCodeForm();
        $this->render('index', array('model' => $model));
	}
}