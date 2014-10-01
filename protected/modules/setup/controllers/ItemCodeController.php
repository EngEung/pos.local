<?php

class ItemCodeController extends Controller
{
	public function actionIndex()
	{
		$this->authenticate();        
        $this->layout = 'setup_layout';
		
		$this->render('index');
	}
	
	public function actionGetItemCodes(){
		$itemCodePro = new ItemCodeProcess();
		echo CJSON::encode($itemCodePro->getItemCodes());
	}
	
	public function actionOpenForm(){
		$model = new ItemCodeForm();
		$this->renderPartial('_form', array('model' => $model));
	}
	
}