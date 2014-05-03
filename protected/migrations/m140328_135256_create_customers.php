<?php

class m140328_135256_create_customers extends CDbMigration
{
	public function safeUp()
	{
		$this->createTable('customers', array(
			'id' => 'pk',
			'first_name' => 'varchar(50) not null',
			'middle_name' => 'varchar(50)',
			'title' => 'varchar(20)',
			'customer_type' => 'int',
			'phone1' => 'varchar(30)',
			'phone2' => 'varchar(30)',
			'email1' => 'varchar(30)',
			'email2' => 'varchar(30)',
			'country_id' => 'int',
			'province_id' => 'int',
			'commune_id' => 'int',
			'district_id' => 'int',
		    'created_at' => 'timestamp not null default now()',
			'modified_at' => 'datetime',
			'created_by' => 'varchar(30)',
			'modified_by' => 'varchar(30)',
			'active' => 'boolean default true',
			'location_id' => 'int'
		));

	}

	public function safeDown()
	{
		$this->dropTable('customers');
	}
}