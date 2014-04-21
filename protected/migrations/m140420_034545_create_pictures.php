<?php

class m140420_034545_create_pictures extends CDbMigration
{
	
	public function safeUp()
	{
		$this->createTable('pictures', array(
			'id' => 'pk',
			'name' => 'varchar(50)',
			'descr' => 'varchar(255)',
			'data' => 'binary',
			'url' => 'varchar(255)',
			'size' => 'int',
			'width' => 'int',
			'height' => 'int',
			'ratio' => 'float',
			'ext' => 'varchar(10)',
			'mime_type' => 'varchar(20)',
			'picture_type_id' => 'int not null',
			'created_at' => 'timestamp not null default now()',
			'modified_at' => 'datetime',
			'created_by' => 'varchar(30)',
			'modified_by' => 'varchar(30)',
			'active' => 'boolean default true',
		));
	}

	public function safeDown()
	{
		$this->dropTable('pictures');
	}
}