<?php

class m121103_133830_create_people extends CDbMigration
{
	public function safeUp()
	{
		$this->createTable('people', 
		array(
			'id' => 'pk',
			'prefix' => 'varchar(30)',
			'first_name' => 'varchar(50) not null',
			'middle_name' => 'varchar(50)',
			'last_name' => 'varchar(50) not null',
			'nick_name' => 'varchar(30)',
			'title' => 'varchar(20)',
			'pref_name' => 'varchar(30)',
			'gender' => 'char(1)',
			'position' => 'varchar(30)',
			'age' => 'int',
			'date_of_birth' => 'datetime',
		    'descr' => 'varchar(255)',
		    'created_at' => 'timestamp not null default now()',
			'modified_at' => 'datetime',
			'created_by' => 'varchar(30)',
			'modified_by' => 'varchar(30)',
			'active' => 'boolean default true',
		));
		
		$this->insert('people', array(
			'first_name' => 'sith',
			'last_name' => 'kong',
			'gender' => 'm',
			'age' => 32,
		));
		
		$this->insert('people', array(
			'first_name' => 'amber',
			'last_name' =>  'kong',
			'gender' => 'f',
			'age' => 19,
		));
		
		$this->insert('people', array(
			'first_name' => 'lama',
			'last_name' =>  'kong',
			'gender' => 'm',
			'age' => 2,
		));
		
		$this->insert('people', array(
			'first_name' => 'natasha',
			'last_name' =>  'kong',
			'gender' => 'f',
			'age' => 1,
		));
	}

	public function safeDown()
	{
		$this->dropTable('people');
	}
}