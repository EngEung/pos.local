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
	
	
	public function getQuestionAnswerAnswerTypes($order = 'asc'){
		$criteria = new CDbCriteria(); 
		//$criteria->select = 'id, name';
		$criteria->order = 'name ' . $order;
		return  QuestionAnswerAnswerTypes::model()->findAll($criteria);
	}
	
	public function getQuestionAnswerMultipleAnswers($order = 'asc'){
		$criteria = new CDbCriteria(); 
		//$criteria->select = 'id, name';
		//$criteria->order = 'name ' . $order;
		return  QuestionAnswerMultipleAnswers::model()->findAll($criteria);
	}
	/*
	 * Get All Questionnaire Questions
	 * return array
	 */
	public function getQuestionnaireQuestions($typeId){
		return QuestionnaireQuestions::model()->findAll(
				array('condition'=>'active=:active and questionnaire_type_id =:typeId',
				'params'=>array(':active'=> true, ':typeId' => $typeId)));
	}
	
	
	public function getQuestionMulitiple($questionId, $order = 'asc'){
		$criteria = new CDbCriteria(); 
		//$criteria->select = 'id, name';
		$criteria->condition = 'question_id =:questionId';
		$criteria->params = array(':questionId' => $questionId);
	//	$criteria->order = 'name ' . $order;
		return QuestionMultipleChoices::model()->findAll($criteria);
	}
	
	/**
	 * get sections
	 */
	public function getSections($order = 'asc'){
		$criteria = new CDbCriteria(); 
		//$criteria->select = 'id, name';
		$criteria->order = 'name ' . $order;
		return Sections::model()->findAll($criteria);
	}
	
	/**
	 * Get questionnaire types
	 */
	public function getQuestionnaireTypes($order = 'asc'){
		$criteria = new CDbCriteria(); 
		$criteria->select = 'id, name';
		$criteria->order = 'name ' . $order;
		return QuestionnaireTypes::model()->findAll($criteria);
	}
	
	public function getProgramByChannelId($channelId) {
		if($channelId == null || $channelId < 0)
			throw new CHttpException('Channel id is a required parameter');
		$cnc = Yii::app()->db;
		$cmd = new CDbCommand($cnc);
		$sql = "select distinct p.id, p.name "
 			 . "from programs p inner join program_channels pc " 
 			 . "on p.id = pc.program_id " 
 			 . "where pc.channel_id = :channel_id "
 			 . "order by p.name ";
		$cmd = $cnc->createCommand($sql);
		$cmd->bindParam(":channel_id", $channelId, PDO::PARAM_INT);
		return $cmd->queryAll();
	}
	
	public function getPrograms($order = 'asc'){
		$criteria = new CDbCriteria(); 
		$criteria->select = 'id, name';
		$criteria->order = 'name ' . $order;
		return Programs::model()->findAll($criteria);
	}
    
    public function getRespondentCode($order = 'asc'){
        $criteria = new CDbCriteria(); 
        $criteria->select = 'id, respondent_code';
        $criteria->order = 'respondent_code ' . $order;
	    return Respondents::model()->findAll($criteria);
    }
	
	public function getDays($order = 'asc'){
		$criteria = new CDbCriteria(); 
		$criteria->select = 'id, name';
		$criteria->order = 'name ' . $order;
		return Days::model()->findAll($criteria);
	}
	
	public function getTimeslots($order = 'asc'){
		$criteria = new CDbCriteria(); 
		$criteria->select = 'id, name';
		$criteria->order = 'name ' . $order;
		return Timeslots::model()->findAll($criteria);
	}
	
	public function getGenders($order = 'asc'){
		$criteria = new CDbCriteria(); 
		$criteria->select = 'id, name';
		$criteria->order = 'name ' . $order;
		return Genders::model()->findAll($criteria);
	}
	
	public function getIncomeRange($order = 'asc'){
		$criteria = new CDbCriteria(); 
		$criteria->select = 'id, name';
		$criteria->order = 'name ' . $order;
		return Incomes::model()->findAll($criteria);
	}
	
	public function getMeanofTransportation($order = 'asc'){
		$criteria = new CDbCriteria(); 
		$criteria->select = 'id, name';
		$criteria->order = 'name ' . $order;
		return MeanofTransportations::model()->findAll($criteria);
	}
	
	public function getOccupations($order = 'asc'){
		$criteria = new CDbCriteria(); 
		$criteria->select = 'id, name';
		$criteria->order = 'name ' . $order;
		return Occupations::model()->findAll($criteria);
	}
	
	public function getChannels($order = 'asc'){
		$criteria = new CDbCriteria(); 
		$criteria->select = 'id, name';
		$criteria->order = 'name ' . $order;
		return Channels::model()->findAll($criteria);
	}
	
	
	public function getWeeks(){
		$criteria = new CDbCriteria(); 
		$criteria->select = 'id, name';
		return Weeks::model()->findAll($criteria);
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
}
    