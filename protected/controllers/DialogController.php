<?php

class DialogController extends Controller
{
	
	public function actionDialogCategory(){
		echo CJSON::encode(DialogProcess::getCategory());
	}
	
	public function actionDialogItemType(){
		$categoryId = $_GET['category_id'];
		echo CJSON::encode(DialogProcess::getItemType($categoryId));
	}
}