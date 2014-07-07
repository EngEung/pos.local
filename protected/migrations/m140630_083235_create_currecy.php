<?php

class m140630_083235_create_currecy extends CDbMigration
{
    public function safeUp()
    {
        $this->createTable('currencies',
                array(
                        'id' =>'pk',
                        'exchange_rate' => 'varchar(60)',
                        'name' => 'varchar(60) not null',
                        'code' => 'varchar(255) not null',
                        'local_id' => 'int',
                        'created_at' => 'timestamp not null default now()',
                        'modified_at' => 'datetime',
                        'created_by' => 'varchar(30)',
                        'modified_by' => 'varchar(30)',
                        'active' => 'boolean default true',
                )
        );
    }
	
    public function safeDown(){
    	$this->dropTable('currencies');
    }

}