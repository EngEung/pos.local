<?php

class m121103_141403_create_roles extends CDbMigration
{
	public function safeUp()
	{
		$this->createTable(
			'roles',
			array(
				'id' =>'pk',
				'name' => 'varchar(50) not null',
				'descr' => 'varchar(255)',
				'created_at' => 'timestamp not null default now()',
				'modified_at' => 'datetime',
				'created_by' => 'varchar(30)',
				'modified_by' => 'varchar(30)',
				'active' => 'boolean default true',
			)
		);
		
		$this->insert('roles', array(
			'name' => 'R_ADMIN',
			'descr' => 'Administrator',
		));
		
		$this->insert('roles', array(
			'name' => 'R_CUSTOMER',
			'descr' => 'Customer',
		));
		
		$this->insert('roles', array(
			'name' => 'R_MERCHANT',
			'descr' => 'Merchant',
		));
		
		$this->insert('roles', array(
			'name' => 'R_COMPANY',
			'descr' => 'Corporation and Company',
		));
		
		$this->insert('roles', array(
			'name' => 'R_EMPLOYEE',
			'descr' => 'Employee',
		));
		
		$this->insert('roles', array(
			'name' => 'R_CONTRACTOR',
			'descr' => 'Contractor',
		));
		
		$this->insert('roles', array(
			'name' => 'R_SALE_REP',
			'descr' => 'Sale Representative',
		));
		
		$this->insert('roles', array(
			'name' => 'R_MARKETING_AGENT',
			'descr' => 'Marketing Agent',
		));
		
		$this->insert('roles', array(
			'name' => 'R_CS_REP',
			'descr' => 'Customer Service Representative',
		));
		
		$this->insert('roles', array(
			'name' => 'R_TECH_ENGINEER',
			'descr' => 'Technical Engineer',
		));
		
		$this->insert('roles', array(
			'name' => 'R_BA',
			'descr' => 'Business Analyst',
		));
		
		$this->insert('roles', array(
			'name' => 'R_PRJ_MGR',
			'descr' => 'Project Manager',
		));
		
		$this->insert('roles', array(
			'name' => 'R_SE',
			'descr' => 'Software Engineer',
		));
	}

	public function down()
	{
		$this->dropTable('roles');
	}
}