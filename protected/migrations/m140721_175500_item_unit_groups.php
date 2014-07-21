<?php

class m140721_175500_item_unit_groups extends CDbMigration
{
	// Use safeUp/safeDown to do migration with transaction
	public function safeUp()
	{
		$this->createTable('item_unit_groups',
			array(
				'id' =>'pk',
				'code' => 'varchar(60)',
				'descr' => 'varchar(65)',
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
		$this->dropTable('item_unit_groups');
	}
}