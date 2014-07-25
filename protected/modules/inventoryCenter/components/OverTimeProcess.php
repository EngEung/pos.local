<?php
/**
 * @version 1.0
 * Date: 2014-3-12
 * Author:
 */

class OverTimeProcess extends CApplicationComponent{
	
	
	public function getOvertime($employeeId){
		return EmployeeOT::model()->findByAttributes(array('employee_id' => $employeeId, 'status' => 'pending'));
	}
	
	
	public function deleteOTByEmployeeId($id){
		EmployeeBenifit::model()->updateAll(array('status' => false),
					  array('condition' => "employee_id = :empId",
					  'params' => array(':empId' => $id)
		));
	}
	
	
	/**
	 * Add Over Time 
	 * @param int $employeeId,
	 * @param datetime $requestedDate,
	 * @param number $totalHour,
	 * @param array $items,
	 * @return int
	 * Tested :passed
	 */
	public function addOverTime($employeeId, $requestedDate, $totalHour, $status, $items){
		if($employeeId == null || $requestedDate == null) return -1;
		$result = -1;
		$cnc = Yii::app()->db;	
		$tran = $cnc->beginTransaction();
		try{
			$employeeOT = new EmployeeOT;
			$employeeOT->setAttributes(array(
				'employee_id' => $employeeId,
				'requested_date' => $requestedDate,
				'total_hour' => $totalHour,
				'status' => $status
			));
			
			$employeeOT->save(false);
			if($employeeOT->id <0) $tran->rollBack();
			if($items != null){
				foreach($items as $row){
					$empDetail = new EmployeeOTDetail();
					$empDetail->setAttributes(array(
						'ot_id' => $employeeOT->id,
						'ot_type_id' => $row['type'],
						'activity' => $row['activity'],
						'ot_date' => $row['date'],
						'from_time_am' => $row['from_time'],
						'to_time_am' => $row['to_time'],
						'from_time_pm' => $row['from_time_pm'],
						'to_time_pm' => $row['to_time_pm'],
						'num_of_hour' => $row['num_of_hour'],
					));
					$empDetail->save(false);
				}
			}
			
			$result =$employeeOT->id;
			$tran->commit();
		}catch(CException $ex) {
			//$this->_error->insert($ex, $comments);
			$result = -1;
			$tran->rollBack();
		}
		return $result;
	}
	
	/**
	 * Get Employee who approved over time.
	 * @param int employeeId,
	 * @return array(),
	 * Tested :passed;
	 */
	public function getEmployeeValidationRule($employeeId){
    	try {
    		$cnc = Yii::app()->db;
    		$cmd = new CDbCommand($cnc);
			$sql = "SELECT DISTINCT vrr.id, vrr.employee_id, vrr.validation_rule_id, 
					GROUP_CONCAT(vrr.validator) AS validator_id, GROUP_CONCAT(vrr.validator_email) AS validator_email 
					FROM view_employee_frist_validator vrr WHERE vrr.employee_id =:employeeId;";
			$dataReader = null;
    		$cmd = $cnc->createCommand($sql);
    		$cmd->bindParam(":employeeId", $employeeId, PDO::PARAM_INT);
    		$dataReader = $cmd->query();
    	} catch(CException $ex) {
    		//$this->_error->insert($ex, $desc);
    	}
    	return $dataReader;
	}
	
	/**
	 * Send Email For Request Overtime
	 * @param array $to,
	 * @param array $cc,
	 * @param array $bcc,
	 * @param string $replyTo,
	 * @return boolean
	 * Test:passed
	 */
	public function sendEmail($from, $to, $cc = null, $bcc = null, $replyTo =null){
		$noti = new NotificationProcess();
		$obj = $noti->getMsgTmp(AppConstant::MSG_TMP_MSG_OVERTIME_MANAGEMENT);
      	$noti->setFrom($from);
        $subject = $obj->subject;
      	$kv = array(
            '#{DEAR}' => 'Team',
            '#{FROM_DATE}' => '2014-06-12',
            '#{UNTIL_DATE}' => '2014-06-12',
            '#{FULL_NAME}' => 'Ing Eng',
            '#{PHONE}' => '092 302 605'
        );    
        // notify
        $flag = $noti->notify(AppConstant::MSG_TMP_MSG_OVERTIME_MANAGEMENT, $kv, $to, $subject, null,
							AppConstant::MT_OVERTIME_MESSAGE, AppConstant::MSG_MS_QUEUED, $cc, $bcc, $replyTo);
		return $flag;
	}
	
