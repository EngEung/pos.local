<?php

class DefaultController extends Controller
{
	public function actionIndex()
	{
<<<<<<< HEAD
		$cp = new CustomerProcess();
		$lists = $cp->getTestLists();
		var_dump("eee");
		var_dump($lists);
=======
>>>>>>> 3933f5d16a38708c95979b8367751dfc17a921a6
		$this->render('index');
	}
}