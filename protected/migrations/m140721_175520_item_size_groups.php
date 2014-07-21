<?php

class m140721_175520_item_size_groups extends CDbMigration
{

	// Use safeUp/safeDown to do migration with transaction
	public function safeUp()
	{
		$this->createTable('item_size_groups',
			array(
				'id' =>'pk',
				'code' => 'varchar(20)',
				'descr' => 'varchar(65)',
				'unit_group_code' => 'varchar(20)',
				'created_at' => 'timestamp not null default now()',
				'modified_at' => 'datetime',
				'created_by' => 'varchar(30)',
				'modified_by' => 'varchar(30)',
				'active' => 'boolean default true',
			)
		);
	}

	public function safeDown()
	{
		$this->dropTable('item_size_groups');
	}
}