<?php 
/**
 * @author Sith Kong (Simon) <sithkong@gmail.com>
 * @version 1.0
 * Date: 2012-09-19
 * Copyright (c)2012 DataScience LLC
 */
class Security extends CApplicationComponent {
	/**
	 * Data members 
	 */
	 private $_firstName;
	 private $_lastName;
	 private $_fullName; 
	 private $_guid;
	 private $_validated;
	 private $_locked; 
	 private $_url;
	 private $_message;
	 private $_authenticated = false;
	 private $_admin_authenticated = false;
	 private $_error;
	 private $_isAdmin = false;
	 private $_roles;
	 
	 public function getRoles(){
	 	return $this->_roles;
	 }
	 
	 public function getIsAdmin() {
	 	return $this->_isAdmin;
	 }
	 public function getGuid() {
	 	return $this->_guid;
	 }
	 public function getIsAuthenticated() {
	 	return $this->_authenticated;
	 }
	 public function getIsAdminAuthenticated() {
	 	return $this->_admin_authenticated;
	 }
	 public function getFirstName() {
	 	return $this->_firstName;
	 }
	 public function getLastName() {
	 	return $this->_lastName;
	 }
	 public function getFullName() {
	 	return $this->_firstName.' '.$this->_lastName;
	 }
	 public function getMessage() {
	 	return $this->_message;
	 }
	 public function getUrl() {
	 	return $this->_url;
	 }
	 public function setUrl($url) {
	 	$this->_url = $url;
	 }
	/**
	 * Constructor
	 * Attempts to create and start the CDbHttpSession() object if it is not already started 
	 * I have specified the use of this session object in /conig/main.php
	 */
	public function __construct() {
		$this->_error =  new ErrorLog();
	}
	/**
	 * Checks if the current user has access to perform the specified process 
	 * @param integer $userId
	 * @param string $processName
	 * @return integer greater than 0 if the one has access; otherwise, -1
	 */
	public function checkProcessAccess($userId, $processName) {
		$c = 0; 
		$desc = "check process access"; 
		try {
			$cnc = Yii::app()->db;
			$cmd = new CDbCommand($cnc);
			$sql = "select count(distinct p.*) as c " 
                 . "from user_roles ur " 
                 . "inner join ps_roles pr on ur.role_id = pr.role_id "
                 . "inner join ps p on pr.ps_id = p.id " 
                 . "where ur.user_id = :user_id and p.name = :process_name "
                 . "and ur.active = true and pr.active = true and p.active = true";
                 
		    $cmd = $cnc->createCommand($sql);
			$cmd->bindParam(":user_id", $userId, PDO::PARAM_INT);
		    $cmd->bindParam(":process_name", $processName, PDO::PARAM_STR);
		    $dataReader = $cmd->query();
		    foreach ($dataReader as $row) {
		    	$c = $row['c'];
		    }
		} catch(CException $ex) {
			$this->_error->insert($ex, $desc);
		}
		return ($c > 0);	 
	}
	/**
	 * Checks if the current user has access to perform the specified task
	 * @param integer $userId
	 * @param string constant $taskName
	 * @return boolean true if has access; otherwise, false
	 */
	public function checkTaskAccess($userId, $taskName) {
		$c = 0;
		$desc = "check task access";
		try {
			$cnc = Yii::app()->db;
			$cmd = new CDbCommand($cnc);
			$sql = "select count(*) as c "
                 . "from tasks t inner join task_roles tr on t.id = tr.task_id " 
                 . "inner join user_roles ur on tr.role_id = ur.role_id "
                 . "where ur.user_id = :user_id "
                 . "and t.name = :task_name "
                 . "and t.active = true and tr.active = true and ur.active = true";      
		    $cmd = $cnc->createCommand($sql);
		    $cmd->bindParam(":user_id", $userId, PDO::PARAM_INT);
		    $cmd->bindParam(":task_name", $taskName, PDO::PARAM_STR);
		    $dataReader = $cmd->query();
		    foreach ($dataReader as $row) {
		    	$c = $row['c'];
		    }
		} catch(CException $ex) {
			$this->_error->insert($ex, $desc);
		}
		return ($c > 0);
	}
	
