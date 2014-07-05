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

	public $customerTypeId;
	public $customerTypes;
	public $phone1;
	public $phone2;
	public $email1;
	public $email2;
	public $address;
	
	public $titles;
	public $titleId;
	
	public $countries;
	public $countryId;
	
	public $provinces;
	public $provinceId;

	public $communeId;
	public $communes;
	
	public $districtId;
	public $districts;
	
	public $locations;
	public $locationId;
	public $note;
	public $fax;
	public $picture;
	public $pictureId;
	public $descr;
	
	public function __construct(){
		$common = new Common();
		$this->locations = CHtml::listData($common->getLocations(),'id', 'name');
		$this->titles = CHtml::listData($common->getTitles(), 'id', 'name');
		$this->customerTypes = CHtml::listData($common->getCustomerTypes(), 'id', 'name');
		$this->customerTypeId = 1;
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
			array('firstName, lastName, locationId, phone1, address', 'required',),
		
		);
	}

	/**
	 * Declares attribute labels.
	 */
	public function attributeLabels(){
		return array(
			'locationId' => 'Location',
			'titleId' => 'Title',
			'customerTypeId' => '',
			'descr' => '',
			'note' => ''
		);
	}

}
