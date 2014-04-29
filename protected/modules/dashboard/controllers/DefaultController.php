<?php

class DefaultController extends Controller
{
	public function actionIndex()
	{
		$cp = new CustomerProcess();
		$lists = $cp->getCount();
		var_dump("eee");
		var_dump($lists);
		$this->render('index');
	}
}