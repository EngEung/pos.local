<?php 
/**
 * Test the ItemSizeProcess component
 * Date: 2014-09-19
 * @author Eng Eung <engeung@gmail.com>
 */
 
class ItemSizeProcessTest extends CTestCase {
	
	protected $size;
	
	protected function setUp() {
		$this->size  = new ItemSizeProcess();
	}
	
	protected function tearDown() {
		if( isset($this->size)) unset($this->size);
    }
       
	
	public function testCreateItemSizes() {
		$model = new SizeForm();
		$model->sizeCode = '2x5';
		$model->unitGroupCode = 'Ctn';
		$model->sizeDescr = '2x5';
		$flag = $this->size->createItemSize($model);
		var_dump($flag);
		$this->assertTrue(true);
	}

}