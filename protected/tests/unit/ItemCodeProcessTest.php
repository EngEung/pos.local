<?php 
/**
 * Test the ItemSizeProcess component
 * Date: 2014-09-19
 * @author Eng Eung <engeung@gmail.com>
 */
 
class ItemCodeProcessTest extends CTestCase {
	
	protected $itemCode;
	
	protected function setUp() {
		$this->itemCode  = new ItemCodeProcess();
	}
	
	protected function tearDown() {
		if( isset($this->itemCode)) unset($this->itemCode);
    }
        
	public function testCreateItemCode() {
		$units = ItemUnitDetails::model()->findAll(array(
						'condition' => 'unit_group_code=:code',
						'params' => array(":code" => 'Ctn') 
					));
		foreach($units as $row){
			 print_r($row['code']);
		}
       
		$this->assertTrue(true);
	}
	
	public function testUpdateItemUnit() {
		$unit = new UnitForm();
		$unit->id = '11';
		$unit->name = 'engeung';
        $supplier->address1 = 'Kompong Chhange';
        $supplier->address2 = 'Kompong Chhange';
        $supplier->cityId = 1;
        $supplier->code = '1212';
        $supplier->contact ='Eung Eng';
        $supplier->countryId = 1;
        $supplier->email = 'engeung@gmail.com';
        $supplier->fax = '121212';
        $supplier->phone = '092302605';
        $supplier->website ='mangosynce.com';
        $supplier->postalCode = '12322';
        $supplier->accountNum = '232232';
		$supplier->note = 'note';
		$flag = $this->unit->updateItemUnit($model, $items);
		print_r($flag);
		$this->assertTrue($flag);
	}

}