	public function checkUserHasRole($userGuid, $roleName) {
		$c = 0;
		$desc = "check if the current has the specified role";
		try {
			$cnc = Yii::app()->db;
			$cmd = new CDbCommand($cnc);
			$sql = "select count(r.id) as c from roles r "
			 . "inner join user_roles ur on r.id = ur.role_id " 
			 . "inner join users u on ur.user_id = u.id "
			 . "where u.guid = :guid " 
			 . "and r.name = :name;";
			$cmd = $cnc->createCommand($sql);
			$cmd->bindParam(":guid", $userGuid, PDO::PARAM_STR);
			$cmd->bindParam(":name", $roleName, PDO::PARAM_STR);
			$dataReader = $cmd->query();
			foreach ($dataReader as $row) {
				$c = $row['c'];
			}
		} catch(CException $ex) {
			$this->_error->insert($ex, $desc);
		}
		return ($c > 0);
	}
	
	
	/**
	 * Gets all assigned roles for the current user
	 * @param integer $userId
	 * @return CDataReader all the assigned roles for the current user
	 */
	public function getAssignedRoles($userId) {
		$dataReader=null;
		$desc = "get assigned roles";
		try {
		    $cnc = Yii::app()->db;
			$cmd = new CDbCommand($cnc);
			$sql = "select r.id, r.name, r.descr "
                 . "from user_roles ur inner join roles r on ur.role_id = r.id "
                 . "where ur.user_id = :user_id "
                 . "and ur.active = true and r.active = true";
	 		$cmd = $cnc->createCommand($sql);
	 	    $cmd->bindParam(":user_id", $userId, PDO::PARAM_INT);
	 	    $dataReader = $cmd->query();
		} catch(CException $ex) {
		   	$this->_error->insert($ex, $desc);
		}
 	   return $dataReader;
	}
	/**
	 * Gets all assigned groups for the current user
	 * @param integer $userId
	 * @return string array all the assigned groups for the current user 
	 */
	public function getAssignedGroups($userId) {
		$dataReader=null;
		$desc ="get assigned groups";
		try {
			$cnc = Yii::app()->db;
			$cmd = new CDbCommand($cnc);
			$sql = "select distinct g.id, g.name, g.descr "
                 . "from groups g inner join group_roles gr on g.id = gr.group_id "
                 . "inner join user_roles ur on gr.role_id = ur.role_id " 
                 . "where ur.user_id = :user_id and g.active = true";
			$cmd = $cnc->createCommand($sql);
			$cmd->bindParam(":user_id", $userId, PDO::PARAM_INT);
	 	    $dataReader = $cmd->query();
		} catch(CException $ex) {
			$this->_error->insert($ex, $desc);
		}
 	    return $dataReader;
	}
	/**
	 * Gets all the assigned processes for the current user
	 * @param integer $userId
	 * @return string array all the assigned processes for the current user
	 */
	public function getAssignedProcesses($userId) {
		$dataReader=null;
		$desc = "get assigned processes";
		try {
			$cnc = Yii::app()->db;
			$cmd = new CDbCommand($cnc);
			$sql = "select distinct p.id, p.name, p.descr "
                 . "from user_roles ur "
                 . "inner join ps_roles pr on ur.role_id = pr.role_id "
                 . "inner join ps p on pr.ps_id = p.id "
                 . "where ur.user_id = :user_id and p.active = true ";

			$cmd = $cnc->createCommand($sql);
			$cmd->bindParam(":user_id", $userId, PDO::PARAM_INT);
	 	    $dataReader = $cmd->query();
		} catch(CException $ex) {
			$this->_error->insert($ex, $desc);
		}
 	    return $dataReader;
	}
	/**
	 * Gets all the assigned tasks for the current user
	 * @param integer $userId
	 * @return string array all the assigned processes for the current user
	 */
	public function getAssignedTasks($userId) {
		$dataReader=null;
		$desc = "get assigned tasks";
		try {
		    $cnc = Yii::app()->db;
			$cmd = new CDbCommand($cnc);
			$sql = "select t.id, t.name, t.descr "
                 . "from tasks t inner join task_roles tr on t.id = tr.task_id " 
                 . "inner join user_roles ur on tr.role_id = ur.role_id "
                 . "where ur.user_id = :user_id "
                 . "and t.active = true";
	 		$cmd = $cnc->createCommand($sql);
	 		$cmd->bindParam(":user_id", $userId, PDO::PARAM_INT);
	 	    $dataReader = $cmd->query();
		 } catch(CException $ex) {
			$this->_error->insert($ex, $desc);
		 }
 	     return $dataReader;
	}
    
