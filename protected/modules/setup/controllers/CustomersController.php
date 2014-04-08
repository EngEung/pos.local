<?php
class CustomersController extends Controller{
	
	
	
	public function actionIndex(){
		$this->render('index');
	}
	
	public function actionGetCustomerLists(){
		$cp = new CustomerProcess;
		$lists = $cp->getCustomerLists();
		echo CJSON::encode($lists);
	}
	
	public function actionCreate(){
		$model = new CustomerForm();
		$this->render('create', array('model' => $model));
	}
	
	public function actionUpdate(){
		
	}
}


?>