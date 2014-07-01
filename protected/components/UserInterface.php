<?php

class UserInterface extends CApplicationComponent{
	/*
	 * Gets menu by parent ID and role ID
     * @param string $name - the menu type name
     * @return menu populated in the dataReader 
	 */
	public function getMenu($parentId,$roleId, $menuType){
		$dataReader = null;
    	$desc = "get menu by name";
    	try {
    		$cnc = Yii::app()->db;
    		$cmd = new CDbCommand($cnc);
			$sql = "select DISTINCT m.*,mr.role_id 
					from menus m
					inner join menu_roles mr on m.id = mr.menu_id
					inner join menu_types mt on m.menu_type_id = mt.id
		    		where m.parent_id = :parentId and mr.role_id in (:roleId) 
					and m.active = true and mr.active= true and mt.name = :menuType
					order by m.order_num asc";
			
    		$cmd = $cnc->createCommand($sql);
    		$cmd->bindParam(":parentId", $parentId, PDO::PARAM_INT);
			$cmd->bindParam(":roleId", $roleId, PDO::PARAM_INT);
			$cmd->bindParam(":menuType", $menuType, PDO::PARAM_STR);
    		$dataReader = $cmd->query();
    	} catch(CException $ex) {
    		//$this->_error->insert($ex, $desc);
    	}
    	return $dataReader;
	}

	/**
	 * Get top menus
	 * @return array 
	 */
	public function getTopMenu($moduleSelected = null, $controllerSelected = null){
		$session = Yii::app()->session;
		
    	$isAuthenticated = (bool)$session->get('is_authenticated');
    	$fullName = '';
    	$roleIds = 0;
    	if($isAuthenticated){
    		$fullName 	= $session->get('full_name');
			$roleIds = $session->get('roles');
		}
		$dataReader = $this->getMenu(0, $roleIds, AppConstant::MENU_HORIZONTAL_MENU);
    	$menuArray = array();
    	if(strlen($fullName) != 0 && $isAuthenticated == true){
    		
    		#menu top the right such as fullname and signout
			$menuArrayRight= array('class'=>'bootstrap.widgets.TbMenu', 
								'htmlOptions' => array('class' => 'pull-right'),
								'items'=>array(array('label' => "Hello: $fullName", 'url'=>'#','itemOptions' => array('style' => 'margin-right:-25px;')),
											   array('label' => "| sign out", 'url'=>Yii::app()->request->baseUrl.'/home/signout/'))
						);
						
			#menu top the left
    		$menuArrayLeft = array();
			foreach($dataReader as $row){
				$id 		= $row['id'];
				$name 		= $row['name'];
				$url 		= $row['url'];
				$tooltip 	= $row['tooltip'];
				$selected 	= false;
				//if($moduleSelected == $row['descr']) $selected = true;
				$menuArrayLeft[] = array('label' => $name, 'url'=> "javascript:addTabDashboard('{$row['name']}','". Yii::app()->baseUrl.$row['url'] ."');", 'active'=>$selected,
									'items' => $this->getSubHorizontalMenu($id, $roleIds, $controllerSelected));
		    }
			$menuArrayLeft = array('class'=>'bootstrap.widgets.TbMenu', 'items'=>$menuArrayLeft);
			$menuArray = array($menuArrayLeft,$menuArrayRight);
		}else{
			# Interface for user login in web application
			$menuArray = array(array('class'=>'bootstrap.widgets.TbMenu',
								'htmlOptions' => array('class' => 'pull-right'),
								'items'=>array(
								array('label'=>'Sign in', 'url' => Yii::app()->baseUrl.'/home/'))));
		}
    	return $menuArray;
	}	
	
	
	public function getSubHorizontalMenu($parentId, $roleId, $selected){
		$dataReader = $this->getMenu($parentId, $roleId, AppConstant::MENU_SUB_HORIZONTAL_MENU);
		$arr = array();
		$help = false;
		foreach($dataReader as $row){
                    //if($selected == $row['descr'])
                     //       $help = true;
                    $arr[] = array('label'=>$row['name'],'icon'=>'home', 'url'=>"javascript:addTabDashboard('{$row['name']}','". Yii::app()->baseUrl.$row['url'] ."');", 'active'=>$help);
                    //[] = array('label'=>$row['name'],'icon'=>'home', 'url'=>Yii::app()->baseUrl.$row['url'] , 'active'=>$help);
                    
                    $help = false;
		}
		return $arr;
	}

 /* Get left menu
  * @return array 
  */
	public function getLeftVerticalMenu($descr = null, $selected = null){
		$session = Yii::app()->session;	
		$model = Menus::model()->findByAttributes(array('descr'=> $descr));
		$menu = array();
		if($model != null){
			$isAuthenticated = (bool)$session->get('is_authenticated');
	    	$roleIds = 0;
	    	if($isAuthenticated){
				$roleIds = $session->get('roles');
			}
			$dataReader = $this->getMenu($model->id, $roleIds, AppConstant::MENU_VERTICAL_MENU);

			foreach($dataReader as $row){ 
				$menu[] = array(
							    'label' => $row['name'],
							    'url' => "javascript:addTab('{$row['name']}','". Yii::app()->baseUrl.$row['url'] ."');",
							    'itemOptions' => array('class' => '')
							);
			}
		}
		return $menu;
	}
	
	public function getTabMenu($parentId,$menuId,$roleId,$empId){
		$dataReader = $this->getMenu($parentId,$roleId);
		$menu = array();
		foreach($dataReader as $row){
			$id			= $row['id'];
			$name 		= $row['name'];
			$url 		= $row['url'];
			if($empId>0)
			$url = $url."?empId=".$empId; 
			
			if($id==$menuId)
			$active = true;
			else 
			$active = false;
			$menu[] = array(
							'label'=>$name,
							'url'=>Yii::app()->baseUrl.$url,
							'active'=>$active,
							);
		}
		return $menu;
	}
	public function getTabMenu1($mChNodId,$smChNodId,$empId){
		$dataReader = $this->getSubMenuChildNode($mChNodId);
		$menu = array();
		foreach($dataReader as $row){
			$id			= $row['id'];
			$name 		= $row['name'];
			$url 		= $row['url'];
			if($id==$smChNodId)
			$active = true;
			else 
			$active = false;
			$menu[] = array(
							'label'=>$name,
							'url'=>Yii::app()->baseUrl.$url.'?empId='.$empId,
							'active'=>$active,
							);
		}
		return $menu;
	}
}
?>