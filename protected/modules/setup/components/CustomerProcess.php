<?php
/**
 * This capture is used for capturing application exception 
 * and redirect the user a friendly error notification pages
 * Date: 2012-09-23
 * 
 */
class CustomerProcess extends CApplicationComponent {
	
	public function __construct() {
		
	}
	
	public function getCustomerLists($order = 'asc'){
		$dataReader = null;
    	$desc = "get customers";
    	try {
    		$cnc = Yii::app()->db;
    		$cmd = new CDbCommand($cnc);
    		$sql = "select mn.*, l.name as 'location_name', ct.name as 'customer_type_name' 
    		from customers c 
    		inner join customer_type ct on c.customer_type_id = ct.id
    		inner join locations l on l.id = c.location_id 
    		where c.active = true";
    		$cmd = $cnc->createCommand($sql);
    		//$cmd->bindParam(":name", $name, PDO::PARAM_STR);
    		$dataReader = $cmd->query();
			foreach($dataReader as $row){
				$arr[]= array('id'=> $row['id'], 'first_name'=>$row['first_name'], 'last_name'=>$row['last_name'],
				'title' => $row['title'], 'customer_type_id' => $row['customer_type_id'], 'phone1' => $row['phone1'],
				'phone2'=> $row['phone2'], 'email1' => $row['email1'], 'email2'=> $row['email2'], 'location_id' => $row['location_id'],
				'location_name' => $row['locaiton_name'], 'customer_type_name'=> $row['customer_type_name']);
			}
    	} catch(CException $ex) {
    		//$this->_error->insert($ex, $desc);
    	}
    	return $dataReader;
	}

	public function create($model){
		if($model == null) return null;
		$c = new Customers();
		$c->setAttributes(array(
			'first_name' => $model->firstName,
			'last_name' => $model->lastName,
			'title' => $model->title,
			'phone1' => $model->phone1,
			'phone2' => $model->phone1,
			'email1' => $model->email1,
			'email2' => $model->email2,
			'location_id' => $model->locationId
		));
	}
	
	public function update($id, $statusId=null, $notified=null, $resolution=null, $userId=null) {
		if ($id == null && $statusId == null && $notified == null && $resolution == null && $userId == null)
			return null;
		$error = Errors::model()->findByPk($id);
		if ($error == null ) return null;
		if ($statusId != null) $error->error_status_id = $statusId;
		if ($notified != null) $error->notified = $notified;
		if ($resolution != null) $error->resolution = $resolution;
		if ($userId != null) $error->user_id = $userId;	
		$error->save(false);
		$updatedError = Errors::model()->findByPk($id);
		return $updatedError;
	}
	
	 public function getById($id) {
	 	return Errors::model()->findByPk($id);	
	 }
	 
	 public function getByUserId($userId) {
	 	return Errors::model()->findAllByAttributes(array('user_id' => $userId));	
	 }
	 
	 public function getAll() {
	 	return Errors::model()->findAll();
	 }
	 
	 public function assign($id, $userIds) {
	 	if(!is_array($userIds) || $id < 0) return false;
		if (count($userIds) < 1) return false;
		$c = 0;
		foreach($userIds as $userId) {
			$assignments = new ErrorAssignments();
			$assignments->setAttributes(
				array(
					'error_id' => $id,
					'user_id' => $userId,
				)
			);
			$assignments->save(false);
			$c += $assignments->id;
		}	
		return $c > 0;
	 }
	 
	 public function getErrorAssignments($userId) {
	 	return ErrorAssignments::model()->findAllByAttributes(array('user_id'=>$userId));	
	 }
}