    public function getDefaultRoleId() {
       $name='R_CUSTOMER';
       $role=Roles::model()->findByAttributes(array('name' => $name));
       if($role == null) return -1;
       return $role->id;
    }
	/**
	 * Creates a new user account when user join the web application
	 * Full name, Email, Password, Default Role
	 * Yii::app()->db->getLastInsertId(), $modelInstance->id, $modelInstance->getPrimaryKey()
	 * @param string $firstName first name 
	 * @param string $lastName last name
	 * @param string $middleName optional middle name 
	 * @param string $email email address
	 * @param string $username username
	 * @param string $passwd password 
	 * @param string saltedPasswed salted password 
	 * @param integer $roleId role id 
	 * @return -1 for failure, 1 for success, 2 username is taken, 3 account is already exists
	 */
	public function createUserAccount($firstName,$lastName,$email,$passwd,$roleId=null,$middleName=null) {
		$comments = "create user account\n";
		$rc = -1;
        
		if(strlen($firstName) == 0 || strlen($lastName) == 0 
		  || strlen($email) == 0 
          || strlen($passwd) == 0) return $rc;
          
        if ($roleId == null || $roleId < 1)
           $roleId = $this->getDefaultRoleId();
     
		$cnc = Yii::app()->db;	
		$tran = $cnc->beginTransaction();
		try {				
		  $comments .= "check if user exists username/email is taken\n";
		  $_user = Users::model()->findByAttributes(array('email' => $email));
		  if ($_user != null  
		      && strcasecmp($firstName, $_user->person->first_name) == 0
              && strcasecmp($lastName, $_user->person->last_name) == 0
              && strcasecmp( $email, $_user->email) == 0) {
              return 3;
          } elseif ($_user != null && strcasecmp( $email, $_user->email) == 0) {
              return 2; 
          }
		  $comments .= "create a new person\n";
		  $person = new People();
		  $person->setAttributes(
		  	array(
		  		'first_name' => ucfirst(strtolower($firstName)),
		  		'last_name' => ucfirst(strtolower($lastName)),
		  		'middle_name' => (strlen($middleName) > 0) ? ucfirst(strtolower($middleName)) : null,
		  	)
		  );
		  $person->save(false);
		  if ($person->id < 1) $tran->rollBack();
		  $comments .= "create a new user\n";
		  $user = new Users();
          $now = date("Y-m-d H:i:s");
		  $user->setAttributes(
		  	array(
		  		'email' => strtolower($email),
		  		'username' => strtolower(substr($email, 0, strpos($email, '@'))),
		  		'passwd' => md5($passwd),
		  		'salted_passwd' => Utils::createSaltedPassword(md5($passwd)),
		  		'person_id' => $person->id, 
		  		'validation_code' => Utils::createGuid(false),
		  		'guid' => Utils::createGuid(false),
		  	)
		  );
		  $user->save(false);
		  if($user->id < 0) $tran->rollBack();
		  $comments .= "create user role mapping.\n";
		  $userRole = new UserRoles();
		  $userRole->setAttributes(
		  	array(
				'role_id' => $roleId,
				'user_id' => $user->id,
			)
		  );
		  $userRole->save(false);
		  if($userRole->id < 0 ) $tran->rollBack();
          $comments = "send email confirmation of account creation\n";
          $flag = $this->notifyUser('MSG_TPL_ACCOUNT_CREATION', $user->id, $passwd);
		  $comments = "commit transaction and return the returned code\n";
		  if($flag) $rc=1;
		  $tran->commit();
		} catch(CException $ex) {
			$this->_error->insert($ex, $comments);
			$tran->rollBack();
		}
		return $rc;
	}
    /**
     * Sends confirmation email to the user. The email contains account information
     * and validation codes.
     * @param string $msgTplName the message template name.
     * @param integer $userId the current user ID.
     * @param string $clearTextPasswd the user password for displaying masks
     * @return boolean true if sending successfully; otherwise false. 
     */
    public function notifyUser($msgTplName, $userId, $clearTextPasswd=null) {
        $flag = false;
        if (strlen($msgTplName) < 1 || $userId < 1) return $flag;
        $user = Users::model()->findByAttributes(array('id' => $userId));
        if ($user == null) return $flag;
        $notification = new Notification();
        $secret = ($clearTextPasswd != null) ? str_repeat('*', strlen($clearTextPasswd)) : str_repeat('*', 8);
        switch($msgTplName) {
            case 'MSG_TPL_ACCOUNT_CREATION': {
                $kvParams = array(
                    '#{FIRST_NAME}' => ucfirst($user->person->first_name),
                    '#{LAST_NAME}' => ucfirst($user->person->last_name),
                    '#{USERNAME}' => $user->email,
                    '#{MASKED_PASSWORD}' => $secret,
                    '#{APP_URL}' => AppConstant::APP_URL,
                    '#{VALIDATION_CODE}' => $user->validation_code,
                );
               $notification->setFromName("Customer Relationship Team");
               $flag = $notification->notify($msgTplName, $kvParams, $user->email, "Account Information");
               break;
            }
            case 'MSG_TPL_VALIDATION_CODE_REQUEST': {
                $kvParams = array(
                    '#{FIRST_NAME}' => ucfirst($user->person->first_name),
                    '#{LAST_NAME}' => ucfirst($user->person->last_name),
                    '#{APP_URL}' => Utils::APP_URL,
                    '#{VALIDATION_CODE}' => $user->validation_code,                 
                );
                $notification->setFromName("Customer Relationship Team");
                $flag = $notification->notify($msgTplName, $kvParams, $user->email, "Validation Code Information");
                break;
            }
            case 'MSG_TPL_ACCOUNT_INFORMATION_CHANGE': {
                $kvParams = array(
                    '#{FIRST_NAME}' => ucfirst($user->person->first_name),
                    '#{LAST_NAME}' => ucfirst($user->person->last_name),
                    '#{ACCOUNT_UPDATED_AT}' => date('Y-m-d H:m:s'),
                    '#{EMERGENCY_PHONE_NUMBER}' => AppConstant::EMERGENCY_PHONE_NUMBER,
                    '#{EMERGENCY_LIVE_CHAT_URL}' => AppConstant::EMERGENCY_LIVE_CHAT_URL,
                    '#{USERNAME}' => $user->email,
                    '#{MASKED_PASSWORD}' => $secret,
                );
                $notification->setFromName("Support Engineer Team");
                $flag = $notification->notify($msgTplName, $kvParams, $user->email, "Account Change Notification");
                break;
            }
            case 'MSG_TPL_ACCOUNT_RECOVERY': {
                $kvParams = array(
                    '#{FIRST_NAME}' => ucfirst($user->person->first_name),
                    '#{LAST_NAME}' => ucfirst($user->person->last_name),
                    '#{REQUESTED_RESET_AT}' => date('Y-m-d H:m:s'),
                    '#{APP_URL}' => AppConstant::APP_URL,
                    '#{ACCOUNT_RECOVERY_URL}' => Utils::APP_SECURITY_URL.'?rc='.$user->recovery_code,
                );
                $notification->setFromName("Support Engineer Team");
                $flag = $notification->notify($msgTplName, $kvParams, $user->email, "Account Recovery");
                break;
            }
        }
        return $flag;
    }

