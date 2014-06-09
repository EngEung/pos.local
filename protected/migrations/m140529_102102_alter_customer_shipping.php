<?php

class m140529_102102_alter_customer_shipping extends CDbMigration
{
	
	// Use safeUp/safeDown to do migration with transaction
	public function safeUp()
	{
            $this->addColumn('customer_shipping', 'note', 'varchar(255)');
        	$this->addColumn('customer_shipping', 'phone', 'varchar(15)');
			$this->addColumn('customer_shipping', 'primary', 'int');
	}

	public function safeDown()
	{
		$this->dropColumn('customer_shipping', 'note');
		$this->dropColumn('customer_shipping', 'phone');
		$this->dropColumn('customer_shipping', 'primary');
	}
	
}