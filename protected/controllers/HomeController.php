<?php
class HomeController extends Controller{
	
	public function action(){
		
	}
	public function actionIndex(){
		$signInForm = new SignInForm();
		# Collect Sign In Form input data
        if (isset($_POST['SignInForm'])) {
            $signInForm->attributes = $_POST['SignInForm'];
            $flag=null;
            if ($signInForm->validate()) {
                $sec = new Security();
                $flag = $sec->signIn($signInForm->username, $signInForm->password);
                $timeToLive = $signInForm->rememberMe == '1' ? 604800 : 0; 
                $session = new CDbHttpSession();
                //$session->getTimeout($timeToLive);
                //$session['message'] = $sec->getMessage();
                Yii::app()->user->setFlash('auth_message', $sec->getMessage());
				Yii::app()->session['flag'] = $flag;
                if ($flag==1) {
                	$session['first_name'] = $sec->getFirstName();
                	$session['last_name'] = $sec->getLastName();
                	$session['full_name'] = $sec->getFullName();
                	$session['is_authenticated'] = $sec->getIsAuthenticated();
                	$session['guid'] = $sec->getGuid();
                    if (isset($_GET['q_url']))
                    	  $this->redirect($this->createUrl($_GET['q_url']));
     			    else 
                   		$this->redirect($this->createUrl('/dashboard/'));
                } else {
                    $this->refresh();
                }
            }else{
            	  Yii::app()->user->setFlash('auth_message', "Incorrect username and password.");
            }
        }
		$this->render('index', array('signInForm' => $signInForm));
	}
	
	public function actionSignIn(){
		
		$signInForm = new SignInForm();
		# Collect Sign In Form input data
        if (isset($_POST['SignInForm'])) {
            $signInForm->attributes = $_POST['SignInForm'];
            $flag=null;
            if ($signInForm->validate()) {
                $sec = new Security();
                $flag = $sec->signIn($signInForm->email, $signInForm->password);
                //$timeToLive = $signInForm->rememberMe == '1' ? 604800 : 0; 
                $session = new CDbHttpSession();
                //$session->getTimeout($timeToLive);
                $session['message'] = $sec->getMessage();
                Yii::app()->user->setFlash('auth_message', $sec->getMessage());
                if ($flag==1) {
                	$session['first_name'] = $sec->getFirstName();
                	$session['last_name'] = $sec->getLastName();
                	$session['full_name'] = $sec->getFullName();
                	$session['is_authenticated'] = $sec->getIsAuthenticated();
                	$session['guid'] = $sec->getGuid();
                    if (isset($_GET['q_url']))
                    	  $this->redirect($this->createUrl($_GET['q_url']));
     			    else 
                   		$this->redirect($this->createUrl('/account/'));
                } else {
                    $this->refresh();
                }
            }else{
            	  Yii::app()->user->setFlash('auth_message', "Incorrect username and password.");
            }
        }
		$this->render('signIn', array('signInForm' => $signInForm));
	}

	public function actionSignOut(){
		Yii::app()->session->clear();
    	$this->redirect($this->createUrl('/home/?q=sign_in&sign_out=1'));
	}
}
?>