	/**
	 * Deactivate a user's account
	 * @param boolean $flag defaults false
	 * @return true for a success; otherwise, false 
	 */
	public function deactivateUserAccount($userId, $flag = false) {
		$comments = "deactivate user account";
		$success=false;
		$cnc = Yii::app()->db;	
		$tran = $cnc->beginTransaction();
		try {
          $comments .= "deactivate the user & person\n";				
		  $user = Users::model()->findByPk($userId);			
		  if ($user == null ) $tran->rollBack();
          $user->setAttributes(array(
            'active' => $flag,
            'modified_at' => new CDbExpression('NOW()'),
          ));
		  $success = $user->save(false);
          $person = People::model()->findByPk($user->person_id); 		
          $person->setAttributes(array(
            'active' => $flag,
            'modified_at' => new CDbExpression('NOW()'),
          ));
          $success = $person->save(false);
		  $comments .= "deactivate user roles\n";
		  $userRoles = UserRoles::model()->findAllByAttributes(array('user_id' => $user->id));
		  if($userRoles != null && count($userRoles) > 0 ) {
		  	foreach($userRoles as $userRole) {
		  		 $userRole->setAttributes(array(
                    'active' => $flag,
                    'modified_at' => new CDbExpression('NOW()'),
                  ));	
				 $success = $userRole->save(false);	
		  	}
		  }
		  $comments .= "deactivate the user addresses\n";
		  $userAddresses = UserAddresses::model()->findAllByAttributes(array('user_id' => $user->id));
		  if ($userAddresses != null) {
		    foreach($userAddresses as $ua) {
    		  	$ua->setAttributes(array(
                    'active' => $flag,
                    'modified_at' => new CDbExpression('NOW()'),
                ));
    		  	$success = $ua->save(false);
            }
		  }
		  $comments .= "deactivate the emails\n";
		  $emails = Emails::model()->findAllByAttributes(array('user_id' => $user->id));
		  if($emails != null && count($emails) > 0 ) {
		  		foreach($emails as $email) {
		  			$email->setAttributes(array(
                        'active' => $flag,
                        'modified_at' => new CDbExpression('NOW()'),
                    ));
					$success = $email->save(false);
		  		}
		  }
		 $comments .= "deactivate the images\n"; 
		 $images = Images::model()->findAllByAttributes(array('user_id' => $user->id));
		 if ($images != null && count($images) > 0) {
		 	foreach($images as $image) {
		 		$image->setAttributes(array(
                    'active' => $flag,
                    'modified_at' => new CDbExpression('NOW()'),
                ));
				$success = $image->save(false);	
		 	}
		 }
		 $comments .= "deactivate the phones\n"; 
		 $phones = Phones::model()->findAllByAttributes(array('user_id' => $user->id));
		 if ($phones != null && count($phones) > 0 ) {
		 	foreach($phones as $phone) {
		 		$phone->setAttributes(array(
                    'active' => $flag,
                    'modified_at' => new CDbExpression('NOW()'),
                ));
				$success = $phone->save(false);
		 	}
		 }
         $comments .= "deactivate the faxes\n";
         $faxes = Faxes::model()->findAllByAttributes(array('user_id' => $user->id));
         if ($faxes != null && count($faxes) > 0) {
             foreach($faxes as $fax) {
                $fax->setAttributes(array(
                    'active' => $flag,
                    'modified_at' => new CDbExpression('NOW()'),
                ));
                $success = $fax->save(false);
             }
         }
         $tran->commit();
	  } catch(CException $ex) {
	 	$this->_error->insert($ex, $comments);
		$tran->rollBack();
	  }
	  return $success;
	}
	/**
	 * Check if the user has registered and her account is not locked, validated, and active
	 * @param string $username email or username
	 * @param string $passwd secret passcode
     * @param integer $duration the duration of remember me  in minutes
	 * @return boolean $flag 0 cannot authenticate which means incorrect username and password, 1 authenticated, 
	 * 2 not validated, 3 locked, 4 expired, 5 deactivated  
     * -2 incorrect password
     * -1 incorrect username
	 */
	 public function authenticate($username, $passwd, $duration=0) {
		$flag=0;
		$comments = "authenticate a user using email/username and password\n";
		try {
			$criteria = new CDbCriteria();
			$criteria->condition = 'passwd=md5(:passwd) and (email = :username or username = :username)'; 
			//$criteria->condition = 'salted_passwd=:passwd and (email = :username or username = :username)';
			$criteria->params = array(':passwd'=>$passwd,':username'=>$username);
			$user=Users::model()->find($criteria);
            $comments .= "attempt to unlock the locked account that has no attempt in the last 15 minutes\n";
            $this->autoUnlockAccount($username);
			if ($user == null ) {
			  $comments .= "check if username/email is matched\n";
			  $criteria->condition = 'email = :username or username = :username';
              $criteria->params = array(':username'=>$username);
              $user=Users::model()->find($criteria);
              if($user != null) {
                  $user->setAttributes(array('failed_attempt_at' => new CDbExpression('NOW()'),)); 
                  $user->save(false);           
                  return -2; // incorrect password
              } 
			  $comments .= "check if password is matched\n";  
              $criteria->condition = 'passwd=md5(:passwd)';
              $criteria->params = array(':passwd'=>$passwd);
              $user=Users::model()->find($criteria);
              if ($user != null) {
                  $user->setAttributes(array('failed_attempt_at' => new CDbExpression('NOW()'),)); 
                  $user->save(false);       
                  return -1; // incorrect username;
              }
              return $flag;  
			} 
			if (!$user->validated) return 2;
			if ($user->locked) return 3;
			if ($user->expired) return 4;
			if (!$user->active) return 5;
			$user->setAttributes(
				array('last_login_at' => new CDbExpression('NOW()'),)
			);
			$user->save(false);
            $comments .= "do not stored password, user_id, and salted password in session variable\n";
            $comments .= "the user is uniquly identified by guid\n";
            if ($user) {
            	$this->_guid = $user->guid;
            	$this->_validated = $user->validated;
            	$this->_locked = $user->locked;
				$this->_roles = $this->getRolesToString($user->id);
            	$person = People::model()->findByAttributes(array('id' => $user->person_id));
            	if ($person != null) {
            		$this->_firstName = ucfirst($person->first_name);
            		$this->_lastName  = ucfirst($person->last_name);
            	}
            	// check if the user has admin role 
            	$this->_isAdmin = $this->checkUserHasRole($user->guid, AppConstant::R_AMDIN);
            }
		} catch(CException $ex) {
			$this->_error->insert($ex, $comments);
		}
		return 1;
	}
	
