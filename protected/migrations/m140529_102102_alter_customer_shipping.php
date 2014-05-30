<?php

class m140529_102102_alter_customer_shipping extends CDbMigration
{
	
	// Use safeUp/safeDown to do migration with transaction
	public function safeUp()
	{
            $this->addColumn('customer_shipping', 'note', 'varchar(255)');
	}

	public function safeDown()
	{
	}
	
}