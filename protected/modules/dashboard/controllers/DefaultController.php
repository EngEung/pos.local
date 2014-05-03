<?php

class DefaultController extends Controller
{
	public function actionIndex()
	{
		$cp = new CustomerProcess();
		$lists = $cp->getTestLists();
		var_dump("eee");
		var_dump($lists);
		$this->render('index');
	}
}