	/**
	 * Validates that the registered email or phone is correct 
	 * @param string $code validated code sent through mobile phone or email
	 * @return integer 0 for cannot validated because of incorrect validation code, 
	 * 1 validated successfully, 2 cannot validated 
	 * because the reset password link/code is expired, 3 already validated
	 */
	public function validate($code) {
		$comments = "validate the user account using validation code\n";
		$flag = false;
		try {
			if (strlen($code) < 1 || $code == null) return $flag;
			$user = Users::model()->findByAttributes(array('validation_code'=>$code));
			if ($user == null) return $flag;
			$now=strtotime(date('Y-m-d H:m:s'));
			$requestedAt=strtotime($user->created_at);  
			$span = $now - $requestedAt;
			$day=0;
	 		if ($span >= 60) {
	 			$min = (int)($span/60);
				if ($min >= 60) {
					$hr = (int)($min/60);
					if ($hr >= 24) { $day=(int)($hr/24); }
				}
	 		}
            $comments .= "validation code is expired after 14 days\n";
			if($day > 14) return 2; 
			if ($user->validated) { return 3; }
			$user->setAttributes(
				array(
					'validated' => true,
					'modified_at' => new CDbExpression('NOW()'),
				)
			);	
			$user->save(false);
		} catch(CException $ex) {
			$this->_error->insert($ex, $desc);	
		}
		return 1;
	}
    /**
     * Unlocks user account after there is no failed attempt in the last 15 minutes
     * @param string $username the username/email of the user
     * @return true if unlocked successfully; otherwise false.
     */
    public function autoUnlockAccount($username) {
        $flag = false;
        $criteria = new CDbCriteria();
        $criteria->condition='email = :username or username = :username'; 
        $criteria->params=array(':username'=>$username);
        $user=Users::model()->find($criteria);
        if ($user == null) return $flag;
        $comments = "if the account is locked attempt to unlocked it\n";
        $comments .= "if the there is not failed attempt in the last 15 minutes.\n";
        if ($user->locked) {
            $now=strtotime(date('Y-m-d H:m:s'));
            $failed_attempt_at = strtotime($user->failed_attempt_at);
            $span = $now - $failed_attempt_at;
            if ($span > 60) {
                $min = (int)($span/60);
                if ($min > 15) {
                    $user->setAttributes(array(
                        'locked' => false,
                        'failed_attempt' => 0,
                        'modified_at' => new CDbExpression('NOW()'),
                    ));
                    $flag = $user->save(false);
                }
            }     
        }
        return $flag;
    }

