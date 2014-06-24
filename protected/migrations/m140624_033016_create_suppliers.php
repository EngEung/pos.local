<?php

class m140624_033016_create_suppliers extends CDbMigration
{
	public function safeUp()
	{
            $this->createTable('suppliers',
                    array(
                            'id' =>'pk',
                            'name' => 'varchar(60) not null',
                            'code' => 'varchar(60)',
                            'address1' => 'varchar(255) not null',
                            'address2' => 'varchar(255) not null',
                            'city' => 'varchar(50) not null',
                            'state_province_id' => 'int',
                            'postal_code' => 'varchar(255) not null',
                            'country_id' => 'int',
                            'account_number' => 'varchar(255) not null',
                            'contact' => 'varchar(60) not null',
                            'phone' => 'varchar(15) not null',
                            'email' => 'varchar(60) not null',
                            'fax' => 'varchar(15) not null',
                            'website' => 'varchar(60) not null',
                            'created_at' => 'timestamp not null default now()',
                            'modified_at' => 'datetime',
                            'created_by' => 'varchar(30)',
                            'modified_by' => 'varchar(30)',
                            'active' => 'boolean default true',
                    )
            );
	}
	
	public function safeDown(){
		$this->dropTable('suppliers');
	}
}