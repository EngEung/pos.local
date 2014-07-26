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
	
	
	public function createItemSize($model){
		try{
			$model = new SizeForm;
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
			
		}catch(CExecption $e){
			echo $e;
		}
	}
		
}

?>
