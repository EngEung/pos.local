<?php

class m140328_135242_create_customer_types extends CDbMigration
{
	public function safeUp()
	{
		$this->createTable('customer_types', 
		array(
			'id' => 'pk',
			'name' => 'varchar(30)',
			'descr' => 'varchar(255)',
		    'created_at' => 'timestamp not null default now()',
			'modified_at' => 'datetime',
			'created_by' => 'varchar(30)',
			'modified_by' => 'varchar(30)',
			'active' => 'boolean default true',
		));
	}

	public function safeDown()
	{
		$this->dropTable('customer_types');
	}
}