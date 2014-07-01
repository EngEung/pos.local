<?php

class DefaultController extends Controller
{
	public function actionIndex()
	{ 
            $this->layout = 'layout_setup_main';
            $this->render('index');
	}
}