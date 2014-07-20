<?php

/**
 * The process that handles category information 
 * @author Eng Eung
 * Date : 7-19-2014
 */
 
class CategoryProcess extends CApplicationComponent{
	
	/**
	 * Get categories
	 */
	public function getCategories(){
		$sql= "select * from categories where active = true";
		return DAO::exprotData($sql);
	}
}

?>
