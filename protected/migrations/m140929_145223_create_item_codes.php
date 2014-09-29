<?php

class m140929_145223_create_item_codes extends CDbMigration
{
	// Use safeUp/safeDown to do migration with transaction
	public function safeUp()
	{
		$this->createTable('item_codes',
			array(
				'id' =>'pk',
				'category_id' => 'varchar(64)',
				'item_type_id' => 'varchar(64)',
				'item_code' => 'varchar(64)',
				'descr' => 'varchar(128)',
				'barcode' => 'varchar(25)',
				'unit_group_code' => 'varchar(16)',
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
		$this->dropTable('item_codes');
	}
}