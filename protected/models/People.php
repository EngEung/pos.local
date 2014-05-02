<?php

/**
 * This is the model class for table "people".
 *
 * The followings are the available columns in table 'people':
 * @property integer $id
 * @property string $prefix
 * @property string $first_name
 * @property string $middle_name
 * @property string $last_name
 * @property string $nick_name
 * @property string $title
 * @property string $pref_name
 * @property string $gender
 * @property string $position
 * @property integer $age
 * @property string $date_of_birth
 * @property string $descr
 * @property string $created_at
 * @property string $modified_at
 * @property string $created_by
 * @property string $modified_by
 * @property integer $active
 */
class People extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return People the static model class
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
		return 'people';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('first_name, last_name, created_at', 'required'),
			array('age, active', 'numerical', 'integerOnly'=>true),
			array('prefix, nick_name, pref_name, position, created_by, modified_by', 'length', 'max'=>30),
			array('first_name, middle_name, last_name', 'length', 'max'=>50),
			array('title', 'length', 'max'=>20),
			array('gender', 'length', 'max'=>1),
			array('descr', 'length', 'max'=>255),
			array('date_of_birth, modified_at', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, prefix, first_name, middle_name, last_name, nick_name, title, pref_name, gender, position, age, date_of_birth, descr, created_at, modified_at, created_by, modified_by, active', 'safe', 'on'=>'search'),
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
			'prefix' => 'Prefix',
			'first_name' => 'First Name',
			'middle_name' => 'Middle Name',
			'last_name' => 'Last Name',
			'nick_name' => 'Nick Name',
			'title' => 'Title',
			'pref_name' => 'Pref Name',
			'gender' => 'Gender',
			'position' => 'Position',
			'age' => 'Age',
			'date_of_birth' => 'Date Of Birth',
			'descr' => 'Descr',
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

		$criteria->compare('prefix',$this->prefix,true);

		$criteria->compare('first_name',$this->first_name,true);

		$criteria->compare('middle_name',$this->middle_name,true);

		$criteria->compare('last_name',$this->last_name,true);

		$criteria->compare('nick_name',$this->nick_name,true);

		$criteria->compare('title',$this->title,true);

		$criteria->compare('pref_name',$this->pref_name,true);

		$criteria->compare('gender',$this->gender,true);

		$criteria->compare('position',$this->position,true);

		$criteria->compare('age',$this->age);

		$criteria->compare('date_of_birth',$this->date_of_birth,true);

		$criteria->compare('descr',$this->descr,true);

		$criteria->compare('created_at',$this->created_at,true);

		$criteria->compare('modified_at',$this->modified_at,true);

		$criteria->compare('created_by',$this->created_by,true);

		$criteria->compare('modified_by',$this->modified_by,true);

		$criteria->compare('active',$this->active);

		return new CActiveDataProvider('People', array(
			'criteria'=>$criteria,
		));
	}
}