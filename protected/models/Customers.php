<?php

/**
 * This is the model class for table "customers".
 *
 * The followings are the available columns in table 'customers':
 * @property integer $id
 * @property string $first_name
 * @property string $last_name
 * @property string $title
 * @property integer $customer_type
 * @property string $phone1
 * @property string $phone2
 * @property string $email1
 * @property integer $country_id
 * @property integer $province_id
 * @property integer $commune_id
 * @property integer $district_id
 * @property string $created_at
 * @property string $modified_at
 * @property string $created_by
 * @property string $modified_by
 * @property integer $active
 * @property integer $location_id
 * @property string $address
 * @property integer $picture_id
 * @property string $fax
 */
class Customers extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return Customers the static model class
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
		return 'customers';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('first_name, created_at', 'required'),
			array('customer_type, country_id, province_id, commune_id, district_id, active, location_id, picture_id', 'numerical', 'integerOnly'=>true),
			array('first_name, last_name', 'length', 'max'=>50),
			array('title', 'length', 'max'=>20),
			array('phone1, phone2, email1, created_by, modified_by', 'length', 'max'=>30),
			array('address', 'length', 'max'=>255),
			array('fax', 'length', 'max'=>10),
			array('modified_at', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, first_name, last_name, title, customer_type, phone1, phone2, email1, country_id, province_id, commune_id, district_id, created_at, modified_at, created_by, modified_by, active, location_id, address, picture_id, fax', 'safe', 'on'=>'search'),
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
			'first_name' => 'First Name',
			'last_name' => 'Last Name',
			'title' => 'Title',
			'customer_type' => 'Customer Type',
			'phone1' => 'Phone1',
			'phone2' => 'Phone2',
			'email1' => 'Email1',
			'country_id' => 'Country',
			'province_id' => 'Province',
			'commune_id' => 'Commune',
			'district_id' => 'District',
			'created_at' => 'Created At',
			'modified_at' => 'Modified At',
			'created_by' => 'Created By',
			'modified_by' => 'Modified By',
			'active' => 'Active',
			'location_id' => 'Location',
			'address' => 'Address',
			'picture_id' => 'Picture',
			'fax' => 'Fax',
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

		$criteria->compare('first_name',$this->first_name,true);

		$criteria->compare('last_name',$this->last_name,true);

		$criteria->compare('title',$this->title,true);

		$criteria->compare('customer_type',$this->customer_type);

		$criteria->compare('phone1',$this->phone1,true);

		$criteria->compare('phone2',$this->phone2,true);

		$criteria->compare('email1',$this->email1,true);

		$criteria->compare('country_id',$this->country_id);

		$criteria->compare('province_id',$this->province_id);

		$criteria->compare('commune_id',$this->commune_id);

		$criteria->compare('district_id',$this->district_id);

		$criteria->compare('created_at',$this->created_at,true);

		$criteria->compare('modified_at',$this->modified_at,true);

		$criteria->compare('created_by',$this->created_by,true);

		$criteria->compare('modified_by',$this->modified_by,true);

		$criteria->compare('active',$this->active);

		$criteria->compare('location_id',$this->location_id);

		$criteria->compare('address',$this->address,true);

		$criteria->compare('picture_id',$this->picture_id);

		$criteria->compare('fax',$this->fax,true);

		return new CActiveDataProvider('Customers', array(
			'criteria'=>$criteria,
		));
	}
}