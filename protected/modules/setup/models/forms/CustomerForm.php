<?php

/**
 * LoginForm class.
 * LoginForm is the data structure for keeping
 * user login form data. It is used by the 'login' action of 'SiteController'.
 */
class CustomerForm extends CFormModel
{
	public $id;
	public $firstName;
	public $lastName;
	public $titles;
	public $titleId;
	public $customerTypeId;
	public $customerTypes;
	public $phone1;
	public $phone2;
	public $email1;
	public $email2;
	public $address;
	
	public $countries;
	public $countryId;
	
	public $provinces;
	public $provoinceId;

	public $communeId;
	public $communes;
	
	public $districtId;
	public $districts;
	
	public $locations;
	public $locationId;
	public  $descr;
	
	public function __construction(){
		$common = new Common();
		$this->locations = CHtml::listData($common->getLocations(),'id', 'name');
	}
	
	/**
	 * Declares the validation rules.
	 * The rules state that username and password are required,
	 * and password needs to be authenticated.
	 */
	public function rules()
	{
		return array(
			// username and password are required
			array('firstName, middleName', 'required', 'message'=>''),
			// rememberMe needs to be a boolean
			array('rememberMe', 'boolean'),
		);
	}

	/**
	 * Declares attribute labels.
	 */
	public function attributeLabels(){
		return array(
			'locationId' => 'Location',
			'titleId' => 'Title'
		);
	}

}
