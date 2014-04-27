<?php

class m140426_092448_create_customer_shipping extends CDbMigration
{
	public function safeUp()
	{
		$this->createTable('customer_shipping',
			array(
				'id' =>'pk',
				'customer_id' => 'int not null',
				'shipping_to' => 'varchar(65) not null',
				'shipping_address' => 'varchar(255) not null',
				'created_at' => 'timestamp not null default now()',
				'modified_at' => 'datetime',
				'created_by' => 'varchar(30)',
				'modified_by' => 'varchar(30)',
				'active' => 'boolean default true',
			)
		);
		$this->addForeignKey('fk_customer_shipping__customers', 
				         'customer_shipping', 
				         'customer_id', 
				         'customers', 
				         'id');
	}
	
	public function safeDown(){
		$this->dropTable('customer_shipping');
	}
}