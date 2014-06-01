<?php

/**
 * This is the model class for table "customer_shipping".
 *
 * The followings are the available columns in table 'customer_shipping':
 * @property integer $id
 * @property integer $customer_id
 * @property string $shipping_to
 * @property string $shipping_address
 * @property string $created_at
 * @property string $modified_at
 * @property string $created_by
 * @property string $modified_by
 * @property integer $active
 * @property string $note
 */
class CustomerShipping extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'customer_shipping';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('customer_id, shipping_to, shipping_address, created_at', 'required'),
			array('customer_id, active', 'numerical', 'integerOnly'=>true),
			array('shipping_to', 'length', 'max'=>65),
			array('shipping_address, note', 'length', 'max'=>255),
			array('created_by, modified_by', 'length', 'max'=>30),
			array('modified_at', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, customer_id, shipping_to, shipping_address, created_at, modified_at, created_by, modified_by, active, note', 'safe', 'on'=>'search'),
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
			'customer' => array(self::BELONGS_TO, 'Customers', 'customer_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'Id',
			'customer_id' => 'Customer',
			'shipping_to' => 'Shipping To',
			'shipping_address' => 'Shipping Address',
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

		$criteria->compare('customer_id',$this->customer_id);

		$criteria->compare('shipping_to',$this->shipping_to,true);

		$criteria->compare('shipping_address',$this->shipping_address,true);

		$criteria->compare('created_at',$this->created_at,true);

		$criteria->compare('modified_at',$this->modified_at,true);

		$criteria->compare('created_by',$this->created_by,true);

		$criteria->compare('modified_by',$this->modified_by,true);

		$criteria->compare('active',$this->active);

		$criteria->compare('note',$this->note,true);

		return new CActiveDataProvider('CustomerShipping', array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * @return CustomerShipping the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}