<?php

class DialogController extends Controller
{
	
	public function actionDialogCategory(){
		$keyword = $_POST['keyword'];
		echo CJSON::encode(DialogProcess::getCategory($keyword));
	}
	
	public function actionDialogItemType(){
		$categoryId = $_POST['category_id'];
		echo CJSON::encode(DialogProcess::getItemType($categoryId));
	}
	
	public function actionDialogUnitGroup(){
		$keyword = null;
		if(isset($_POST['keyword']))
			$keyword = $_POST['keyword'];
		echo CJSON::encode(DialogProcess::geItemUnitGroups($keyword));
	}
	
	
}