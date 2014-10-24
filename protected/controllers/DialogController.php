<?php

class DialogController extends Controller
{
	
	public function actionDialogCategory(){
		$keyword = $_POST['keyword'];
		echo CJSON::encode(DialogProcess::getCategory($keyword));
	}
	
	public function actionDialogItemType(){
		$keyword = $_POST['keyword'];
		$require = intval($_POST['require']);
		echo CJSON::encode(DialogProcess::getItemType($require, $keyword));
	}
	
	public function actionDialogUnitGroup(){
		$keyword = null;
		if(isset($_POST['keyword']))
			$keyword = $_POST['keyword'];
		echo CJSON::encode(DialogProcess::geItemUnitGroups($keyword));
	}
	
	
}