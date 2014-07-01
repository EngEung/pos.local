<?php
class SupplierProcess extends CApplicationComponent {
	
	public function __construct() {
		
	}
	public function getCustomerByID($id){
		$cus = Suppliers::model()->findByPK($id);
		$model = new CustomerForm;
		if($cus != null){
			$model->firstName = $cus->first_name;
			$model->lastName = $cus->last_name;
			$model->titleId = $cus->title;
			$model->locationId = $cus->location_id;
			$model->address = $cus->address;
			$model->phone1 = $cus->phone1;
			$model->phone2 = $cus->phone2;
			$model->fax = $cus->fax;
			$model->email1 = $cus->email1;
			$model->customerTypeId = $cus->customer_type;
			$model->note = $cus->note;
		}
		return $model;
	}
	
	public function getSupplierLists(){
		$sql = "SELECT s.* FROM suppliers s ";
		return DAO::exprotData($sql);
	}


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

            return $s->save(false);
	}
	
	public function updateSupplier($model) {
		if ($model == null) return null;
		$s = Suppliers::model()->findByPk($model->id);
		if ($s == null) return false;
		$s->name = $model->name;
                $s->address1 = $model->address1;
                $s->address2 = $model->address2;
                $s->city = $model->city;
                $s->code = $model->code;
                $s->contact = $model->contact;
                $s->country_id = $model->countryId;
                $s->email = $model->email;
                $s->fax = $model->fax;
                $s->phone = $model->phone;
                $s->postal_code = $model->postalCode;
                $s->state_province_id = $model->stateProvinceId;
                $s->website = $model->website;
		return $c->save(false);
	}
	
	
}
