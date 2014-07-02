<?php
class SupplierController extends Controller{
	
	public function actionIndex(){
		//$this->authenticate();
		$this->layout = 'layout_setup_master';
		$this->render('index');
	}
	
	public function actionGetSupplierLists(){
		$this->authenticate();
		$sp = new SupplierProcess;
		$lists = $sp->getSupplierLists();
		echo CJSON::encode($lists);
	}
	
	public function actionCreate(){
		$this->authenticate();
		$this->layout = 'setup_layout';
		$model = new SupplierForm();
		$sp = new SupplierProcess();
		if(isset($_POST['SupplierForm'])){
			$model->attributes = $_POST['SupplierForm'];
			if($model->validate()){
				$model->address2 = $_POST['SupplierForm']['address2'];
				$model->cityId = $_POST['SupplierForm']['cityId'];
				$model->stateProvinceId = $_POST['SupplierForm']['stateProvinceId'];
				$model->postalCode = $_POST['SupplierForm']['postalCode'];
				$model->countryId = $_POST['SupplierForm']['countryId'];
				$model->contact = $_POST['SupplierForm']['contact'];
				$model->fax = $_POST['SupplierForm']['fax'];
				$model->email = $_POST['SupplierForm']['email'];
				$model->website = $_POST['SupplierForm']['website'];
				$flage = $sp->createSupplier($model);
				if($flage) Yii::app()->user->setFlash('suc_message', 'Your action has been sucessfully.');
				else Yii::app()->user->setFlash('error_message', 'Your action has not been sucessfully.');
			}
		}
		$this->render('create', array('model' => $model));
	}

	public function actionUpdate(){
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
		$this->render('update', array('model' => $model));
	}
	
}


?>