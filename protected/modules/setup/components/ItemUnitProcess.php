<?php

/**
 * The process that handles category information 
 * @author Eng Eung
 * Date : 7-24-2014
 */
 
class ItemUnitProcess extends CApplicationComponent{
	private $_errorLogProc;
	private $_message;
	
	public function setMessage($value){
		return $this->_message = $value;
	}
	public function getMessage(){
		return $this->_message;
	}
	
	public function __construct() {
		//$this->_errorLogProc = new ErrorLogProcess();	
	} 
	
	/**
	 * Get item unit
	 */
	public function getItemUnits(){
		$sql= "select i.id, i.code, i.descr, i.created_at, i.modified_at, u.username as 'created_by' 
				from item_unit_groups i
				left join users u on u.guid = i.created_by
				where i.active = true";
		return DAO::exprotData($sql);
	}
	
	/**
	 * Get Item Unit Detials
	 * @param string $code
	 */
	public function getItemUnitDetail($code){
		$sql = "select * from item_unit_details i where i.unit_group_code = '{$code}' and i.active = true;";
		return DAO::exprotData($sql);
	}
	
	/**
	 * Create Item Unit
	 * @param object $model, UnitForm,
	 * @param array $items
	 * @return boolean
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
					$model->unitDetailCode = $row['code'];
					$model->unitDetailDescr = $row['descr'];
					$model->unitCode = $unitGroup->code;
					$model->mainUnit = $i;
					$this->createItemUnitDetail($model);
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
	
	public function updateItemUnit($model, $items){
		$result = -1;
		$cnc = Yii::app()->db;	
		$tran = $cnc->beginTransaction();
		try{
			$unitGroup = ItemUnitGroups::model()->findByPK($model->groupId);
			$unitGroup->setAttributes(array(
				'code' => $model->unitCode,
				'descr' => $model->unitDescr,
				'modified_at' => new CDbExpression('NOW()'),
				'modified_by' => $model->modifiedBy
			));
			
			$unitGroup->save(false);
			if($unitGroup->id <0) $tran->rollBack();
			if($items != null){
				foreach($items as $row){
					$model->unitDetailCode = $row['code'];
					$model->unitDetailDescr = $row['descr'];
					$model->unitCode = $unitGroup->code;
					if(isset($row['deleted'])){
						$unitDetail = ItemUnitDetails::model()->findByPK($row['id']);
						
						if($row['deleted'] === "edit"){
							$unitDetail->setAttributes(array(
								'code' => $row['code'],
								'descr' => $row['descr'],
								'unit_group_code' => $unitGroup->code,
								'modified_at' => new CDbExpression('NOW()'),
								'modified_by' => $model->modifiedBy
							));
						}elseif($row['deleted'] == "deleted"){
							$unitDetail->setAttributes(array(
								'active' => false,
								'modified_at' => new CDbExpression('NOW()'),
								'modified_by' => $model->modifiedBy
							));
						}
						$unitDetail->save(false);
					}elseif(empty($row['id']) && empty($row['deleted'])){
						$this->createItemUnitDetail($model);
					}
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
	/**
	 * create item unit detail
	 * @param object $model
	 * 
	 */
	public function createItemUnitDetail($model){
		$unitDetail = new ItemUnitDetails();
		$unitDetail->setAttributes(array(
			'code' =>$model->unitDetailCode,
			'descr' => $model->unitDetailDescr,
			'unit_group_code' => $model->unitCode,
			'main_unit' => $model->mainUnit,
			'created_by' => $model->createdBy
		));
		 $unitDetail->save(false);
	}
}

?>
