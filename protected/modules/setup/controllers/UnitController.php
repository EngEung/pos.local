<?php
class UnitController extends Controller{
	
	public function actionIndex(){
		$this->authenticate();        
        $this->layout = 'setup_layout';
		$model = new UnitForm();
		$this->render('index', array('model' => $model));
	}
	
	
	public function actionGetItemUnits(){
		$unitProcess = new ItemUnitProcess();
		$data = $unitProcess->getItemUnits();
		echo CJSON::encode($data);
	}
	
	public function actionCreateItemUnit(){
		$unitProcess = new ItemUnitProcess();
		$flage = false;
		$model = new UnitForm();
		$model->unitCode = $_POST['unitGroupCode'];
		$model->unitDescr = $_POST['unitGroupDescr'];
		$model->createdBy = Yii::app()->session->get('guid');
		$items = CJSON::decode($_POST['items']);
		$model->groupId = $_POST['unitGroupId'];
		if($model->groupId != null){
			$model->modifedBy = Yii::app()->session->get('guid');
			$flage = $unitProcess->updateItemUnit($model, $items);
		}
		else{
			$model->createdBy = Yii::app()->session->get('guid');
			$flage = $unitProcess->createItemUnit($model, $items);
		}	
		echo CJSON::encode($flage);
	}
	
	public function actionGetItemUnitDetail(){
		$unitProcess = new ItemUnitProcess();
		$code = '';
		if(isset($_POST['code']))
			$code = $_POST['code'];
		$data = $unitProcess->getItemUnitDetail($code);
		echo CJSON::encode($data);
	}
	/**
	 * Updates a particular model.
	 * If update is successful, the browser will be redirected to the 'view' page.
	 * @param integer $id the ID of the model to be updated
	 */
	public function actionUpdate($id)
	{
		$model = $this->loadModel($id);					
		$this->performAjaxValidation($model);
		if(isset($_POST['Category']))
		{
			$model->attributes=$_POST['Category'];
			$model->modified_at = new CDbExpression('NOW()');
			if($model->save(false))
				echo CJSON::encode(array('success'=>true));			
		}
	}

	/**
	 * Deletes a particular model.
	 * If deletion is successful, the browser will be redirected to the 'admin' page.
	 * @param integer $id the ID of the model to be deleted
	 */
	public function actionDelete($id)
	{
		
		$model = $this->loadModel($id);	
		$model->active = 0;
		//$model->modified_at = new CDbExpression('NOW()');		
		if (!$model->save())
			echo CJSON::encode(array('success' => false, 'error'=> Yii::t('base', 'Registro não encontrado')));
		else		
			echo CJSON::encode(array('success' => true));
	}
	

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer $id the ID of the model to be loaded
	 * @return Product the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{		
		$model=Category::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');	
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param Product $model the model to be validated
	 */
	protected function performAjaxValidation($model)
	{								
		if(isset($_POST['ajax']) && $_POST['ajax']==='categoryForm')
		{		
			$errors = CActiveForm::validate($model);
			$validated =  $model->validate();
			if(!$validated){
    			//$errors = $model->getErrors();
				echo $errors;	
				Yii::app()->end();
			}
		}
	}
}


?>