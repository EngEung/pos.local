<?php

class m140425_140034_creat_menu_roles extends CDbMigration
{
	public function safeUp()
	{
		$this->createTable('menu_roles', array(
			'id' => 'pk',
			'menu_id' => 'int',
			'role_id' => 'int',
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
		$this->dropTable('menu_roles');
	}
}