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
	
        public function getShippingbyID($id){
            return CustomerShipping::model()->findByPK($id);
        }
        
        
        public function getShpppingToExportJSON($id){
            $data = $this->getShippingbyID($id);
            $arr = array();
            if($data != null){
                $arr = array( 'CustomerShippingForm[id]' => $data->id,
                              'CustomerShippingForm[shippingTo]' => $data->shipping_to , 
                              'CustomerShippingForm[shippingAddress]' => $data->shipping_address,
                              'CustomerShippingForm[note]'=> $data->note);
            }
            return $arr;
        }
        
	public function getCustomerShippingLists($custId){
		$sql = "SELECT cs.*
	    		FROM customer_shipping cs 
	    		INNER JOIN customers c ON c.id = cs.customer_id
	    		WHERE c.active = true and cs.active = true and cs.customer_id = $custId";
		return DAO::exprotData($sql);
	}


	public function create($model){
		if($model->shippingTo == null || $model->shippingAddress == null) return false;
		$c = new CustomerShipping();
		$c->setAttributes(array(
                    'customer_id' => $model->custId,
                    'shipping_to' => $model->shippingTo,
                    'shipping_address' => $model->shippingAddress,
                    'note' => $model->note,
                    'created_by' => Utils::getUserName(),
		));
		return $c->save(false);
	}
	
	public function update($model) {
		if ($model == null) return false;
		$cs = CustomerShipping::model()->findByPk($model->id);
		if ($cs == null ) return false;
		if ($model->shippingTo != null) $cs->shipping_to = $model->shippingTo;
		if ($model->shippingAddress != null) $cs->shipping_address = $model->shippingAddress;
        $cs->modified_at = "";
        $cs->modified_by =Utils::getUserName();
		$cs->note = $model->note;
		return $cs->save(false);
	}
	
	public function removeShipping($id){
        if($id == null) return false;
		$cs = CustomerShipping::model()->findByPk($id);
		$cs->active =false;
		return $cs->save(false); 
	}
}