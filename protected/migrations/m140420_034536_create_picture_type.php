<?php

class m140420_034536_create_picture_type extends CDbMigration
{
	public function safeUp()
	{
		$this->createTable('picture_types',
		array(
			'id' => 'pk',
			'name' => 'varchar(50) not null',
			'descr' => 'varchar(255)',
			'created_at' => 'timestamp not null default now()',
			'modified_at' => 'datetime',
			'created_by' => 'varchar(30)',
			'modified_by' => 'varchar(30)',
			'active' => 'boolean default true', 
		));
		
		$this->insert('picture_types', array(
			'name' => 'ICON',
			'descr' => 'Icon',
		));
		
		$this->insert('picture_types', array(
			'name' => 'PRODUCT',
			'descr' => 'Product',
		));
		
		$this->insert('picture_types', array(
			'name' => 'IT_COUPON',
			'descr' => 'Coupon',
		));
		
		$this->insert('picture_types', array(
			'name' => 'LOGO',
			'descr' => 'Logo',
		));
		
		$this->insert('picture_types', array(
			'name' => 'PICTURE_FOR_CUSTOMER',
			'descr' => 'Picture for customer',
		));
	}

	public function safeDown()
	{
		$this->dropTable('picture_types');
	}
	
}