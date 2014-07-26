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
		$sql= "select * from item_unit_groups where active = true";
		return DAO::exprotData($sql);
	}
	
	/**
	 * 
	 */
	public function createItemUnit($model, $item){
		$result = -1;
		$cnc = Yii::app()->db;	
		$tran = $cnc->beginTransaction();
		try{
			$unitGroup = new ItemUnitGroups;
			$unitGroup->setAttributes(array(
				'unit_code' => $model->unitCode,
				'descr' => $model->unitDescr,
				'created_by' => $model->createdBy
			));
			
			$unitGroup->save(false);
			if($unitGroup->id <0) $tran->rollBack();
			if($items != null){
				foreach($items as $row){
					$i += 1;
					$unitDetail = new ItemUnitDetails();
					$unitDetail->setAttributes(array(
						'code' => $model->unitDetailCode,
						'descr' => $model->unitDetailDescr,
						'unit_group_code' => $unitGroup->unit_code,
						'main_unit' => $i,
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
