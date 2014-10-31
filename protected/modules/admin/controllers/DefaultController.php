<?php

class DefaultController extends Controller
{
	public function actionIndex()
	{
		$this->layout = 'setup_layout_column1';
		$this->render('index');
	}
}