<?php

class OverTimeController extends  Controller
{
	
	
	public function actionIndex(){
		$this->authenticate();
		$this->layout='//layouts/column2';
		$model = new OverTimeForm();
		$model->requestedDate = date("Y-m-d");
		$common = new Common();
		$otPro = new OverTimeProcess();
		$employeeId = Yii::app()->session->get('employeeid');
		$ot = $otPro->getOvertime($employeeId);
		if($ot != null)
			$model->otId = $ot->id;
		$model->_otTypes = $common->getOTTypeEasyUi();
		$model->timezone = "All";
		$this->render('index', array('model' => $model));
	} 
	
	public function actionAddOverTime(){
		$overTimeProc = new OverTimeProcess();
		$flage = false;
		$model = new OverTimeForm();
		if(isset($_POST['OverTimeForm'])){
			$items = $_POST['OverTimeForm'];
			$model->attributes = $_POST['OverTimeForm'];
			
			$employeeId = Yii::app()->session->get('employeeid');
			$requestedDate = $_POST['requestedDate'];
			$model->totalHour = $_POST['totalHour'];
			$status = AppConstant::STATUS_PENDING;
			$items = CJSON::decode($items);
			$createdBy = $employeeId;
			$flage = $overTimeProc->requestOverTime($employeeId, $requestedDate, $status, $items, $createdBy, $model);
			
		}
		echo CJSON::encode($flage);
	}
	
	public function actionAddOverTimeDetail(){
		$overTimeProc = new OverTimeProcess();
		
		if(isset($_POST['items'])){
			$items = $_POST['items'];
			$employeeId = Yii::app()->session->get('employeeid');
			$requestedDate = $_POST['requestedDate'];
			$totalHour = $_POST['totalHour'];
			$status = AppConstant::STATUS_PENDING;
			$items = CJSON::decode($items);
			$createdBy = $employeeId;
			$flage = $overTimeProc->requestOverTime($employeeId, $requestedDate, $totalHour, $status, $items, $createdBy);
			echo CJSON::encode($flage);
		}
	}
	
	public function actionOvertimeapproved(){
		$this->authenticate();
		$this->layout='//layouts/column2';
		$this->render('overtimeapproved');
	}
	public function actionGetOverTimeApproved(){
		$overTimeProc = new OverTimeProcess();
		$employeeId = Yii::app()->session->get('employeeid');
	//	$employeeId = 239;
		$data = $overTimeProc->getOverTimeApproved($employeeId);
		echo CJSON::encode($data);
	}
	
	public function actionOvertimeApprovaled(){
		$overTimeProc = new OverTimeProcess();
		$otId = 0;
		$employeeId = 0;
		$approvedNo = 0;
		$isFinal = false;
		$employeeApprovedId =0;
		if(isset($_POST['employee_ot_Id']))
			$otId = $_POST['employee_ot_Id'];
		if(isset($_POST['employee_id']))
			$employeeId = $_POST['employee_id'];
		if(isset($_POST['approved_no']))
			$approvedNo = $_POST['approved_no'];
		if(isset($_POST['is_final']))
			$isFinal = $_POST['is_final'];
		$employeeApprovedId = Yii::app()->session->get('employeeid');
		
		
		$flage = $overTimeProc->overTimeApprovaled($_POST['employee_ot_Id'], $employeeId, $employeeApprovedId, $approvedNo, $isFinal);
		echo CJSON::encode($flage);
	}
	
	public function actionGetOvertimeDetails(){
		$overtimeId  = 0;
		$overTimeProc = new OverTimeProcess();
		$employeeId = Yii::app()->session->get('employeeid');
		$ot = $overTimeProc->getOvertime($employeeId);
		if($ot != null)
			$overtimeId = $ot->id;
		$sql = "SELECT DISTINCT eo.employee_id, o.id, o.activity, DATE_FORMAT(o.ot_date, '%Y-%m-%d') AS ot_date, o.ot_type_id,
				o.timezone, o.from_time_am, o.to_time_am, o.from_time_pm, o.to_time_pm, o.num_of_hour, ot.type_name, 0 AS is_scan 
				FROM tbl_ot_detail o
				INNER JOIN tlkp_ot_type ot ON o.ot_type_id = ot.id
				INNER JOIN tbl_employee_ot eo ON o.ot_id = eo.id 
				WHERE o.ot_id = $overtimeId";
		echo CJSON::encode(Utils::exprotData($sql));
	}
	
	
	public function actionGetOvertimeDetailsForApproved(){
		$overTimeProc = new OverTimeProcess();
		$otId = 0;	
		if(isset($_POST['otId']))
			$otId = $_POST['otId'];
		echo CJSON::encode($overTimeProc->getOvertimeDetailsForApproved($otId));
	}
	
	public function actionOvertimeReject(){
		$overTimeProc = new OverTimeProcess();
		$otId = 0;
		$employeeId = 0;
		$approvedNo = 0;
		$rejectedBy =0;
		if(isset($_POST['employee_ot_Id']))
			$otId = $_POST['employee_ot_Id'];
		if(isset($_POST['employee_id']))
			$employeeId = $_POST['employee_id'];
		if(isset($_POST['approved_no']))
			$approvedNo = $_POST['approved_no'];

		$rejectedBy = Yii::app()->session->get('employeeid');
		
		
		$flage =$overTimeProc->rejectRequestOverTime($otId, $employeeId, $approvedNo, $rejectedBy);
		echo CJSON::encode($flage);
	}

	public function actionGetOvertimeRequestHistory(){
		
	}
}
?>
