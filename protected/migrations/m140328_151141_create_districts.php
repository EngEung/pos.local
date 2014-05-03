<?php

class m140328_151141_create_districts extends CDbMigration
{

	// Use safeUp/safeDown to do migration with transaction
	public function safeUp()
	{
	  $this->createTable('districts',
		array(
			'id' => 'pk',
			'name' => 'varchar(50) not null',
			'descr' => 'varchar(255)',
			'commune_id' => 'int not null',
			'created_at' => 'timestamp not null default now()',
			'modified_at' => 'datetime',
			'created_by' => 'varchar(30)',
			'modified_by' => 'varchar(30)',
			'active' => 'boolean default true', 
		));
	}

	public function safeDown()
	{
		$this->dropTable('districts');
	}
}