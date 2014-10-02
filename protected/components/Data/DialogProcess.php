<?php

class DialogProcess extends CApplicationComponent{
	
	/**
	 * Category
	 * @return array()
	 */
	public static function getCategory(){
		$sql = "select * from categories where active = true";
    	return DAO::exprotData($sql);
	}
	
	/**
	 * Item Types
	 * @param int $categoryId
	 * @return array()
	 */
	public static function getItemType($categoryId){
		$sql = "select * from item_types where active = true and category_id = $categoryId";
		return DAO::exprotData($sql);
	}
}
?>