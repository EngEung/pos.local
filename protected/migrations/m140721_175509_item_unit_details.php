<?php

class m140721_175509_item_unit_details extends CDbMigration
{
		// Use safeUp/safeDown to do migration with transaction
	public function safeUp()
	{
		$this->createTable('item_unit_details',
			array(
				'id' =>'pk',
				'code' => 'varchar(100)',
				'descr' => 'varchar(50)',
				'unit_group_code' => 'varchar(20)',
				'main_unit' => 'boolean',
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
		$this->dropTable('item_unit_details');
	}
}