    /**
     * Locks the user account if the there are 5 or more failed attempt incremented.
     * @param string $username the username/email of the user
     * @return boolean true if the account got lucked; otherwise false 
     */
	public function lockAccount($username) {
		$locked = false;
		$comments ="lock the user account\n";
		try {
			$criteria = new CDbCriteria();
			$criteria->condition='email = :username or username = :username'; 
			$criteria->params=array(':username'=>$username);
			$user=Users::model()->find($criteria);
			if ($user == null) return $locked;
			if ($user->failed_attempt >= 5) {
				$locked = true;
				$user->setAttributes(
					array('locked' => true,
						  'locked_at' => new CDbExpression('NOW()'),
				    )
				);
				$user->save(false);
			} 
		} catch(CException $ex) {
			$this->_error->insert($ex, $comments);
		}
		return $locked;
	}
	/**
     * Before check the failed attempt we need to 
     * check if time span between failed login attempt is 
     * less than or equal to 15 minutes
     * @param string $username the username or email of user who is attempting to sign in
     * @return boolean true if increments or false if ignores
     */
	public function checkFailedAttempt($username) {
		$flag=false;
		$comments = "increment failed attempt\n";
		try {
			$criteria = new CDbCriteria();
			$criteria->condition='email = :username or username = :username'; 
			$criteria->params=array(':username'=>$username);
			$user = Users::model()->find($criteria);
            if ($user === null) return $flag;
			$failedAttempt = ($user->failed_attempt == null) ? 0 : $user->failed_attempt;
			if($user != null) {
			    $now=strtotime(date('Y-m-d H:m:s'));
                $failed_attempt_at = strtotime($user->failed_attempt_at);
                $span = $now - $failed_attempt_at;
                if ($span > 60) {
                    $min = (int)($span/60);
                    if ($min <= 15) {
                        $failedAttempt++;
                        $user->setAttributes(array(
                          'failed_attempt' => $failedAttempt,
                          'modified_at' => new CDbExpression('NOW()'),
                         ));
                        $user->save(false);
                        $this->lockAccount($username);
                        $flag=true;
                    } else {
                        $user->setAttributes(array(
                          'failed_attempt' => 1,
                          'modified_at' => new CDbExpression('NOW()'),
                         ));
                        $user->save(false);
                    }
                }
			}
		} catch(CException $ex) {
			$this->_error->insert($ex, $comments);
		}
		return $flag;			
	}
    /**
     * Signs the user in using email/username and password. There is no 
     * target URL specify, the system will redirect the user to my account page. 
     * @param string $username the email/username of the user.
     * @param string $passwd the user password.
     * @param integer $duration the timeout duration in minutes.
     * @param string $url the target URL after signning in.
     * @return void 
     */
	public function signIn($username, $passwd, $duration=0) {
		$comments = "sign in using username/email and password";
		$flag = null;
		try {
			$flag = $this->authenticate($username, $passwd, $duration);
			$msg = "";
			switch($flag) {
                case -1:
                    $msg = "Incorrect username. Please try again";
                    break;
                case -2: 
                    $msg = "Incorrect password. Please try again";
                    $this->checkFailedAttempt($username);
				case 0: 
					$msg = "Incorrect username and password. Please sign up to create an account."; 
					break;			
				case 1: {
					$msg = "You have signed in successfully.";
					//if ($this->_isAdmin) 
					//	$this->_admin_authenticated = true;
					//else 
						$this->_authenticated = true;
					break;
				}
				case 2: $msg = "Your account has not been validated."; break;
				case 3: $msg = "Your account has been locked."; break;
				case 4: $msg = "Your password has expired. Please change your password."; break;
				case 5: $msg = "Your account is not active."; break;
			}
			$comments .= "save msg and flag session variables\n";
			$this->_message = $msg;
		} catch(CException $ex) {
			$this->_error->insert($ex, $comments);
		}
		return $flag;
	}
    /**
     * Gets security questions by user email address.
     * When displaying the questions, we need to decode the HTML.
     * @param string $email the user email address. 
     * @return instances of security questions for success; otherwise null.
     */
    public function getSecQuestions($email) {
        $flag = null;
        $comments = "get security questions by a user email\n";
        $questions = null;
        try {
            if (strlen($email) < 1) return $flag;
            $user = Users::model()->findByAttributes(array('email' => $email));
            if ($user == null) return $flag;
            $questions = SecQuestions::model()->findAllByAttributes(array('user_id' => $user->id));
        } catch(CException $ex) {
            $this->_error->insert($ex, $comments);
        }
        return $questions;
    }
    /**
     * Saves the security questions for a user.
     * @param string array $questions the index array of questions 
     * where each element is html encoded.
     * @return true for successfully saved; otherwise false.
     */
    public function saveSecQuestions($questions, $userId) {
        $comments = "save security questions and user ID.\n";
        $flag = false;
        try {
            if (count($questions) < 1 || $userId < 1) return $flag;
            for($i=0;$i<count($questions);$i++) {
                $q = new SecQuestions();
                $q->setAttributes(array(
                    'name' => Utils::encodeHtml($questions[$i]),
                    'user_id' => $userId,
                ));
                $flag = $q->save(false);
            }
        } catch(CException $ex) {
            $this->_error->insert($ex, $comments);
        }
        return $flag;
    }
    /**
     * Saves security answers with associated question IDs and user ID.
     * @param string associated array $qIdAnswerNames where key is question ID and value 
     * security answer name.
     * @param integer $userId the user ID.
     * @return boolean true for successfully saved; otherwise false. 
     */
    public function saveSecAnswers($qIdAnswerNames, $userId) {
        $comments = "save security answers with user ID.\n";
        $flag = false;
        try {
            if (!is_array($qIdAnswerNames) 
               || count($qIdAnswerNames) < 1
               || $userId < 1) return $flag;
            foreach($qIdAnswerNames as $qId => $name) {
                $a = new SecAnswers();
                $a->setAttributes(array(
                    'sec_question_id' => $qId,
                    'name' => strtolower($name),
                    'user_id' => $userId,
                ));
                $flag = $a->save(false);
            } 
        } catch(CException $ex) {
            $this->_error->insert($ex, $comments);
        }
        return $flag;
    }
    
