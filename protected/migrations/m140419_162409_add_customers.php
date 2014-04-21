<?php

class m140419_162409_add_customers extends CDbMigration
{
	
	public function safeUp()
	{
		$this->dropColumn('customers', 'email2'); 
		$this->addColumn('customers', 'address', 'varchar(255)');
		$this->addColumn('customers', 'picture_id', 'int');
		$this->addColumn('customers', 'fax', 'varchar(10)');
	}

	public function safeDown()
	{
	}
}