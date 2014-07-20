<?php

class m140713_161526_create_item_types extends CDbMigration
{
	
	// Use safeUp/safeDown to do migration with transaction
	public function safeUp()
	{
		$this->createTable('item_types',
			array(
				'id' =>'pk',
				'category_id' => 'int not null',
				'name' => 'int not null',
				'code' => 'varchar(65) not null',
				'descr' => 'varchar(255) not null',
				'created_at' => 'timestamp not null default now()',
				'modified_at' => 'datetime',
				'created_by' => 'varchar(30)',
				'modified_by' => 'varchar(30)',
				'active' => 'boolean default true',
			)
		);
		$this->addForeignKey('fk_item_types__categories', 
				         'item_types', 
				         'category_id', 
				         'categories', 
				         'id');
	}

	public function safeDown()
	{
		$this->dropTable('item_types');
		$this->dropForeignKey('fk_item_types__categories', 'item_types');
	}
}