	/**
	 * Send Email For Request Overtime
	 * @param array $to,
	 * @param array $cc,
	 * @param array $bcc,
	 * @param string $replyTo,
	 * @return boolean
	 * Test:passed
	 */
	public function sendEmailRejectOvertime($from, $to, $cc = null, $bcc = null, $replyTo =null){
		$noti = new NotificationProcess();
		$obj = $noti->getMsgTmp(AppConstant::MSG_TMP_MSG_OVERTIME_MANAGEMENT);
      	$noti->setFrom($from);
        $subject = $obj->subject;
      	$kv = array(
            '#{DEAR}' => 'Team',
            '#{FROM_DATE}' => '2014-06-12',
            '#{UNTIL_DATE}' => '2014-06-12',
            '#{FULL_NAME}' => 'Ing Eng',
            '#{PHONE}' => '092 302 605'
        );    
        // notify
        $flag = $noti->notify(AppConstant::MSG_TMP_MSG_OVERTIME_MANAGEMENT, $kv, $to, $subject, null,
							AppConstant::MT_OVERTIME_MESSAGE, AppConstant::MSG_MS_QUEUED, $cc, $bcc, $replyTo);
		return $flag;
	}
	
	public function sendEmailForRequester($from, $to, $cc = null, $bcc = null, $replyTo =null){
		$noti = new NotificationProcess();
		$obj = $noti->getMsgTmp(AppConstant::MSG_TMP_MSG_OVERTIME_MANAGEMENT);
      	$noti->setFrom($from);
        $subject = $obj->subject;
      	$kv = array(
            '#{DEAR}' => 'Team',
            '#{FROM_DATE}' => '2014-06-12',
            '#{UNTIL_DATE}' => '2014-06-12',
            '#{FULL_NAME}' => 'Ing Eng',
            '#{PHONE}' => '092 302 605'
        );    
        // notify
        $flag = $noti->notify(AppConstant::MSG_TMP_MSG_OVERTIME_MANAGEMENT, $kv, $to, $subject, null,
							AppConstant::MT_OVERTIME_MESSAGE, AppConstant::MSG_MS_QUEUED, $cc, $bcc, $replyTo);
		return $flag;
	}
	
	/**
	 * Add Employee OT Approved
	 * @param int $otId, id of employee ot
	 * @param int $validationid,
	 * @param int $approvedNo,
	 * @param string $status,
	 * @param string $createdBy,
	 * @param boolean $sendEmail,
	 * @param boolean $isFinal,
	 * @return boolean 
	 * Tested :passed
	 */
	public function addEmployeeOTApproved($otId, $validationId, $approvedNo, $status, $createdBy, $sendEmail, $isFinal){
		//if($otId == null || $validationId == null) return false;
		$empOTApproved  = new EmployeeOTApproved();
		$empOTApproved->setAttributes(array(
			'employee_ot_id' => $otId,
			'employee_validation_rule_id' => $validationId,
			'approved_no' => $approvedNo,
			'status' => $status,
			'send_email' => $sendEmail,
			'created_by' => $createdBy,
			'is_final' => $isFinal
		));
		return $empOTApproved->save(false);
	}
	
	/**
	 * Request OvertTime frist
	 * @param int $employeeId,
	 * @param dateTime $requetedDate,
	 * @param number $toalHour,
	 * @param string $staus = 
	 */
	public function requestOverTime($employeeId, $requestedDate, $totalHour, $status, $items,$createdBy){
		$result = false;
		try{
			$empContact = EmployeeContact::model()->findByAttributes(array('employee_id'=> $employeeId));
			if($empContact != null){ 
				
				$overTimeId = $this->addOverTime($employeeId, $requestedDate, $totalHour, $status, $items);
				
				$dataReader = $this->getEmployeeValidationRule($employeeId);
				$approvedNo = 1;
				$sendEmail = false;
				$validationId =0;
				$isFinal =0;
				$from = $empContact->company_email;
				$to = array();
				$email;
				foreach($dataReader as $row){
					$validationId = $row['id'];
					$email = $row['validator_email'];
					foreach(explode(",", $email) as $row){
						$to[] =$row; 
					}
				}
				if($to != null)
					$sendEmail = $this->sendEmail($from, $to);
				$result = $this->addEmployeeOTApproved($overTimeId, $validationId, $approvedNo,  AppConstant::STATUS_PENDING, $createdBy, $sendEmail, $isFinal);
			}
			//$tran->commit();
		}catch(CException $ex) {
    		//$this->_error->insert($ex, $desc);
    		echo $ex;
			$result = false;
			//$tran->rollBack();
    	}
		return $result;
		
	}
	
