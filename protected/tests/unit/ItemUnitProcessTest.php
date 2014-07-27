<?php 
/**
 * Test the AddressProcess component
 * Date: 2013-07-06
 * @author Sith Kong <sithkong@gmail.com>
 */
 
class ItemUnitProcessTest extends CTestCase {
	
	protected $unit;
	
	protected function setUp() {
		$this->unit  = new ItemUnitProcess();
	}
	
	protected function tearDown() {
		if( isset($this->unit)) unset($this->unit);
    }
        
	public function testCreateItemUnit() {
		$model = new UnitForm;
		$model->unitCode = 'CTN';
		$model->unitDescr = "ee";
		$items = CJSON::decode('[{"name":"ee","descr":"ee"}]');
		$id = $this->unit->createItemUnit($model, $items);
        print_r($id);
		print_r($items);
		$this->assertTrue($id > 0);
	}
	
	public function testUpdateSupplier() {
		$supplier = new SupplierForm();
		$supplier->id = '11';
		$supplier->name = 'engeung';
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
		$flag = $this->supProc->updateSupplier($supplier);
		print_r($flag);
		$this->assertTrue($flag);
	}

}