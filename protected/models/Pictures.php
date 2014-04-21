<?php

/**
 * This is the model class for table "pictures".
 *
 * The followings are the available columns in table 'pictures':
 * @property integer $id
 * @property string $name
 * @property string $descr
 * @property string $data
 * @property string $url
 * @property integer $size
 * @property integer $width
 * @property integer $height
 * @property double $ratio
 * @property string $ext
 * @property string $mime_type
 * @property integer $picture_type_id
 * @property string $created_at
 * @property string $modified_at
 * @property string $created_by
 * @property string $modified_by
 * @property integer $active
 */
class Pictures extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return Pictures the static model class
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
		return 'pictures';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('picture_type_id, created_at', 'required'),
			array('size, width, height, picture_type_id, active', 'numerical', 'integerOnly'=>true),
			array('ratio', 'numerical'),
			array('name', 'length', 'max'=>50),
			array('descr, url', 'length', 'max'=>255),
			array('ext', 'length', 'max'=>10),
			array('mime_type', 'length', 'max'=>20),
			array('created_by, modified_by', 'length', 'max'=>30),
			array('data, modified_at', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, name, descr, data, url, size, width, height, ratio, ext, mime_type, picture_type_id, created_at, modified_at, created_by, modified_by, active', 'safe', 'on'=>'search'),
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
			'descr' => 'Descr',
			'data' => 'Data',
			'url' => 'Url',
			'size' => 'Size',
			'width' => 'Width',
			'height' => 'Height',
			'ratio' => 'Ratio',
			'ext' => 'Ext',
			'mime_type' => 'Mime Type',
			'picture_type_id' => 'Picture Type',
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

		$criteria->compare('name',$this->name,true);

		$criteria->compare('descr',$this->descr,true);

		$criteria->compare('data',$this->data,true);

		$criteria->compare('url',$this->url,true);

		$criteria->compare('size',$this->size);

		$criteria->compare('width',$this->width);

		$criteria->compare('height',$this->height);

		$criteria->compare('ratio',$this->ratio);

		$criteria->compare('ext',$this->ext,true);

		$criteria->compare('mime_type',$this->mime_type,true);

		$criteria->compare('picture_type_id',$this->picture_type_id);

		$criteria->compare('created_at',$this->created_at,true);

		$criteria->compare('modified_at',$this->modified_at,true);

		$criteria->compare('created_by',$this->created_by,true);

		$criteria->compare('modified_by',$this->modified_by,true);

		$criteria->compare('active',$this->active);

		return new CActiveDataProvider('Pictures', array(
			'criteria'=>$criteria,
		));
	}
}