<?php

class m140329_150250_create_locations extends CDbMigration
{
	// Use safeUp/safeDown to do migration with transaction
	public function safeUp()
	{
	  $this->createTable('locations',
		array(
			'id' => 'pk',
			'name' => 'varchar(50) not null',
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
		$this->dropTable('locations');
	}
}