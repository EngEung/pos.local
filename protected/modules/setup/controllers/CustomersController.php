<?php
class CustomersController extends Controller{
	
	public function actionIndex(){
		$this->authenticate();
		$this->layout = 'setup_layout_column1';	
		$this->render('index');
	}
	
	public function actionGetCustomerLists(){
		$this->authenticate();
		$cp = new CustomerProcess;
		$lists = $cp->getCustomerLists();
		echo CJSON::encode($lists);
	}
	
	public function actionCreate(){
		$this->authenticate();
		$this->layout = 'setup_layout';
		$model = new CustomerForm();
		$cp = new CustomerProcess();
		if(isset($_GET['custId'])){
			$model = $cp->getCustomerByID($_GET['custId']);
		}
		
		if(isset($_POST['CustomerForm'])){
			$model->attributes = $_POST['CustomerForm'];
			$validated=$model->validate();
			if($validated){
					
				$model->firstName = $_POST['CustomerForm']['firstName'];
				$model->lastName = $_POST['CustomerForm']['lastName'];
				$model->titleId = $_POST['CustomerForm']['titleId'];
				$model->phone1 = $_POST['CustomerForm']['phone1'];
				$model->phone2 = $_POST['CustomerForm']['phone2'];
				$model->fax = $_POST['CustomerForm']['fax'];
				$model->email1 = $_POST['CustomerForm']['email1'];
				$model->locationId = $_POST['CustomerForm']['locationId'];
				$model->address = $_POST['CustomerForm']['address'];
				$model->note = $_POST['CustomerForm']['note'];
				$model->customerTypeId = $_POST['CustomerForm']['customerTypeId'];
				
				$model->picture = CUploadedFile::getInstance($model, 'picture');
				$rc = $cp->createCustomer($model);
			}
		}
		$this->render('create', array('model' => $model));
	}
	
	public function actionUpdate(){
		
	}
	
	public function actionShipping(){
		$this->authenticate();
		$this->layout = 'setup_layout';
		$this->render('shipping');
	}
	
	
	public function actionGeneral(){
		$this->authenticate();
		$this->layout = 'setup_layout';
		$custId = null;
		if(isset($_GET['cust_id']))
			$custId = $_GET['cust_id'];
		$this->render('general', array('custId' => $custId));
	}
	
	public function actionGetCustomerShipping(){
		$cusShipping = new CustomerShippingProcess();
		$custId = 0;
		if(isset($_GET['custId']))
			$custId = $_GET['custId'];
		echo CJSON::encode($cusShipping->getCustomerShippingLists($custId));
	}
}


?>