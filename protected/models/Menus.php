<?php

/**
 * This is the model class for table "menus".
 *
 * The followings are the available columns in table 'menus':
 * @property integer $id
 * @property integer $parent_id
 * @property string $name
 * @property string $descr
 * @property string $icon_url
 * @property string $url
 * @property string $icon_url_data
 * @property string $tooltip
 * @property integer $order_num
 * @property integer $menu_type_id
 * @property string $created_at
 * @property string $modified_at
 * @property string $created_by
 * @property string $modified_by
 * @property integer $active
 */
class Menus extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'menus';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('name, menu_type_id, created_at', 'required'),
			array('parent_id, order_num, menu_type_id, active', 'numerical', 'integerOnly'=>true),
			array('name, tooltip', 'length', 'max'=>50),
			array('descr, icon_url, url', 'length', 'max'=>255),
			array('created_by, modified_by', 'length', 'max'=>30),
			array('icon_url_data, modified_at', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, parent_id, name, descr, icon_url, url, icon_url_data, tooltip, order_num, menu_type_id, created_at, modified_at, created_by, modified_by, active', 'safe', 'on'=>'search'),
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
			'parent_id' => 'Parent',
			'name' => 'Name',
			'descr' => 'Descr',
			'icon_url' => 'Icon Url',
			'url' => 'Url',
			'icon_url_data' => 'Icon Url Data',
			'tooltip' => 'Tooltip',
			'order_num' => 'Order Num',
			'menu_type_id' => 'Menu Type',
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

		$criteria->compare('parent_id',$this->parent_id);

		$criteria->compare('name',$this->name,true);

		$criteria->compare('descr',$this->descr,true);

		$criteria->compare('icon_url',$this->icon_url,true);

		$criteria->compare('url',$this->url,true);

		$criteria->compare('icon_url_data',$this->icon_url_data,true);

		$criteria->compare('tooltip',$this->tooltip,true);

		$criteria->compare('order_num',$this->order_num);

		$criteria->compare('menu_type_id',$this->menu_type_id);

		$criteria->compare('created_at',$this->created_at,true);

		$criteria->compare('modified_at',$this->modified_at,true);

		$criteria->compare('created_by',$this->created_by,true);

		$criteria->compare('modified_by',$this->modified_by,true);

		$criteria->compare('active',$this->active);

		return new CActiveDataProvider('Menus', array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * @return Menus the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}