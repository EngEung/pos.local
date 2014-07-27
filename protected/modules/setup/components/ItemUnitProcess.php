<?php

/**
 * The process that handles category information 
 * @author Eng Eung
 * Date : 7-24-2014
 */
 
class ItemUnitProcess extends CApplicationComponent{
		private $_errorLogProc;
	
	public function __construct() {
		//$this->_errorLogProc = new ErrorLogProcess();	
	} 
	
	/**
	 * Get categories
	 */
	public function getItemUnits(){
		$sql= "select i.id, i.code, i.descr, i.created_at, i.modified_at, u.username as 'created_by' 
				from item_unit_groups i
				left join users u on u.guid = i.created_by
				where i.active = true";
		return DAO::exprotData($sql);
	}
	
	public function getItemUnitDetail($code){
		$sql = "select * from item_unit_details i where i.unit_group_code = '$code'";
		return DAO::exprotData($sql);
	}
	
	/**
	 * 
	 */
	public function createItemUnit($model, $items){
		$result = -1;
		$cnc = Yii::app()->db;	
		$tran = $cnc->beginTransaction();
		try{
			$unitGroup = new ItemUnitGroups;
			$unitGroup->setAttributes(array(
				'code' => $model->unitCode,
				'descr' => $model->unitDescr,
				'created_by' => $model->createdBy
			));
			
			$unitGroup->save(false);
			if($unitGroup->id <0) $tran->rollBack();
			if($items != null){
				$i = 0;
				foreach($items as $row){
					$i += 1;
					$unitDetail = new ItemUnitDetails();
					$unitDetail->setAttributes(array(
						'code' => $row['name'],
						'descr' => $row['descr'],
						'unit_group_code' => $unitGroup->code,
						'main_unit' => $i,
						'created_by' => $model->createdBy
					));
					$unitDetail->save(false);
					$i  = -1;
				}
			}
			
			$result =true;
			$tran->commit();
		}catch(CException $ex) {
			//$this->_errorLogProc->($ex, $comments);
			$result = -1;
			$tran->rollBack();
		}
		return $result;
	}
}

?>
