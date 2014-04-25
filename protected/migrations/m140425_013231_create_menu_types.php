<?php

class m140425_013231_create_menu_types extends CDbMigration
{
	public function safeUp()
	{
		$this->createTable('menu_types', array(
			'id' => 'pk',
			'name' => 'varchar(50) not null',
			'descr' => 'varchar(255)',
			'created_at' => 'timestamp not null default now()',
			'modified_at' => 'datetime',
			'created_by' => 'varchar(30)',
			'modified_by' => 'varchar(30)',
			'active' => 'boolean default true',
		));
		
	    $this->insert('menu_types', array(
			'name' => 'HORIZONTAL_MENU',
			'descr' => 'Horizontal menu type',
		));
        
		$this->insert('menu_types', array(
			'name' => 'VERTICAL_MENU',
			'descr' => 'Vertical menu type',
		));
		$this->insert('menu_types', array(
			'name' => 'ACCORDION_MENU',
			'descr' => 'Accordion menu type',
		));
		$this->insert('menu_types', array(
			'name' => 'TAB_MENU',
			'descr' => 'Tab menu type',
		));
		$this->insert('menu_types', array(
			'name' => 'SUB_MENU',
			'descr' => 'sub menu type',
		));
		$this->insert('menu_types', array(
			'name' => 'SUB_HORIZONTAL_MENU',
			'descr' => 'sub horizontal menu type',
		));
		
		$this->insert('menu_types', array(
			'name' => 'SUB_HORIZONTAL_MENU_CHILD',
			'descr' => 'sub horizontal menu child type',
		));
	}
	public function down()
	{
		$this->dropTable('menu_types');
	}
}