	/**
	 * Approval Overtime
	 * @param int $otId,
	 * @param int $employeeId
	 * @param int $employeeApprovedId,
	 * @param int $approvedNo,
	 * @param boolean $isFinal,
	 * @return boolean 
	 * Tested:passed
	 */
	public function overTimeApprovaled($otId, $employeeId, $employeeApprovedId, $approvedNo, $isFinal){
		if($otId == null || $employeeId == null || $approvedNo == null) return false;
		
		 $from  = "";
		$sendEmail = false;
		 $empContact = EmployeeContact::model()->findByAttributes(array('employee_id'=> $employeeId));
		 if($empContact != null)
			 $from = $empContact->company_email;
		 $result =  false;
		$cnc = Yii::app()->db;	
		$tran = $cnc->beginTransaction();
		try{
			  $approvedBy = $employeeApprovedId; 
			 if($isFinal){
			 	$result = $this->updateRquestedOverTime($otId, AppConstant::STATUS_COMPLETE);
				$requesterEmail = null;
				$validatorEmail = null;
				/**
				 * we need to send email come back to requester to confirim over time has been approvaed
				 */
				 if($from != null)
				 	$requesterEmail[] = $from; 
				 
				 $validator = EmployeeContact::model()->findByAttributes(array('employee_id'=> Yii::app()->session->get('employeeid')));
				 if($validator != null)
				 	$validatorEmail = $validator->company_email;
				 
				 if($validatorEmail != null && is_array($requesterEmail))
				 	$sendEmail = $this->sendEmailForRequester($validatorEmail, $requesterEmail);
				
				 $result = $this->updateEmployeeOTApproved($otId, $approvedNo, AppConstant::STATUS_APPROVED, $approvedBy, null, $sendEmail);
			 }else{
			 	
				/**
				 *1. Update tbl_employee_ot_approved
				 * - status =approved,
				 * - approved by 
				 *2. call method getEmployeeApprovedNext($employeeId, $apprvedNo +1)
				 *3. add tbl_employee_ot_approved that get data from step 2
				 */
			 	 $result = $this->updateEmployeeOTApproved($otId, $approvedNo, AppConstant::STATUS_APPROVED, $approvedBy);
			
				 $approvedNextNo = $approvedNo + 1;
				 $isFinalNext = 0;
				 $validationId = 1;
				 $do = $this->getEmployeeApprovedNext($employeeId, $approvedNextNo);
				 $to = array();
				 $email;
				 foreach($do as $row){
					$approvedNextNo = $row['approved_no'];
					$isFinalNext = $row['is_final'];
					$validationId = $row['emp_validation_rule_id'];
					$email = $row['validator_email'];
					foreach(explode(",", $email) as $row){
						$to[] =$row; 
					}
				 }
				 $sendEmail = false;
				 if($to !=null){
					 if($to[0] != null && $from != null)
						$sendEmail = $this->sendEmail($from, $to);
				 }
				
					 # add employee overtime approved next 
				 $createdBy = $employeeApprovedId;
				 $result = $this->addEmployeeOTApproved($otId, $validationId, $approvedNextNo,  AppConstant::STATUS_PENDING, $createdBy, $sendEmail, $isFinalNext);
			 }
			 $tran->commit();
		}catch(CException $ex) {
    		print_r($ex);
			$result = false;
			$tran->rollBack();
		}
		 
		return $result;
	}
	
