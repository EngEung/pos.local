<?php

/**
 * The process that handles category information 
 * @author Eng Eung
 * Date : 7-24-2014
 */
 
class ItemSizeProcess extends CApplicationComponent{
	
	/**
	 * Get item size
	 */
	public function getItemSizes(){
		$sql= "select * from item_size_groups where active = true";
		return DAO::exprotData($sql);
	}
	
	/**
	 * Create Item Size
	 * @param object $model, SizeForm
	 * @return boolean
	 */
	public function createItemSize($model){
		$result = -1;
		$cnc = Yii::app()->db;	
		$tran = $cnc->beginTransaction();
		try{
			$sizeGroup = new ItemSizeGroups();
			$sizeGroup->setAttributes(array(
				'code' => $model->sizeCode,
				'descr' => $model->sizeDescr,
				'unit_group_code' => $model->unitGroupCode,
				'created_by' =>$model->createdBy
			));
			
			$sizeGroup->save(false);
			
			if($model->items != null){
				foreach($model->items as $row){
					$sizeDetail = new ItemSizeDetails();
					$sizeDetail->setAttributes(array(
						'code'=>$row[''],
						'qty_per_unit' => $row[''],
						'unit_code' => $row[''],
						'size_group_code' => $row[''],
						'created_by' => $row[''],
					));
					$sizeDetail->save(false);
				}
			}
			
			$result = 1;
			$tran->commit();
		}catch(CExecption $e){
			echo $e;
		}
		return $result;
	}
	
	/**
	 * Update Item size
	 * @param object $model, SizeForm
	 */
	public function updateItemSize($model){
		$result = -1;
		$cnc = Yii::app()->db;	
		$tran = $cnc->beginTransaction();
		try{
			$sizeGroup = ItemSizeGroups::model()->findByPK($model);
			$sizeGroup->setAttributes(array(
				'code' => $model->sizeCode,
				'descr' => $model->sizeDescr,
				'unit_group_code' => $model->unitGroupCode,
				'created_by' =>$model->createdBy
			));
			
			$sizeGroup->save(false);
			
			if($model->items != null){
				foreach($model->items as $row){
					$sizeDetail = ItemSizeDetails::model()->findByPk($row[]);
					$sizeDetail->setAttributes(array(
						'code'=>$row[''],
						'qty_per_unit' => $row[''],
						'unit_code' => $row[''],
						'size_group_code' => $row[''],
						'created_by' => $row[''],
					));
					$sizeDetail->save(false);
				}
			}
			
			$result = 1;
			$tran->commit();
		}catch(CExecption $e){
			echo $e;
		}
		return $result;
	}
	
	
	public function deleteItemSize($model){
		
	}
}

?>
