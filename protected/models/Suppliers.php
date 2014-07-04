<?php

/**
 * This is the model class for table "suppliers".
 *
 * The followings are the available columns in table 'suppliers':
 * @property integer $id
 * @property string $name
 * @property string $code
 * @property string $contact
 * @property string $address1
 * @property string $address2
 * @property string $city
 * @property integer $state_province_id
 * @property integer $country_id
 * @property string $postal_code
 * @property string $account_number
 * @property string $phone
 * @property string $fax
 * @property string $email
 * @property string $website
 * @property integer $min_order_amount
 * @property string $created_at
 * @property string $modified_at
 * @property string $created_by
 * @property string $modified_by
 * @property integer $active
 * @property string $note
 */
class Suppliers extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return Suppliers the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'suppliers';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('code, address2, created_at', 'required'),
			array('state_province_id, country_id, min_order_amount, active', 'numerical', 'integerOnly'=>true),
			array('name, contact, city, modified_by', 'length', 'max'=>30),
			array('code', 'length', 'max'=>50),
			array('address1, address2', 'length', 'max'=>120),
			array('postal_code, account_number, phone, note', 'length', 'max'=>45),
			array('email, website', 'length', 'max'=>255),
			array('fax, modified_at', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, name, code, contact, address1, address2, city, state_province_id, country_id, postal_code, account_number, phone, fax, email, website, min_order_amount, created_at, modified_at, created_by, modified_by, active, note', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'Id',
			'name' => 'Name',
			'code' => 'Code',
			'contact' => 'Contact',
			'address1' => 'Address1',
			'address2' => 'Address2',
			'city' => 'City',
			'state_province_id' => 'State Province',
			'country_id' => 'Country',
			'postal_code' => 'Postal Code',
			'account_number' => 'Account Number',
			'phone' => 'Phone',
			'fax' => 'Fax',
			'email' => 'Email',
			'website' => 'Website',
			'min_order_amount' => 'Min Order Amount',
			'created_at' => 'Created At',
			'modified_at' => 'Modified At',
			'created_by' => 'Created By',
			'modified_by' => 'Modified By',
			'active' => 'Active',
			'note' => 'Note',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);

		$criteria->compare('name',$this->name,true);

		$criteria->compare('code',$this->code,true);

		$criteria->compare('contact',$this->contact,true);

		$criteria->compare('address1',$this->address1,true);

		$criteria->compare('address2',$this->address2,true);

		$criteria->compare('city',$this->city,true);

		$criteria->compare('state_province_id',$this->state_province_id);

		$criteria->compare('country_id',$this->country_id);

		$criteria->compare('postal_code',$this->postal_code,true);

		$criteria->compare('account_number',$this->account_number,true);

		$criteria->compare('phone',$this->phone,true);

		$criteria->compare('fax',$this->fax,true);

		$criteria->compare('email',$this->email,true);

		$criteria->compare('website',$this->website,true);

		$criteria->compare('min_order_amount',$this->min_order_amount);

		$criteria->compare('created_at',$this->created_at,true);

		$criteria->compare('modified_at',$this->modified_at,true);

		$criteria->compare('created_by',$this->created_by,true);

		$criteria->compare('modified_by',$this->modified_by,true);

		$criteria->compare('active',$this->active);

		$criteria->compare('note',$this->note,true);

		return new CActiveDataProvider('Suppliers', array(
			'criteria'=>$criteria,
		));
	}
}