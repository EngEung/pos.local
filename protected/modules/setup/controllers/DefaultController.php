<?php

class DefaultController extends Controller
{
	public function actionIndex()
	{
		$cp = new CustomerProcess;
		$lists = $cp->getCustomerLists();
		echo CJSON::encode($lists);
		$this->render('index', array('lists' => $lists));
		
	}
}