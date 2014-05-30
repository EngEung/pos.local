<?php
/**
 * This capture is used for capturing application exception 
 * and redirect the user a friendly error notification pages
 * Date: 2012-09-23
 * 
 */
class CustomerShippingProcess extends CApplicationComponent {
	
	public function __construct() {
		
	}
	
	public function getCustomerShippingLists($custId){
		$sql = "SELECT cs.*
	    		FROM customer_shipping cs 
	    		INNER JOIN customers c ON c.id = cs.customer_id
	    		WHERE c.active = true and cs.active = true and cs.customer_id = $custId";
		return Utils::exprotData($sql);
	}


	public function create($model){
		if($model->firstName == null || $model->lastName == null) return null;
		$c = new CustomerShipping();
		$c->setAttributes(array(
                    'customer_id' => $model->customerId,
                    'shipping_to' => $model->shippingTo,
                    'shipping_address' => $model->shippingAddress,
                    'address'=> $model->address,
                    'note' => $model->note,
                    'created_by' => '',
		));
		$c->save(false);
	}
	
	/**
	 * Create Customer
	 * @param object $model,
	 * @return boolean
	 */
	public function createCustomer($model){
		$rc = false;
		$media = new MediaProcess();	
		$cnc = Yii::app()->db;	
		$tran = $cnc->beginTransaction();
		try{
			if($model->picture !== null){
				$model->pictureId = $media->processFileUpload($model->picture, AppConstant::FILE_TYPE_PICTURE_CUSTOMER, null, $model->descr);
			}
			$rc =  $this->create($model);
			$tran->commit();
		}catch(CException $ex) {
    		//$this->_error->insert($ex, $desc);
    		echo $ex;
			$tran->rollBack();
    	}
		return $rc;
	}
	
	public function update($model) {
		if ($model == null) return null;
		$c = Customers::model()->findByPk($model->id);
		if ($c == null ) return null;
		if ($model->firstName != null) $c->first_name = $model->first_name;
		if ($model->lastName != null) $c->last_name = $model->last_name;
		if ($model->titleId != null) $c->titleId = $model->titleId;
		if ($model->phone1 != null) $c->phone1 = $model->phone1;
		$c->phone2 = $model->phone2;
		$c->email1 = $model->email1;
		$c->fax = $model->fax;
		$c->country_id = $model->countryId;
		$c->province_id = $model->provinceId;
		$c->commune_id = $model->communeId;
		$c->district_id = $model->districtId;
		$c->customer_type = $model->customerTypeId;
		$c->address = $model->address;
		if($model->locationId != null)	$c->location_id = $model->location_id;
		$c->note = $model->note;
		return $c->save(false);
	}
	
	public function updateCustomer($model, $fileId){
		$rc = false;
		$media = new MediaProcess();	
		$cnc = Yii::app()->db;	
		$tran = $cnc->beginTransaction();
		try{
			$fileId = $media->processFileUpload($model->picture, AppConstant::FILE_TYPE_PICTURE_CUSTOMER, $fileId, $model->descr);
			$rc =  $this->update($model);
			$tran->commit();
		}catch(CException $ex) {
    		//$this->_error->insert($ex, $desc);
    		echo $ex;
			$tran->rollBack();
    	}
		return $rc;
	}
}