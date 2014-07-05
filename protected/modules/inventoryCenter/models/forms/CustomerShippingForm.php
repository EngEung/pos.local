<?php

/**
 * LoginForm class.
 * LoginForm is the data structure for keeping
 * user login form data. It is used by the 'login' action of 'SiteController'.
 */
class CustomerShippingForm extends CFormModel
{
	public $id;
    public $custId;
    public $shippingTo;
    public $shippingAddress;
    public $note;
	public $phone;
	public $primary;
	
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
			array('shippingTo, shippingAddress', 'required',),
		
		);
	}

	/**
	 * Declares attribute labels.
	 */
	public function attributeLabels(){
	}

}
