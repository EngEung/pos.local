<?php

/**
 * The process that handles category information 
 * @author Eng Eung
 * Date : 7-24-2014
 */
 
class ItemCodeProcess extends CApplicationComponent{
	
	/**
	 * Get item size
	 */
	public function getItemCodes(){
		$sql= "select * from item_codes where active = true";
		return DAO::exprotData($sql);
	}
	
	/**
	 * Create Item Code
	 * @param object $model, SizeForm
	 * @return boolean
	 */
	public function createItemCode($model){
		$result = -1;
		try{
			$itemCode = new ItemCodes();
			$itemCode->setAttributes(array(
				'category_id' => $model->categoryId,
				'item_type_id' => $model->itemTypeId,
				'item_code' => $model->itemCode,
				'descr' => $model->sizeDescr,
				'barcode' => $model->barcode,
				'unit_group_code' => $model->unitGroupCode,
				'note' => $model->unitGroupCode,
				'created_by' =>$model->createdBy
			));
			$result = $itemCode->save(false);
			
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
	
	public function geItemUnitGroups($keyword){
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
