<?php

/**
 * LoginForm class.
 * LoginForm is the data structure for keeping
 * user login form data. It is used by the 'login' action of 'SiteController'.
 */
class ItemCodeForm extends CFormModel
{
	public $id;
	public $itemTypeId;
	public $itemType;
	
	public $category;
	public $categoryId;
	
	public $sizeGroupId;
	public $sizeGroups;
	
	public $unitGroupId;
	public $unitGroups;
	
	public $description;
	public $barcode;
	public $itemCode;
	public $note;
	public $test;
	public $testId;
	
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
			array('unitGroupId, itemCode, description, category, itemTypeId, sizeGroupId', 'required',),
		
		);
	}

	/**
	 * Declares attribute labels.
	 */
	public function attributeLabels(){
		return array(
			'sizeGroupId' => 'Size Group',
			'itemTypeId' => 'Item Type',
			'unitGroupId' => 'Unit Group'
			
		);
	}
}
