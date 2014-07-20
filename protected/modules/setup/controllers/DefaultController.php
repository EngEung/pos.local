<?php

class DefaultController extends Controller
{
	public function actionIndex()
	{

		$this->layout = 'layout_setup_master';
        $this->render('index');	
	}
}