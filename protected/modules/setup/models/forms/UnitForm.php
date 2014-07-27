<?php

/**
 * LoginForm class.
 * LoginForm is the data structure for keeping
 * user login form data. It is used by the 'login' action of 'SiteController'.
 */
class UnitForm extends CFormModel
{
	public $id;
	public $unitCode;
	public $unitDescr;
	public $unitDetailCode;
	public $unitDetailDescr;
	public $createdBy;
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
			array('unitCode, unitDetailCode, unitDetailDescr, unitDescr', 'required',),
		
		);
	}

	/**
	 * Declares attribute labels.
	 */
	public function attributeLabels(){
		return array(
			'unitCode' => 'Group Code',
			'unitDescr' => 'Descripition',
			'unitDetailCode' => 'Unit Code',
			'unitDetailDescr' => 'Descripition'
		);
	}

}
