<?php

/**
 * The process that handles category information 
 * @author Eng Eung
 * Date : 7-24-2014
 */
 
class ItemUnitProcess extends CApplicationComponent{
	
	/**
	 * Get categories
	 */
	public function getItemUnits(){
		$sql= "select * from item_unit_groups where active = true";
		return DAO::exprotData($sql);
	}
}

?>
