<?php
/**
 * Controller is the customized base controller class.
 * All controller classes for this application should extend from this base class.
 */
class Controller extends CController
{
    
   
	/**
	 * @var string the default layout for the controller view. Defaults to '//layouts/column1',
	 * meaning using a single column layout. See 'protected/views/layouts/column1.php'.
	 */
	public $layout='//layouts/column1';
    public $authenticated;
	/**
	 * @var array context menu items. This property will be assigned to {@link CMenu::items}.
	 */
	public $menu=array();
	/**
	 * @var array the breadcrumbs of the current page. The value of this property will
	 * be assigned to {@link CBreadcrumbs::links}. Please refer to {@link CBreadcrumbs::links}
	 * for more details on how to specify this property.
	 */
	public $breadcrumbs=array();
    
	 public function init(){
	    $this->authenticated = (bool)Yii::app()->session->get('is_authenticated');
        if(!$this->authenticated){
              $this->widget('ext.chart.Dialog', array(
                'url' => Yii::app()->baseUrl. '/dialog/DialogCategory',
                'id' => 'dddd',
                'title' => 'Categories',
                'columns' => array(
                    array('title' => 'id', 'field'=>'id', 'width'=> 10, 'sortable'=>true),
                    array('title' => 'Descr', 'field'=>'name', 'width'=> 10, 'sortable'=>true),
                        )
                ));
        }
    }

	public function authenticate(){
		$this->authenticated=(bool)Yii::app()->session->get('is_authenticated');
		if(!$this->authenticated) {
			$url = Yii::app()->getRequest()->requestUri;
		/*	$this->redirect($this->createUrl('/home/index/',
					array('q'=>'sign_in','auth'=>0,'q_url'=>$url)));*/
			//$urls = Yii::app()->getBaseUrl(true).'/home/signin/';	
			//$cs = Yii::app()->clientScript;
			//$cs->registerScript('my_script', "test('{$urls}');", CClientScript::POS_READY);
          
		}
	}
	
	public function getTopMenu(){
		$ui = new UserInterface();
		$module = null;
		if(isset($this->module))
			$module = $this->module->getName();
		# get controller name
		$controller = get_class($this);
		return $ui->getTopMenu($module, "");
	}
	
	public function getLeftMenu(){
		$ui = new UserInterface();
		# get controller name
	    $ui->getVerticalMenu();
	}
}