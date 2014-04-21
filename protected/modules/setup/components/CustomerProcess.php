<?php
/**
 * This capture is used for capturing application exception 
 * and redirect the user a friendly error notification pages
 * Date: 2012-09-23
 * 
 */
class CustomerProcess extends CApplicationComponent {
	
	public function __construct() {
		
	}
	
	public function getCustomerLists($order = 'asc'){
		$dataReader = null;
    	$desc = "get customers";
    	try {
    		$cnc = Yii::app()->db;
    		$cmd = new CDbCommand($cnc);
    		$sql = "select mn.*, l.name as 'location_name', ct.name as 'customer_type_name' 
    		from customers c 
    		inner join customer_type ct on c.customer_type_id = ct.id
    		inner join locations l on l.id = c.location_id 
    		where c.active = true";
    		$cmd = $cnc->createCommand($sql);
    		//$cmd->bindParam(":name", $name, PDO::PARAM_STR);
    		$dataReader = $cmd->query();
			foreach($dataReader as $row){
				$arr[]= array('id'=> $row['id'], 'first_name'=>$row['first_name'], 'last_name'=>$row['last_name'],
				'title' => $row['title'], 'customer_type_id' => $row['customer_type_id'], 'phone1' => $row['phone1'],
				'phone2'=> $row['phone2'], 'email1' => $row['email1'], 'email2'=> $row['email2'], 'location_id' => $row['location_id'],
				'location_name' => $row['locaiton_name'], 'customer_type_name'=> $row['customer_type_name']);
			}
    	} catch(CException $ex) {
    		//$this->_error->insert($ex, $desc);
    	}
    	return $dataReader;
	}

	public function create($model){
		if($model == null) return null;
		$c = new Customers();
		$c->setAttributes(array(
			'first_name' => $model->firstName,
			'last_name' => $model->lastName,
			'title' => $model->titleId,
			'phone1' => $model->phone1,
			'phone2' => $model->phone2,
			'email1' => $model->email1,
			'country_id' => $model->countryId,
			'province_id' => $model->provinceId,
			'commune_id' => $model->communeId,
			'district_id' => $model->districtId,
			'customer_type' => $model->customerTypeId,
			'address'=> $model->address,
			'location_id' => $model->locationId,
			'note' => $model->note,
			'picture_id' => $model->pictureId
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
			if($model->picture != null){
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