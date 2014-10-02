<?php

/**
 * This is the model class for table "item_codes".
 *
 * The followings are the available columns in table 'item_codes':
 * @property integer $id
 * @property string $catgory_id
 * @property string $item_type_id
 * @property string $item_code
 * @property string $descr
 * @property string $barcode
 * @property string $unit_group_code
 * @property string $note
 * @property string $created_at
 * @property string $modified_at
 * @property string $created_by
 * @property string $modified_by
 * @property integer $active
 */
class ItemCodes extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return ItemCodes the static model class
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
		return 'item_codes';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('created_at', 'required'),
			array('active', 'numerical', 'integerOnly'=>true),
			array('catgory_id, item_type_id, item_code', 'length', 'max'=>64),
			array('descr', 'length', 'max'=>128),
			array('barcode', 'length', 'max'=>25),
			array('unit_group_code', 'length', 'max'=>16),
			array('note', 'length', 'max'=>255),
			array('created_by, modified_by', 'length', 'max'=>30),
			array('modified_at', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, catgory_id, item_type_id, item_code, descr, barcode, unit_group_code, note, created_at, modified_at, created_by, modified_by, active', 'safe', 'on'=>'search'),
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
			'catgory_id' => 'Catgory',
			'item_type_id' => 'Item Type',
			'item_code' => 'Item Code',
			'descr' => 'Descr',
			'barcode' => 'Barcode',
			'unit_group_code' => 'Unit Group Code',
			'note' => 'Note',
			'created_at' => 'Created At',
			'modified_at' => 'Modified At',
			'created_by' => 'Created By',
			'modified_by' => 'Modified By',
			'active' => 'Active',
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

		$criteria->compare('catgory_id',$this->catgory_id,true);

		$criteria->compare('item_type_id',$this->item_type_id,true);

		$criteria->compare('item_code',$this->item_code,true);

		$criteria->compare('descr',$this->descr,true);

		$criteria->compare('barcode',$this->barcode,true);

		$criteria->compare('unit_group_code',$this->unit_group_code,true);

		$criteria->compare('note',$this->note,true);

		$criteria->compare('created_at',$this->created_at,true);

		$criteria->compare('modified_at',$this->modified_at,true);

		$criteria->compare('created_by',$this->created_by,true);

		$criteria->compare('modified_by',$this->modified_by,true);

		$criteria->compare('active',$this->active);

		return new CActiveDataProvider('ItemCodes', array(
			'criteria'=>$criteria,
		));
	}
}