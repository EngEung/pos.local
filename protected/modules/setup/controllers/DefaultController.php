<?php

class DefaultController extends Controller
{
	public function actionIndex()
	{
			$this->layout = 'layout_setup_master';
            $cp = new CustomerProcess;
            $lists = $cp->getCustomerLists();
            echo CJSON::encode($lists);
            $this->render('index', array('lists' => $lists));	
	}
}