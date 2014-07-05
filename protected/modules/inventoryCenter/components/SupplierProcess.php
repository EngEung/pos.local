<?php
class SupplierProcess extends CApplicationComponent {
	
	
	public $_message;
	
	public function setMessage($value){
		if($value == null) return null;
		$this->_message = $value;
	}
	
	public function getMessage(){
		return $this->_message;
	}
	public function __construct() {
		
	}
	/**
	 * Get Supplier's info
	 * @param int $id
	 * @return objject $model 
	 */
	public function getSupplierByID($id){
		$sp = Suppliers::model()->findByAttributes(array('id' => $id));
		$model = new SupplierForm;
		if($sp != null){
			$model->id = $sp->id;
			$model->name = $sp->name;
			$model->address1 = $sp->address1;
			$model->address2 = $sp->address2;
			$model->cityId = $sp->city;
			$model->code = $sp->code;
			$model->contact= $sp->contact;
			$model->countryId = $sp->country_id;
			$model->email = $sp->email;
			$model->fax = $sp->fax;
			$model->phone = $sp->phone;
			$model->stateProvinceId = $sp->state_province_id;
			$model->website = $sp->website;
			$model->accountNum = $sp->account_number;
			$model->note = $sp->note;
			$model->postalCode = $sp->postal_code;
		}
		return $model;
	}
	
	/**
	 * Get Suppllier List
	 */
	public function getSupplierLists(){
		$sql = "SELECT s.* FROM suppliers s where s.active = true ";
		return DAO::exprotData($sql);
	}

	/**
	 * Create Supplier
	 * @param object $model, SupplierForm
	 * @return boolean
	 */
	public function createSupplier($model){
            if($model == null) return null;
            $s = new Suppliers();
            $s->name = $model->name;
            $s->address1 = $model->address1;
            $s->address2 = $model->address2;
            $s->city = $model->cityId;
            $s->code = $model->code;
            $s->contact = $model->contact;
            $s->country_id = $model->countryId;
            $s->email = $model->email;
            $s->fax = $model->fax;
            $s->phone = $model->phone;
            $s->postal_code = $model->postalCode;
            $s->state_province_id = $model->stateProvinceId;
            $s->website = $model->website;
            $s->account_number = $model->accountNum;
			$s->note = $model->note;
            return $s->save(false);
	}
	
	/**
	 * Update Supplier
	 * @param object $model, SupplierForm
	 * @return boolean
	 */
	public function updateSupplier($model) {
		if ($model == null) return false;
		$s = Suppliers::model()->findByAttributes(array('id'=>$model->id));
		if ($s == null) return false;
		$s->name = $model->name;
        $s->address1 = $model->address1;
        $s->address2 = $model->address2;
        $s->city = $model->cityId;
        $s->code = $model->code;
        $s->contact = $model->contact;
        $s->country_id = $model->countryId;
        $s->email = $model->email;
        $s->fax = $model->fax;
        $s->phone = $model->phone;
        $s->postal_code = $model->postalCode;
        $s->state_province_id = $model->stateProvinceId;
        $s->website = $model->website;
        $s->account_number = $model->accountNum;
		$s->note = $model->note;
		$s->modified_at = new CDbExpression('NOW()');
		return $s->save(false);
	}
	
	/**
	 * Remove Supplier
	 * @param int $id'
	 * @return boolean
	 */
	public function removeSupplier($id){
		if($id == null) return false;
		$s= Suppliers::model()->findByAttributes(array('id'=>$id));
		if($s == null) return false;
		$s->active = false;
		$s->modified_at = new CDbExpression('NOW()');
		return $s->save(false);
	}
}
