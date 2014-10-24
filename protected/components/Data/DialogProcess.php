<?php

class DialogProcess extends CApplicationComponent{
	
	/**
	 * Category
	 * @return array()
	 */
	public static function getCategory($keyword){
		$sql = "select * from categories where active = true and name like '%{$keyword}%'";
    	return DAO::exprotData($sql);
	}
	
	/**
	 * Item Types
	 * @param int $categoryId
	 * @return array()
	 */
	public static function getItemType($require, $keyword){
		$sql = "select * from item_types where active = true and (category_id = $require or 0= $require) and name like '%{$keyword}%'";
		return DAO::exprotData($sql);
	}
	
	/**
	 * Item Unit group
	 * @param string $keyword
	 * @return array()
	 */
	public static function geItemUnitGroups($keyword){
		$sql ="select g.id as unit_group_id, d.unit_group_code,g.descr,
			   group_concat(d.code separator ' > ') as 'group_detail'
			   from item_unit_groups g
			   inner join  item_unit_details d on g.code = d.unit_group_code
			   where d.unit_group_code like '%{$keyword}%'
			   GROUP BY d.unit_group_code";
		return DAO::exprotData($sql);
	
	}
}
?>