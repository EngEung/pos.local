<?php
/**
 * This capture is used for capturing application exception 
 * and redirect the user a friendly error notification pages
 * Date: 2012-09-23
 * 
 */
class ErrorLog extends CApplicationComponent {
	
	public function __construct() {
		
	}
	
	public function insert($e, $desc, $userId=null, $statusId=null) {
	    $rc = -1;
		$error = new Errors();
		$error->setAttributes(
			array(
			  'code' => $e->getCode(),
			  'msg' => Utils::encodeHtml($e->getMessage()),
			  'descr' => Utils::encodeHtml($desc),
			  'url' => Utils::encodeHtml($e->getFile()),
			  'trace' => Utils::encodeHtml($e->getTraceAsString()),
			  'error_status_id' => ($statusId == null ? 1 : $statusId),
			  'user_id' => $userId,
			  'line_num' => $e->getLine(),
			)
		);
		$error->save(false);
        // assign error to a responsible operation engineer
        // and send a notification email message to each of them
        if ($error == null || $error->id < 1) return $rc;
		$emails = array('sithkong@gmail.com','sk172online@gmail.com',);
        $userIds = array();
        $notification = new Notification();
        $tplName = 'MSG_TPL_ERROR_NOTIFICATION';
        $subject = 'Error Notification';
        for($i=0; $i<count($emails); $i++) {
           $user = Users::model()->findByAttributes(array('email' => $emails[$i]));    
           if ($user == null || $user->id < 1) continue;
           $userIds[] = $user->id;
           $kvParams = array(
                '#{FIRST_NAME}' => ucfirst($user->person->first_name),
                '#{LAST_NAME}' => ucfirst($user->person->last_name),
                '#{ERROR_TIMESTAMP}' => date("Y-m-d H:i:s"),
                '#{ERROR_CODE}' => $error->id,
                '#{ERROR_MSG}' => Utils::decodeHtml($error->msg),
                '#{ERROR_BACK_TRACE}' => Utils::decodeHtml($error->trace),
                '#{ERROR_PAGE_URL}' => Utils::decodeHtml($error->url),
                '#{ERROR_LINE_NUM}' => $error->line_num,
                '#{ERROR_SEVERITY_LEVEL}' => 'Critical',
                '#{ERROR_TYPE}' => 'Unknown',
                '#{USER_ID}' => $userId,
                '#{ERROR_STATUS}' => $error->error_status_id,
                '#{ENGINEER_FIRST_NAME}' => ucfirst($user->person->first_name),
                '#{ENGINEER_LAST_NAME}' => ucfirst($user->person->last_name),
                '#{ERROR_DESCRIPTION}' => Utils::decodeHtml($error->descr),
           );
           $notification->setFromName("Support Engineer Team");
           $notification->notify($tplName, $kvParams, $emails[$i], $subject);
        }
        $this->assign($error->id, $userIds);
		return $error->id;	
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