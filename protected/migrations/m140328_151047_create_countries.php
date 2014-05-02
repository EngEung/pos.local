<?php

class m140328_151047_create_countries extends CDbMigration
{
	public function up()
	{
		$this->createTable('countries',
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
		
		$this->insert('countries', array(
			'name' => 'KH',
			'descr' => 'Cambodia',
		));
		
				
		$this->insert('countries', array(
			'name' => 'USA',
			'descr' => 'The United States',
		));
		
		$this->insert('countries', array(
			'name' => 'CAN',
			'descr' => 'Canada',
		));
		
	}

	public function down()
	{
		$this->dropTable('countries');
	}
}