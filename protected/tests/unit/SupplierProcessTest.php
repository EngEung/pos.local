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
	
	public function testUpdateAddress() {
		$addressId = 4;
		$addr1 = '3037 Windsor Meadow Lane';
		$addrTypeId = 2;
		$stateId = 6;
		$flag = $this->addrProc->updateAddress($addressId, $addr1, $addrTypeId, $stateId);
		
		$this->assertTrue($flag);
	}

	public function testDeleteAddress() {
		$addressId = 4; 
		$flag = $this->addrProc->deleteAddress($addressId);
		$this->assertTrue($flag);
	}
	 
	public function testGetPostalCodeId() {
		$code = '124536';
		$id = $this->addrProc->getPostalCodeId($code);
		$this->assertTrue($id > 0);
	}
	
	public function testGetAddressTypeId() {
		$name = AppConstant::AT_PHYSICAL_ADDR;
		$id = $this->addrProc->getAddressTypeId($name);
		$this->assertTrue($id > 0);
	}
	
	public function testGetTimezoneId() {
		$id = $this->addrProc->getTimezoneId(AppConstant::TIMEZONE_EST);
		$this->assertTrue($id > 0);
	}
	
	public function testGetDistrictId() {
		$name = 'district 1';
		$id = $this->addrProc->getDistrictId($name);
		$this->assertTrue($id > 0);
	}
	
	public function testGetZoneId() {
		$const = 'Z_ZONE_01';
		$id = $this->addrProc->getZoneId($const);
		$this->assertTrue($id > 0);
	}
	
	public function testGetRegionId() {
		$const = 'RE_REGION_01';
		$id = $this->addrProc->getRegionId($const);
		$this->assertTrue($id > 0);
	}
	
	public function testGetCountryId() {
		$name = 'USA';
		$id = $this->addrProc->getCountryId($name);
		$this->assertTrue($id > 0);
	}
	
	public function testGetStateId() {
		$stateTypeId = 1;
		$countryId = 1;
		$name = 'AL';
		$id = $this->addrProc->getStateId($name, $stateTypeId, $countryId);
		$this->assertTrue($id > 0);
	}
	
	public function testGetCityId() {
		$name = 'Charlotte';
		$stateId = 34;
		$id = $this->addrProc->getCityId($name, $stateId);
		$this->assertTrue($id > 0);
	}
	
	public function testGetCountyId() {
		$name = 'mecklengburg';
		$stateId = 1;
		$id = $this->addrProc->getCountyId($name, $stateId);
		$this->assertTrue($id > 0);
	}
	
	public function testGetCountries() {
		$countries = $this->addrProc->getCountries();
		$this->assertTrue(count($countries) > 0);
	}
	
	public function testGetCountryList() {
		$countryList = $this->addrProc->getCountryList();	
		$this->assertTrue(count($countryList) > 0);
	}
	
	public function testGetCountryJSON() {
		$json = $this->addrProc->getCountryJSON();
		$this->assertTrue(count($json) > 0);
	}
	
	public function testGetStateOrProvinces() {
		$countryId = 1; $stateTypeId = 1;
		$stateOrProvinces = $this->addrProc->getStateOrProvinces($countryId, $stateTypeId);
		$this->assertTrue(count($stateOrProvinces) > 0);
	}
	  
	public function testGetStateOrProvinceList() {
		$countryId = 1; $stateTypeId = 1;
		$stateOrProvinceList = $this->addrProc->getStateOrProvinceList($countryId, $stateTypeId);
		$this->assertTrue(count($stateOrProvinceList) > 0);
	}
	
	public function testGetStateOrProvinceJSON() {
		$countryId = 1; $stateTypeId = 1;
		$json = $this->addrProc->getStateOrProvinceJSON($countryId, $stateTypeId);
		$this->assertTrue(count($json) > 0);
	}
	
	public function testGetCitites() {
		$stateId = 34;
		$cities = $this->addrProc->getCities($stateId);
		$this->assertTrue(count($cities) > 0);
	}
	
	public function testGetCityList() {
		$stateId = 34;
		$cityList = $this->addrProc->getCityList($stateId);
		$this->assertTrue(count($cityList) > 0);
	}
	
	public function tesetGetCityJSON() {
		$stateId = 34;
		$cityJSON = $this->addrProc->getCityJSON($stateId);
		$this->assertTrue(count($cityJSON) > 0);
	}
	
	public function testGetStateTypeId() {
		$id = $this->addrProc->getStateTypeId(AppConstant::ST_STATE);
		$this->assertTrue($id > 0);
	}
	
}