<?php

/**
 * This is the model class for table "users".
 *
 * The followings are the available columns in table 'users':
 * @property integer $id
 * @property string $email
 * @property string $username
 * @property string $passwd
 * @property string $salted_passwd
 * @property integer $locked
 * @property string $locked_at
 * @property integer $validated
 * @property integer $failed_attempt
 * @property string $failed_attempt_at
 * @property integer $person_id
 * @property string $validation_code
 * @property string $request_reset_at
 * @property integer $expired
 * @property string $expired_at
 * @property integer $reset_count
 * @property string $reset_at
 * @property string $last_login_at
 * @property string $recovery_code
 * @property string $created_at
 * @property string $modified_at
 * @property string $created_by
 * @property string $modified_by
 * @property integer $active
 * @property string $descr
 * @property string $guid
 */
class Users extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @return Users the static model class
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
		return 'users';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('email, passwd, person_id, validation_code, created_at, guid', 'required'),
			array('locked, validated, failed_attempt, person_id, expired, reset_count, active', 'numerical', 'integerOnly'=>true),
			array('email, created_by, modified_by', 'length', 'max'=>30),
			array('username, passwd, salted_passwd, validation_code, recovery_code, descr, guid', 'length', 'max'=>255),
			array('locked_at, failed_attempt_at, request_reset_at, expired_at, reset_at, last_login_at, modified_at', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, email, username, passwd, salted_passwd, locked, locked_at, validated, failed_attempt, failed_attempt_at, person_id, validation_code, request_reset_at, expired, expired_at, reset_count, reset_at, last_login_at, recovery_code, created_at, modified_at, created_by, modified_by, active, descr, guid', 'safe', 'on'=>'search'),
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
			'email' => 'Email',
			'username' => 'Username',
			'passwd' => 'Passwd',
			'salted_passwd' => 'Salted Passwd',
			'locked' => 'Locked',
			'locked_at' => 'Locked At',
			'validated' => 'Validated',
			'failed_attempt' => 'Failed Attempt',
			'failed_attempt_at' => 'Failed Attempt At',
			'person_id' => 'Person',
			'validation_code' => 'Validation Code',
			'request_reset_at' => 'Request Reset At',
			'expired' => 'Expired',
			'expired_at' => 'Expired At',
			'reset_count' => 'Reset Count',
			'reset_at' => 'Reset At',
			'last_login_at' => 'Last Login At',
			'recovery_code' => 'Recovery Code',
			'created_at' => 'Created At',
			'modified_at' => 'Modified At',
			'created_by' => 'Created By',
			'modified_by' => 'Modified By',
			'active' => 'Active',
			'descr' => 'Descr',
			'guid' => 'Guid',
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

		$criteria->compare('email',$this->email,true);

		$criteria->compare('username',$this->username,true);

		$criteria->compare('passwd',$this->passwd,true);

		$criteria->compare('salted_passwd',$this->salted_passwd,true);

		$criteria->compare('locked',$this->locked);

		$criteria->compare('locked_at',$this->locked_at,true);

		$criteria->compare('validated',$this->validated);

		$criteria->compare('failed_attempt',$this->failed_attempt);

		$criteria->compare('failed_attempt_at',$this->failed_attempt_at,true);

		$criteria->compare('person_id',$this->person_id);

		$criteria->compare('validation_code',$this->validation_code,true);

		$criteria->compare('request_reset_at',$this->request_reset_at,true);

		$criteria->compare('expired',$this->expired);

		$criteria->compare('expired_at',$this->expired_at,true);

		$criteria->compare('reset_count',$this->reset_count);

		$criteria->compare('reset_at',$this->reset_at,true);

		$criteria->compare('last_login_at',$this->last_login_at,true);

		$criteria->compare('recovery_code',$this->recovery_code,true);

		$criteria->compare('created_at',$this->created_at,true);

		$criteria->compare('modified_at',$this->modified_at,true);

		$criteria->compare('created_by',$this->created_by,true);

		$criteria->compare('modified_by',$this->modified_by,true);

		$criteria->compare('active',$this->active);

		$criteria->compare('descr',$this->descr,true);

		$criteria->compare('guid',$this->guid,true);

		return new CActiveDataProvider('Users', array(
			'criteria'=>$criteria,
		));
	}
}