<?php
class ItemTypeController extends Controller{
	
	public function actionIndex(){
		$this->authenticate();        
        $this->layout = 'setup_layout';
		$this->render('index');
	}

}


?>