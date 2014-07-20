<?php

class m140713_155928_create_categories extends CDbMigration
{
	
	// Use safeUp/safeDown to do migration with transaction
	public function safeUp()
	{
		$this->createTable('categories',
                array(
                        'id' =>'pk',
                        'name' => 'varchar(60) not null',
                        'code' => 'varchar(60) not null',
                        'descr' => 'varchar(60) not null',
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
		$this->dropTable('categories');
	}
	
}