<?php

/**
 * LoginForm class.
 * LoginForm is the data structure for keeping
 * user login form data. It is used by the 'login' action of 'SiteController'.
 */
class SizeForm extends CFormModel
{
	public $id;
	public $sizeCode;
	public $sizeDescr;
	public $sizeDetailCode;
	public $sizeDetailDescr;
	public $unitGroupCode;
	public $unitGroupDescr;
	public $unit;
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
			array('sizeCode, sizeDetailDescr, sizeDescr', 'required',),
		
		);
	}

	/**
	 * Declares attribute labels.
	 */
	public function attributeLabels(){
		return array(
			'sizeCode' => 'Size Group Code',
			'sizeDescr' => 'Descripition',
			'sizeDetailCode' => 'Sample',
			'sizeDetailDescr' => 'Descripition',
			'unitGroupDetailDescr' => 'Description',
			'$unitGroupDetailCode' => 'Unit Group Code',
		);
	}
}
