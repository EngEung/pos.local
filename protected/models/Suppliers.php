<?php

/**
 * This is the model class for table "suppliers".
 *
 * The followings are the available columns in table 'suppliers':
 * @property integer $id
 * @property string $name
 * @property string $code
 * @property string $address1
 * @property string $address2
 * @property string $city
 * @property integer $state_province_id
 * @property string $postal_code
 * @property integer $country_id
 * @property string $account_number
 * @property string $contact
 * @property string $phone
 * @property string $email
 * @property string $fax
 * @property string $website
 * @property string $created_at
 * @property string $modified_at
 * @property string $created_by
 * @property string $modified_by
 * @property integer $active
 */
class Suppliers extends CActiveRecord
{
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
			array('name, address1, address2, city, postal_code, account_number, contact, phone, email, fax, website, created_at', 'required'),
			array('state_province_id, country_id, active', 'numerical', 'integerOnly'=>true),
			array('name, code, contact, email, website', 'length', 'max'=>60),
			array('address1, address2, postal_code, account_number', 'length', 'max'=>255),
			array('city', 'length', 'max'=>50),
			array('phone, fax', 'length', 'max'=>15),
			array('created_by, modified_by', 'length', 'max'=>30),
			array('modified_at', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, name, code, address1, address2, city, state_province_id, postal_code, country_id, account_number, contact, phone, email, fax, website, created_at, modified_at, created_by, modified_by, active', 'safe', 'on'=>'search'),
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
			'address1' => 'Address1',
			'address2' => 'Address2',
			'city' => 'City',
			'state_province_id' => 'State Province',
			'postal_code' => 'Postal Code',
			'country_id' => 'Country',
			'account_number' => 'Account Number',
			'contact' => 'Contact',
			'phone' => 'Phone',
			'email' => 'Email',
			'fax' => 'Fax',
			'website' => 'Website',
			'created_at' => 'Created At',
			'modified_at' => 'Modified At',
			'created_by' => 'Created By',
			'modified_by' => 'Modified By',
			'active' => 'Active',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
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

		$criteria->compare('address1',$this->address1,true);

		$criteria->compare('address2',$this->address2,true);

		$criteria->compare('city',$this->city,true);

		$criteria->compare('state_province_id',$this->state_province_id);

		$criteria->compare('postal_code',$this->postal_code,true);

		$criteria->compare('country_id',$this->country_id);

		$criteria->compare('account_number',$this->account_number,true);

		$criteria->compare('contact',$this->contact,true);

		$criteria->compare('phone',$this->phone,true);

		$criteria->compare('email',$this->email,true);

		$criteria->compare('fax',$this->fax,true);

		$criteria->compare('website',$this->website,true);

		$criteria->compare('created_at',$this->created_at,true);

		$criteria->compare('modified_at',$this->modified_at,true);

		$criteria->compare('created_by',$this->created_by,true);

		$criteria->compare('modified_by',$this->modified_by,true);

		$criteria->compare('active',$this->active);

		return new CActiveDataProvider('Suppliers', array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * @return Suppliers the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}