    /**
     * Recovers the user account by email, security question and answer.
     * @param string $email the user's email address associated with the account
     * @param integer $secQuestionId the security question to be answered.
     * @param string $secAnswerName the security answer for the question asked.
     * @return boolean true for successfully found the security and send to provided email address
     * ; otherwise, false.  
     */
    public function recoverAccount($email,$secQuestionId, $secAnswerName) {
        $comments = "recover the user account by the email and a security question and an answer\n";
        $flag = false;
        try {
            if (strlen($email) < 1 || $secQuestionId < 1 || strlen($secAnswerName) < 1) return $flag;
            $user = Users::model()->findByAttributes(array('email' => $email));
            if ($email==null) return $flag;
            $a = SecAnswers::model()->findByAttributes(array(
                'sec_question_id' => $secQuestionId,
                'user_id' => $user->id,
                'name' => strtolower($secAnswerName),
             ));
            if ($a==null) return $flag;
            $comments .= "timestamp the request reset at\n";
            $comments .= "create recovery code for the account\n";
            $user->setAttributes(array(
                'request_reset_at' => new CDbExpression('NOW()'),
                'modified_at' => new CDbExpression('NOW()'),
                'recovery_code' => Utils::createGuid(false),
            ));
            $flag = $user->save(false);
            $comments .= "security account is found so send reset password URL to the user\n";
            $flag = $this->notifyUser('MSG_TPL_ACCOUNT_RECOVERY', $user->id);
        } catch(CException $ex) {
            $this->_error->insert($ex, $comments);
        }
        return $flag;
    }
    /**
     * Recovers a forgotten password for an account. Sends and a confirmation email
     * to notify the user that the password has updated/changed.
     * @param string $recoveryCode the recovery code sent to the user's email.
     * @param string $email the user's email address associated with the account.
     * @param string $newPasswd the user's requested new password.
     * @return integer 1 for successfully reset password; -1 for failure, and 
     * -2 for reset password link is expired. 
     */
    public function resetPasswd($recoveryCode, $email, $newPasswd) {
        $comments = "reset a forgotten password with a new one.\n";
        $rc = -1;
        if(strlen($rc) < 1 || strlen($email) < 1) return $rc;
        try {
            $comments .= "verify that the the resetting password link has not expired.\n";
            $user = Users::model()->findByAttributes(array(
                'email' => $email,
                'recovery_code' => $recoveryCode,
            ));
            if ($user==null) return $rc;
            $now=strtotime(date('Y-m-d H:m:s'));
            $requestResetAt = strtotime($user->request_reset_at);
            $span = $now - $requestResetAt;
            $day=0;
            if ($span >= 60) {
                $min = (int)($span/60);
                if ($min >= 60) {
                    $hr = (int)($min/60);
                    if ($hr >= 24) { $day=(int)($hr/24); }
                }
            }
            $comments .= "verify that reset password link is not expired.\n";
            if($day > 14) return -2; 
            $comments .= "reset the new password.\n";
            $user->setAttributes(array(
                  'passwd' => md5($newPasswd),
                  'salted_passwd' => md5($newPasswd.date('Y-m-d H:m:s')),
                  'modified_at' => new CDbExpression('NOW()'),
            ));
            if(!$user->save(false)) return $rc;
            $comments .= "send password changed confirmation email.\n";
            $flag = $this->notifyUser('MSG_TPL_ACCOUNT_INFORMATION_CHANGE', $user->id);
            if($flag) $rc = 1;
        } catch(CException $ex) {
            $this->_error->insert($ex, $comments);
        }
        return $rc;
    }
    /**
     * Resends the validation codes if the user request a new one. 
     * In the event that the user fails to validate his/her account in the period of 2 weeks,
     * the validation code link/URL get expired. The user need to request a new one.
     * @param string $email the user's email address.
     * @return boolean true for successfully send the new validation code to specified email.  
     */
    public function resendValicationCode($email) {
        $flag = false;
        if (strlen($email) < 1) return $flag;
        try {
            $user = Users::model()->findByAttributes(array('email' => $email));
            if ($user == null) return $flag;
            $user->setAttributes(array(
                'validation_code' => Utils::createGuid(false),
                'created_at' => new CDbExpression('NOW()'),
                'modified_at' => new CDbExpression('NOW()'),
            ));  
            if($user->save(false)) {
                $flag = $this->notifyUser('MSG_TPL_VALIDATION_CODE_REQUEST', $user->id);
            }  
        } catch(CException $ex) {
            $this->_error->insert($ex, $comments);
        }
        return $flag;
    }
    
