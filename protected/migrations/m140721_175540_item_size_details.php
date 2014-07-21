<?php

class m140721_175540_item_size_details extends CDbMigration
{
	// Use safeUp/safeDown to do migration with transaction
	public function safeUp()
	{
		$this->createTable('item_size_details',
			array(
				'id' =>'pk',
				'qty_per_unit' => 'varchar(20)',
				'unit_code' => 'varchar(10)',
				'size_group_code' => 'varchar(20)',
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
		$this->dropTable('item_size_details');
	}
}