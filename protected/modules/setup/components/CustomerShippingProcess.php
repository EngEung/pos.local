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
		if($model->shippingTo == null || $model->shippingAddress == null) return false;
		$c = new CustomerShipping();
		$c->setAttributes(array(
                    'customer_id' => $model->custId,
                    'shipping_to' => $model->shippingTo,
                    'shipping_address' => $model->shippingAddress,
                    'note' => $model->note,
                    'created_by' => '',
		));
		return $c->save(false);
	}
	
	public function update($model) {
		if ($model == null) return false;
		$cs = CustomerShipping::model()->findByPk($model->id);
		if ($cs == null ) return false;
		if ($model->shippingTo != null) $cs->shipping_to = $model->shippingTo;
		if ($model->shipping_address != null) $cs->shipping_address = $model->shipping_address;
		$cs->address = $model->note;
                $cs->modified_at = "";
                $cs->modified_by ="";
		$cs->note = $model->note;
		return $c->save(false);
	}
	
	public function removeShipping($id){

	}
}