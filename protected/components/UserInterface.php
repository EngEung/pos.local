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
    		/*$sql = "select m.* from tbl_menus m
    		join tlkp_menu_types mt on m.menu_type_id=mt.id
    		where mt.name = :name and m.active = true order by m.order_num asc";*/
			$sql = "select m.*,mr.role_id 
					from tbl_menus m
					inner join tbl_menu_role mr on m.id=mr.menu_id
		    		where m.parent_id = :parentId and mr.role_id= :roleId 
					and m.active = true and mr.active= true and m.name = :menuTypeId
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
	
	
	public function getMenuNode($menuId){
		$dataReader = null;
    	$desc = "get menu nodes by menu ID";
    	try {
    		$cnc = Yii::app()->db;
    		$cmd = new CDbCommand($cnc);
    		$sql = "select mn.* from tbl_menu_nodes mn
    		join tbl_menus m on mn.menu_id=m.id
    		where mn.menu_id = :menuId and mn.active = true order by mn.order_num asc";
    		$cmd = $cnc->createCommand($sql);
    		$cmd->bindParam(":menuId", $menuId, PDO::PARAM_INT);
    		$dataReader = $cmd->query();
    	} catch(CException $ex) {
    		$this->_error->insert($ex, $desc);
    	}
    	return $dataReader;
	}
		
	/*
	 * Get Menu Child Node by MenuNodeID 
	 * @param interger $mNodeId 
     * @return menu child nodes populated in the dataReader 
	 */
	public function getMenuChildNode($mNodeId){
		$dataReader = null;
    	$desc = "get menu child nodes by menu node ID";
    	try {
    		$cnc = Yii::app()->db;
    		$cmd = new CDbCommand($cnc);
    		$sql = "select mcn.* from tbl_menu_child_nodes mcn
    		join tbl_menu_nodes mn on mcn.menu_node_id=mn.id
    		where mcn.menu_node_id = :mNodeId and mn.active = true order by mcn.order_num asc";
    		$cmd = $cnc->createCommand($sql);
    		$cmd->bindParam(":mNodeId", $mNodeId, PDO::PARAM_INT);
    		$dataReader = $cmd->query();
    	} catch(CException $ex) {
    		$this->_error->insert($ex, $desc);
    	}
    	return $dataReader;
	}
	/*
	 * Get Sub Menu Child Node by MenuChildNodeID 
	 * @param interger $mChNodeId 
     * @return sub menu child nodes populated in the dataReader 
	 */
	public function getSubMenuChildNode($mChNodId){
		$dataReader = null;
    	$desc = "get sub menu child nodes by menu child node ID";
    	try {
    		$cnc = Yii::app()->db;
    		$cmd = new CDbCommand($cnc);
    		$sql = "select a.* from tbl_sub_menu_child_nodes a
    		join tbl_menu_child_nodes b on a.menu_ch_node_id=b.id
    		where a.menu_ch_node_id = :mChNodeId and a.active = true order by a.order_num asc";
			$cmd = $cnc->createCommand($sql);
    		$cmd->bindParam(":mChNodeId", $mChNodId, PDO::PARAM_INT);
    		$dataReader = $cmd->query();
    	} catch(CException $ex) {
    		$this->_error->insert($ex, $desc);
    	}
    	return $dataReader;
	}
	
	/**
	 * Get top menus
	 * @return array 
	 */
	public function getTopMenu($roleId, $module){
		$session = Yii::app()->session;
    	$isAuthenticated = (bool)$session->get('is_authenticated');
    	
    	$fullName = '';
    	
    	if($isAuthenticated)
    		$fullName 	= $session->get('full_name');
			$roleId 	= $session->get('roleid');
			$parentId	= 0;
		$dataReader = $this->getMenu(0, $roleId, AppConstant::MENU_HORIZONTAL_MENU);
    	$menuArray;
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
				if($module == $row['descr']) $selected = true;
				$menuArrayLeft[] = array('label' => $name, 'url'=> Yii::app()->baseUrl.$url, 'active'=>$selected);
		    }
			$menuArrayLeft = array('class'=>'bootstrap.widgets.TbMenu', 'items'=>$menuArrayLeft);
			$menuArray = array($menuArrayLeft,$menuArrayRight);
		}else{
			# Interface for user login in web application
			$menuArray = array('label'=>'Sign in', 'url' => $this->createUrl('/sec/signin'));
		}
    	return $menuArray;
	}	
	

 /* Get left menu
  * @return array 
  */
	public function getLeftMenu($parentId,$roleId){
		$menuname 	  = Menus::model()->findByPk($parentId);
		$module_name  = $menuname->module;
		$menu = array();
		$menu[] 	= array(
						      'name' => $menuname->name,
						      'link' => '#',
						      'class' =>'header_side_bar'
				    		);
		$dataReader = $this->getMenu($parentId,$roleId);
		foreach($dataReader as $row){
			$name 		= $row['name'];
			$url 		= $row['url'];
			if($module_name=="staff"){
				$url = $url;
			}
			else{
				$url = Yii::app()->baseUrl.$url;
			}
			$icon 		= $row['icon_url'];
			$mNodeId 	= $row['id'];
			$submenu 	= NULL;
			$dataReader1 = $this->getMenu($mNodeId,$roleId);
			if(count($dataReader1)>0){
				foreach($dataReader1 as $row1){
				$mcnName 	= $row1['name'];
				$mcnUrl  	= $row1['url'];
				$submenu[] = array(
			          'name' => $mcnName,
			          'link' => Yii::app()->baseUrl.$mcnUrl,
					  'icon' => 'list',
			          'active' => 'documentation/feature',
			        );
				}
			}
		
			$menu[] = array(
				      		'name' => $name,
				      		'link' => $url, 
				      		'icon' => $icon,
				      		'active' => 'Profile',  
							'sub'=>$submenu
						);
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