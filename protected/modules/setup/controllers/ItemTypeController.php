<?php
class ItemTypeController extends Controller{
	
	public function actionIndex(){
		$this->authenticate();        
        $this->layout = 'setup_layout';
		$model = new ItemTypes;
		$common = new Common();
		$model->category_id = CHtml::listData($common->getCategories(), 'id', 'name');
		$this->render('index', array('model' => $model));
	}

	public function actionGetItemTypes(){
		$sql ="select t.id, t.name, t.category_id, c.name as category_name, t.code, t.descr, t.created_at from item_types t
		inner join categories c on c.id = t.category_id where t.active = true";
		$data = DAO::exprotData($sql);
		echo CJSON::encode($data);
	}

	/**
	 * Displays a particular model.
	 * @param integer $id the ID o'model'=>$model,f the model to be displayed
	 */
	public function actionView($id)
	{
		echo DAO::exportModel($this->loadModel($id));
	}

	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate()
	{						
		$model = new ItemTypes();
		if(isset($_POST['ItemTypes'])){
			$model->attributes = $_POST['ItemTypes'];
			//$model->category_id = $_POST['ItemTypes']['category_id'];
			$this->performAjaxValidation($model);
					
			if($model->save())
				echo CJSON::encode(array('success'=>true));
			else 
				echo CJSON::encode(array('success'=>false));
		}	
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
		$model = ItemTypes::model()->findByPk($id);
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
		if(isset($_POST['ajax']) && $_POST['ajax']==='ItemTypeForm')
		{		
			$errors = CActiveForm::validate($model);
			if (is_array($errors) && !empty($errors))
			{	echo $errors;	
				Yii::app()->end();
			}
		}
	}

}


?>