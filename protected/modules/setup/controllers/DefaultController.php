<?php

class DefaultController extends Controller
{
	public function actionIndex()
	{
		$cp = new CustomerProcess;
		$lists = $cp->getCustomerLists();
		echo CJSON::encode($lists);
<<<<<<< HEAD
		$this->render('index');
=======
		$this->render('index', array('lists' => $lists));
>>>>>>> 3933f5d16a38708c95979b8367751dfc17a921a6
		
	}
}