	/**
	 * Get Employee Approved Overtime Next
	 * @param int $id,
	 * @param int $approvedNo,
	 * @return array(),
	 * @Tested:passed
	 */
	public function getEmployeeApprovedNext($id, $approvedNo){
		
		try {
    		$cnc = Yii::app()->db;
    		$cmd = new CDbCommand($cnc);
			//$sql ="CALL proc_employee_validation({$id}, {$approvedNo})";
			$sql = "SELECT * FROM (
			   SELECT dd.*,@curRow := @curRow + 1 AS approved_no FROM (
				SELECT v.id AS emp_validation_rule_id, v.employee_id, v.validation_rule_id, GROUP_CONCAT(v.validator) AS validator, 
				GROUP_CONCAT(v.validator_email) validator_email, v.is_final 
				FROM view_employee_frist_validator v
				WHERE employee_id = :employeeId
				UNION ALL
				SELECT e.emp_validation_rule_id , e.employee_id, e.validation_rule_id, GROUP_CONCAT(e.validator) AS validator, 
				GROUP_CONCAT(e.validator_email) validator_email, e.is_final 
				FROM view_employee_overtime_final_validator e WHERE e.employee_id = :employeeId1
			   ) AS dd JOIN  (SELECT @curRow := 0) r
			) AS ddd WHERE (ddd.approved_no = :approvedNo OR  0 = :approvedNo1)";
			$dataReader = null;
    		$cmd = $cnc->createCommand($sql);
			$cmd->bindParam(":employeeId",$id,PDO::PARAM_INT);
			$cmd->bindParam(":employeeId1",$id,PDO::PARAM_INT);
			$cmd->bindParam(":approvedNo",$approvedNo,PDO::PARAM_INT);
			$cmd->bindParam(":approvedNo1",$approvedNo,PDO::PARAM_INT);
    		$dataReader = $cmd->query();
    	} catch(CException $ex) {
    		//$this->_error->insert($ex, $desc);
    	}
    	return $dataReader;
	}
	
	/**
	 * Get Overtime for approval
	 * @param $id int, the employee id who need to approval overtime
	 * @return json
	 * @Teted: passed 
	 */
	public function getOverTimeApproved($id){
		$sql ="CALL proc_over_time_validate({$id})";
		return Utils::exprotData($sql);
	}
	
	/**
	 * Update requested over time
	 * @param int $id,
	 * @param string $status
	 * @return boolean
	 */
	public function updateRquestedOverTime($id, $status){
		$model = EmployeeOT::model()->findbyPK($id);
		$model->setAttributes(array(
			'status' => $status
		));
		return $model->save(false);
	}
	
	/**
	 * Update Emplooyee Overtime approved
	 * 
	 * Tested:passed
	 */
	public function updateEmployeeOTApproved($id, $approvedNo, $status, $approvedBy, $rejectedBy = null, $sendEmail = false){
		$model = EmployeeOTApproved::model()->findByAttributes(array('employee_ot_id' =>$id, 'approved_no' => $approvedNo));
		if($model != null){
			$model->setAttributes(array(
				'status' => $status,
				'approved_by' => $approvedBy,
				'modified_at' => new CDbExpression('NOW()'),
				'rejected_by' => $rejectedBy,
				'send_email_requester' => $sendEmail
			));
			return $model->save(false);
		}
		return false;
		
	}
	
	public function getOvertimeDetails($otId){
		$sql = "SELECT DISTINCT tt.* FROM (
					SELECT DISTINCT eo.employee_id, o.id, o.activity, DATE_FORMAT(o.ot_date, '%Y-%m-%d') AS ot_date, o.from_time_am, o.to_time_am, o.from_time_pm, o.to_time_pm, o.num_of_hour, ot.type_name, 0 AS is_scan 
					FROM tbl_ot_detail o
					INNER JOIN tlkp_ot_type ot ON o.ot_type_id = ot.id
					INNER JOIN tbl_employee_ot eo ON o.ot_id = eo.id 
					WHERE o.ot_id = $otId
					UNION ALL
					SELECT DISTINCT eo.employee_id, od.id, od.activity,DATE_FORMAT(dr.date_scan, '%Y-%m-%d') AS ot_date, dr.r1, dr.r2, dr.r3, dr.r4 , 0 AS num_of_hour, ot.type_name, 1 AS is_scan
					FROM tbl_daily_record dr
					INNER JOIN tbl_employee_ot eo ON eo.employee_id  = dr.employee_id
					INNER JOIN tbl_ot_detail od ON od.ot_id = eo.id AND od.ot_date = dr.date_scan
					INNER JOIN tlkp_ot_type ot ON od.ot_type_id = ot.id
					WHERE od.ot_id = $otId
				) AS tt ORDER BY id, num_of_hour  ";
		return Utils::exprotData($sql);
	}
	
	/**
	 * Rejected Requeste Overtime
	 * @param int $otId,
	 * @param int $employeId,
	 * @param int $approvedNo,
	 * @param int $rejectedBy
	 * @return boolean
	 * Tested: passed;
	 */
	public function rejectRequestOverTime($otId, $employeeId, $approvedNo, $rejectedBy){
		if($otId == null || $employeeId == null || $approvedNo == null) return false;
		$sendEmail = false;
		$flage = false;
		$cnc = Yii::app()->db;	
		$tran = $cnc->beginTransaction();
		try{
			/**
			 * when reject request overtime 
			 * 1. update requestd overtime to status reject
			 * 2. update employee overtime approved status to reject
			 * 2. send email to requester
			 */
			$flage = $this->updateRquestedOverTime($otId, AppConstant::STATUS_REJECT);
			if(!$flage) $tran->rollBack();
			
			
			
			$to =array();
			$requester = EmployeeContact::model()->findByAttributes(array('employee_id'=> $employeeId));
		 	if($requester != null)
			 	$to[] = $requester->company_email;
			
			$from = "";
			$emp = EmployeeContact::model()->findByAttributes(array('employee_id' => $rejectedBy));
			if($emp != null)
				$from = $emp->company_email;
			
			if($to != null && $from != null)
					$sendEmail = $this->sendEmailRejectOvertime($from, $to);
					
			$flage = $this->updateEmployeeOTApproved($otId, $approvedNo, AppConstant::STATUS_REJECT, "", $rejectedBy, $sendEmail);
			if(!$flage) $tran->rollBack();		
			
			$tran->commit();
		}catch(CException $ex) {
			print_r($ex);
    		//$this->_error->insert($ex, $desc);
    	}
    	return $flage;
	}
	
}
?>