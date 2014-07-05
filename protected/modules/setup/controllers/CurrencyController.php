<?php
class CurrencyController extends Controller{
	
	public function actionIndex(){
		$this->authenticate();        
        $this->layout = 'layout_setup_master';
		$this->render('index');
	}

}


?>