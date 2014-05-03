<?php

class m121103_141708_create_user_roles extends CDbMigration
{
	public function safeUp()
	{
		$this->createTable(
			'user_roles',
			array(
				'id' => 'pk',
				'user_id' => 'int not null',
				'role_id' => 'int not null',
				'created_at' => 'timestamp not null default now()',
				'modified_at' => 'datetime',
				'created_by' => 'varchar(30)',
				'modified_by' => 'varchar(30)',
				'active' => 'boolean default true',
			)
		);
		/*
		
				$this->addForeignKey('fk_user_roles__users', 
								 'user_roles', 
								 'user_id', 
								 'users', 
								 'id');
												   $this->addForeignKey('fk_user_roles__roles', 
								 'user_roles', 
								 'role_id', 
								 'roles', 
								 'id');	*/
		
						 
		$this->insert('user_roles', array(
			'user_id' => 1,
			'role_id' => 1,
		));		
		
		$this->insert('user_roles', array(
			'user_id' => 2,
			'role_id' => 2,
		));		
		
		$this->insert('user_roles', array(
			'user_id' => 3,
			'role_id' => 3,
		));	
		
		$this->insert('user_roles', array(
			'user_id' => 4,
			'role_id' => 4,
		));			
		
		$this->insert('user_roles', array(
			'user_id' => 1,
			'role_id' => 2,
		));		
		
		$this->insert('user_roles', array(
			'user_id' => 2,
			'role_id' => 3,
		));		
		
		$this->insert('user_roles', array(
			'user_id' => 3,
			'role_id' => 4,
		));	
		
		$this->insert('user_roles', array(
			'user_id' => 4,
			'role_id' => 5,
		));				 
	}

	public function safeDown()
	{
		$this->dropForeignKey('fk_user_roles__users', 'user_roles');
		$this->dropForeignKey('fk_user_roles__roles', 'user_roles');
		$this->dropTable('user_roles');
	}
}