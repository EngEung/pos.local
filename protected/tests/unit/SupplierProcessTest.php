<?php 
/**
 * Test the AddressProcess component
 * Date: 2013-07-06
 * @author Sith Kong <sithkong@gmail.com>
 */
 
class SupplierProcessTest extends CTestCase {
	
	protected $supProc;
	
	protected function setUp() {
		$this->supProc  = new SupplierProcess();
	}
	
	protected function tearDown() {
		if( isset($this->supProc)) unset($this->supProc);
        }
        
	public function testCreateSupplier() {
		$supplier = new SupplierForm();
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
		$id = $this->supProc->createSupplier($supplier);
                print_r($id);
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