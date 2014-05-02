<?php

class m121103_135251_create_users extends CDbMigration
{
	public function safeUp()
	{
		$this->createTable('users',
			array(
				'id' => 'pk',
				'email' => 'varchar(30) not null',
				'username' => 'varchar(255)',
				'passwd' => 'varchar(255) not null',
				'salted_passwd' => 'varchar(255)',
				'locked' => 'boolean default false',
				'locked_at' => 'datetime',
				'validated' => 'boolean default false',
				'failed_attempt' => 'int default 0',
				'failed_attempt_at' => 'datetime',
				'person_id' => 'int not null',
				'validation_code' => 'varchar(255) not null',
				'request_reset_at' => 'datetime',
				'expired' => 'boolean default false',
				'expired_at' => 'datetime',
				'reset_count' => 'int default 0',
				'reset_at' => 'datetime',
				'last_login_at' => 'datetime',
				'recovery_code' => 'varchar(255)',
				'created_at' => 'timestamp not null default now()',
				'modified_at' => 'datetime',
				'created_by' => 'varchar(30)',
				'modified_by' => 'varchar(30)',
				'active' => 'boolean default true',
				'descr' => 'varchar(255)',
				'guid' => 'varchar(255) not null',
			));
			
		/*
		$this->addForeignKey('fk_users__people', 
								 'users', 
								 'person_id', 
								 'people', 
								 'id');*/
		
						 
	    $this->insert('users', 
			array(
				'email' => 'sithkong@gmail.com',
				'username' => 'sithkong',
				'passwd' => md5('S1thK0n9'),
				'person_id' => 1,
				'validation_code' => uniqid(),
				'validated' => true,
				'guid' => uniqid(),
			));
			
	   $this->insert('users', 
		array(
			'email' => 'amberkong@gmail.com',
			'username' => 'amberkong',
			'passwd' => md5('S1thK0n9'),
			'person_id' => 2,
			'validation_code' => uniqid(),
			'validated' => true,
			'guid' => uniqid(),
		));
		
	  $this->insert('users', 
		array(
			'email' => 'lamakong@gmail.com',
			'username' => 'lamakong',
			'passwd' => md5('S1thK0n9'),
			'person_id' => 3,
			'validation_code' => uniqid(),
			'validated' => true,
			'guid' => uniqid(),
		));
		
    $this->insert('users', 
		array(
			'email' => 'natashakong@gmail.com',
			'username' => 'natashakong',
			'passwd' => md5('S1thK0n9'),
			'person_id' => 4,
			'validation_code' => uniqid(),
			'validated' => true,
			'guid' => uniqid(),
		));
	}

	public function safeDown()
	{
		$this->dropForeignKey('fk_users__people', 'users');
		$this->dropTable('users');
	}
}