    /**
     * Resets the user password. There is a need to check the 
     * @param string $email the user's email address
     * @param string $passwd the user's new password
     * @param string $oldPasswd the user's old password
     * @return boolean true for successfully reset password; otherwise false.  
     */
    public function changePasswd($email, $passwd, $oldPasswd) {
       $comments = "reset the user password\n";
       $flag = false;
       try {
           $user = Users::model()->findByAttributes(array(
             'email' => $email, 'passwd' => md5($oldPasswd),
           ));
           if($user == null) return $flag;
           $user->setAttributes(array(
              'passwd' => md5($passwd),
              'salted_passwd' => md5($passwd.date('Y-m-d H:m:s')),
              'modified_at' => new CDbExpression('NOW()'),
           ));
           $flag = $user->save(false);
       } catch(CException $ex) {
            $this->_error->insert($ex, $comments);
       }
       return $flag;
    }
    /**
     * Changes username for a user.
     * @param string $email the user's email address.
     * @param string $username the new username requested.
     * @param string $passwd the user's password.
     * @param string $oldUsername the user's old username.
     * @return 1 for success; -1 for failture, and 2 for requested username is taken. 
     */
    public function changeUsername($email, $username, $passwd, $oldUsername) {
        $comments = "change the username for the user.\n";
        $rc = -1;
        if (strlen($email) < 1 || strlen($username) < 1
           || strlen($passwd) < 1 || strlen($oldUsername) < 1) return $rc;
        try {
            $comments .= "verify if the requested username is taken.\n";
            $user = Users::model()->findByAttributes(array('username' => $username));
            if ($user != null) return 2; 
            $user = Users::model()->findByAttributes(array(
               'email' => $email, 'username' => $oldUsername,
               'passwd' => md5($passwd),
            ));
            if ($user == null) return $rc;
            $user->setAttributes(array(
                'username' => $username,
            ));
            if($user->save(false)) $rc = 1;
        } catch(CException $ex) {
            $this->_error->insert($ex, $comments);
        }
        return $rc;
    }
    /**
     * Gets security questions by the user's phone number.
     * @param string $phoneNum the phone number of the user.
     * @return array of security question objects. 
     */
    public function getSecQuestionsByPhone($phoneNum) {
        $flag = null;
        $comments = "get security questions by a user's phone.\n";
        $questions = null;
        try {
            $cleanedPhoneNum = Utils::cleanUpPhoneNumber($phoneNum);
            if (strlen($phoneNum) < 1) return $flag;
            $phone = Phones::model()->findByAttributes(array('number' => $cleanedPhoneNum));
            if ($phone == null) return $flag;
            $user = Users::model()->findByAttributes(array('id' => $phone->user_id));
            if ($user == null) return $flag;
            $questions = SecQuestions::model()->findAllByAttributes(array('user_id' => $user->id));
        } catch(CException $ex) {
            $this->_error->insert($ex, $comments);
        }
        return $questions;
    }
    
    /**
     * If the user lost both username and password, and if the user 
     * has setup security questions and answers and provided the phone number 
     * for the account. The user can recover both username and reset password 
     * for the account. phone => User => Secuity Question => Security Answer
     * Even if the user might have multiple security questions, we will ask only one 
     * question.
     * @param integer $secQuestionId the security questeion ID. 
     * @param string $secAnswerName the security answer.
     * @param strinng $phoneNum the user's phone number associated with the account 
     * @return object for a success; otherwise null.
     */
    public function recoverAccountByPhone($secQuestionId, $secAnswerName, $phoneNum) {
        $comments = "recover the user account by phone number.\n";
        $flag = false;
        $user = null;
        if ($secQuestionId < 1 || strlen($secAnswerName) < 1
           || strlen($phoneNum) < 1) return $flag;
        try {
            $cleanedPhoneNum = Utils::cleanUpPhoneNumber($phoneNum);
            $phone = Phones::model()->findByAttributes(array('number' => $cleanedPhoneNum));
            if($phone == null) return $flag;
            $user = Users::model()->findByAttributes(array('id' => $phone->user_id));
            if($user == null) return $flag;
            $a = SecAnswers::model()->findByAttributes(array(
                'sec_question_id' => $secQuestionId,
                'user_id' => $user->id,
                'name' => strtolower($secAnswerName),
            ));
            if ($a == null) return $flag;
            $flag = $a->save(false);
            $comments .= "generate recovery code for the account and timestamp the action\n";
            $comments .= "should display the email/user to the user and send the user reset password link\n";
            $user->setAttributes(array(
                'request_reset_at' => new CDbExpression('NOW()'),
                'modified_at' => new CDbExpression('NOW()'),
                'recovery_code' => Utils::createGuid(false),
            ));
            $flag = $user->save(false);
            $comments .= "security account is found so send reset password URL to the user\n";
            $flag = $this->notifyUser('MSG_TPL_ACCOUNT_RECOVERY', $user->id);
        } catch(CException $ex) {
            $this->_error->insert($ex, $comments);
        }
        if($flag == true)
            return $user;
        else 
            return null;
    }

	public function getRolesByUserId($userId){
		try{
			return UserRoles::model()->findAll(
			 array('condition' => 'user_id = :userId ',
			 		'params' => array(':userId' => $userId)
			 )
			);
		}catch(CExecption $e){
			echo($e);
		}
	}
	
	public function getRolesToString($userId){
		$dataReader = $this->getRolesByUserId($userId);
		$str = "";
		foreach($dataReader  as $row){
			$str .="$row->role_id, ";
		}
		$str = substr($str, 0, -2);
		return $str;
	}
        
        
}

















