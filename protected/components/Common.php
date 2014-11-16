<?php

/**
 * Common component for this project
 * Common data for widgets should use this component
 * @author Sith Kong
 * @copyright Kaizen Solution LLC
 * Date: 2013-06-28 
 */
 
class Common extends CApplicationComponent {
    
	private $_error;
	
	public function __construct() {
		$this->_error =  new ErrorLog();
	}
	
    public function getProvinces($orderBy = 'asc'){
        return Locations::model()->findAll(array('condition' => 'type = 2'));
    }
	
	public function getCategories($order = 'asc'){
		$criteria = new CDbCriteria(); 
		//$criteria->select = 'id, name';
		$criteria->order = 'name ' . $order;
		return  Category::model()->findAll($criteria);
	}
	
	
	public function getGenders($order = 'asc'){
		$criteria = new CDbCriteria(); 
		$criteria->select = 'id, name';
		$criteria->order = 'name ' . $order;
		return Genders::model()->findAll($criteria);
	}
	
	public function getAges($order = 'asc'){
		$criteria = new CDbCriteria(); 
		$criteria->select = 'id, name';
		$criteria->order = 'name ' . $order;
		return Ages::model()->findAll($criteria);
	}
	
	public function getLocations($locationTypeId = null, $order = 'asc'){
		$criteria = new CDbCriteria(); 
		$criteria->select = 'id, name';
		if($locationTypeId != null) {
			$criteria->condition = 'location_type_id = :locatoinTypeId';
			$criteria->params = array(':locationTypeId' => $locationTypeId);
		}
		$criteria->order = 'name ' . $order;
		return Locations::model()->findAll($criteria);
	}



	/**
	 * Gets file upload types 
	 * @param string $order - sorting order default asc 
	 * @return array of object - file upload types or null
	 */
	public function getFileUploadTypes($order = 'asc') {
		$criteria = new CDbCriteria(); 
		$criteria->select = 'id, name';
		$criteria->order = 'name ' . $order;
		return FileUploadTypes::model()->findAll($criteria);
	}
	
	public function getQuestionTypes($order = 'asc') {
		$criteria = new CDbCriteria(); 
		$criteria->select = 'id, name';
		$criteria->order = 'name ' . $order;
		return QuestionTypes::model()->findAll($criteria);
	}
	
	#getProgram Type By Id 
	public function getProgramTypeById($programTypeId, $order = 'asc') {
		if($programTypeId == 0 || $programTypeId == null ) return null;
		$criteria = new CDbCriteria(); 
		$criteria->select = 'id, descr';
		$criteria->condition = 'id = :id';
		$criteria->params = array(':id' => $programTypeId);
		$criteria->order = 'descr ' . $order;
		return ProgramTypes::model()->findAll($criteria);
	}
	
	public function getProgramTypes($order = 'asc') {
		$criteria = new CDbCriteria(); 
		$criteria->select = 'id, name';
		$criteria->order = 'name ' . $order;
		return ProgramTypes::model()->findAll($criteria);
	}
	
	/**
	 * Gets loan types 
	 * @param string $order - optional - the sorting order  
	 */
	public function getLoanTypes($order = 'asc') {
		$criteria = new CDbCriteria(); 
		$criteria->select = 'id, name';
		$criteria->order = 'name ' . $order;
		return LoanTypes::model()->findAll($criteria);
	}

	/**
	 * Get Time for 24 hours
	 */
	public function getTimes()
	{
		$times = array();
		for ($i = 0; $i < 24; $i++) {
    		$num = $i > 23 ? $i - 24 : $i;
    		$num = $num < 10 ? "0$num" : $num;
    		$ampm = $num > 11 && $num < 24 ? 'PM' : 'AM';
			$times[]=$num .":00 ". $ampm;
		    if ($num != 55)
        	$times[]=$num .":30 ". $ampm;	
		}
		return $times;	
	}
	
