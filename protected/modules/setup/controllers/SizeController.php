<?php
class SizeController extends Controller{
	
	public function actionIndex(){
		$this->authenticate();        
        $this->layout = 'setup_layout';
		$model = new SizeForm();
		$this->render('index', array('model' => $model));
	}
	
	
	public function actionGetSizeLists(){
		$cateProcess = new ItemSizeProcess();
		$data = $cateProcess->getItemSizes();
		echo CJSON::encode($data);
	}

	/**
	 * Displays a particular model.
	 * @param integer $id the ID o'model'=>$model,f the model to be displayed
	 */
	public function actionGetUnitGroupLists(){
		$size = new ItemSizeProcess();
		$keyword = null;
		if(isset($_POST['keyword']))
			$keyword = $_POST['keyword']; 
		echo CJSON::encode($size->geItemUnitGroups($keyword));
	}
	
	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreateItemSize(){
		$sizeProcess = new ItemSizeProcess();
		$flage = false;
		$model = new SizeForm;
		if(isset($_POST['SizeForm'])){
			$model->attributes = $_POST['SizeForm'];
			if($model->validate()){
				$model->unitGroupCode = $_POST['SizeForm']['unitGroupCode'];
				$model->sizeCode = $_POST['SizeForm']['sizeCode'];
				$model->sizeDescr = $_POST['SizeForm']['sizeDescr'];
				$flage = $sizeProcess->createItemSize($model);
			}
		}
		echo CJSON::encode($flage);
	}
	
	
	
}


?>