<?php

/**
 * LoginForm class.
 * LoginForm is the data structure for keeping
 * user login form data. It is used by the 'login' action of 'SiteController'.
 */
class SupplierForm extends CFormModel
{
	public $id;
    public $name;
    public $code;
    public $address1;
    public $address2;
	
	public $cityId;
	public $cities;
	
	public $stateProvinceId;
	public $stateProvinces;
	
	public $countryId;
	public $countries;
	
	public $contact;
	public $phone;
	public $fax;
	public $email;
	public $website;
	public $postalCode;
    public $accountNum;
	public $note;
	
	public function __construct(){
		
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
			array('name, code, phone, address1, accountNum', 'required',),
		
		);
	}

	/**
	 * Declares attribute labels.
	 */
	public function attributeLabels(){
		return array(
			'accountNum' => 'Account Number',
			'countryId' => 'Country',
			'cityId' => 'City',
			'stateProvinceId' => 'State/Province'
		);
	}

}