	/**
	 * Get Rental Vehicle Types
	 */
	public function getRentalVehicleTypes()
	{
		return CHtml::listData(RentalVehicleType::model()->findAll(),"id","name");
		
	}
	/**
	 * Get expiration years
	 * @return expiration year array
	 */
	public function getExpirationYears() {
		$years = array();
		$currentYear = date("Y");
		for($y = $currentYear + 9; $y >= $currentYear; $y--) {
			$years[$y] = $y;
		}	
		return $years;
	}
	
	/**
	 * Gets expiration months 
	 * @return expiration month array
	 */
	public function getExpirationMonths() {
		$months = array();
		for($x = 1; $x <= 12; $x++) {
			$months[$x] = ($x < 10) ? "0$x" : $x;
		}
		return $months;
	}
	
	/**
	 * Gets states or provinces by country name constant
	 * @param string $countryName - the country name constant 
	 * @return array of objects - states or provinces or null
	 */
    public function getStateOrProvinceByCountry($countryName) {
    	$countryId = $this->getCountryId($countryName);
		if($countryId == 0) return null;
		return $this->getStateOrProvinces($countryId);
    }
	
	/**
	 * Gets country id by country name
	 * @param string $countryName - the country name
	 * @return integer - the country id or null
	 */
	public function getCountryId($countryName) {
		if(empty($countryName)) return null;
		$country = Countries::model()->findByAttributes(array('name' => $countryName));
		return $country ? $country->id : null;
	}
	
	/**
	 * Get states or provinces by country id 
	 * @param integer $countryid - the country id
	 * @param string $order - the sorting order
	 * @return array of objects - the states or province objects or null
	 */
	public function getStateOrProvinces($countryId, $order = 'asc') {
		if($countryId == 0) return null;
		$criteria = new CDbCriteria(); 
		$criteria->select = 'id, descr';
		$criteria->condition = 'country_id = :country_id';
		$criteria->params = array(':country_id' => $countryId);
		$criteria->order = 'descr ' . $order;
		return States::model()->findAll($criteria);
	}
	
	/**
	 * Get countries 
	 * @param string $order - the sorting order 
	 * @return array of objects - countries or null
	 */
	public function getCountries($order = 'asc') {
		$criteria = new CDbCriteria(); 
		$criteria->select = 'id, descr';
		$criteria->order = 'descr ' . $order;
		return Countries::model()->findAll($criteria);
	}
	
	/**
	 * Gets credit card types 
	 * @param string $order optional - the sorting order
	 * @return array of objects - the credit card type objects
	 */
	public function getCreditCardTypes($order = 'asc') {
		$criteria = new CDbCriteria(); 
		$criteria->select = 'id, name';
		$criteria->order = 'name ' . $order;
		return CreditCardTypes::model()->findAll($criteria);
	}
	
	/**
	 * Get payment methods 
	 * @param string $order optional - the sorting order
	 * @return array of objects - the payment methods objects
	 */
	public function getPaymentMethods($order = 'asc') {
		$criteria = new CDbCriteria(); 
		$criteria->select = 'id, name';
		$criteria->order = 'name ' . $order;
		return PaymentMethods::model()->findAll($criteria);

	}

	public function actionGetValueById($className,$id) {
		
		$rows=$className::model()->findByPk($id);
		return $rows->name;	
	}
	
	public function getLocationType() {
		$criteria=new CDbCriteria();
		$criteria->select="id,name";
		return CHtml::listData(LocationTypes::model()->findAll(),"id","name");
	} 
	
	
	public function getTitles($order = 'asc'){
		$criteria = new CDbCriteria(); 
		$criteria->select = 'id, name';
		$criteria->order = 'name ' . $order;
		return Titles::model()->findAll($criteria);
	}
	
	public function getCustomerTypes($order = 'asc'){
		$criteria = new CDbCriteria(); 
		$criteria->select = 'id, name';
		$criteria->order = 'name ' . $order;
		return CustomerTypes::model()->findAll($criteria);
	}
}
    