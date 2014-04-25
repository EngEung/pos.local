<?php

class m140425_013722_create_menus extends CDbMigration
{
	public function safeUp()
	{
		$this->createTable('menus', array(
			'id' => 'pk',
			'parent_id' => 'int',
			'name' => 'varchar(50) not null',
			'descr' => 'varchar(255)',
			'icon_url' => 'varchar(255)',
			'url'=> 'varchar(255)',
			'icon_url_data' => 'binary',
			'tooltip' => 'varchar(50)',
			'order_num' => 'int default 0',
			'menu_type_id' => 'int not null',
			'created_at' => 'timestamp not null default now()',
			'modified_at' => 'datetime',
			'created_by' => 'varchar(30)',
			'modified_by' => 'varchar(30)',
			'active' => 'boolean default true',
		));
	}
	
	public function safeDown()
	{
		$this->dropTable('menus');
	}
}