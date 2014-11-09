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
    	$fullName = "";
    	if($isAuthenticated){
    		$fullName 	= $session->get('full_name');
		}
		$menu = "";
    	if(strlen($fullName) != 0 && $isAuthenticated == true){
    		$menu = '<li title=""><span>'. $fullName .'</span></li>';
    		$menu .='<li title=""><span> |<a href="'.Yii::app()->request->getBaseUrl(true) .'/home/SignOut/'.'">Sign Out</a></span></li>';
        }else{
            $menu = '<li title=""><a><span>Sing In</span></a></li>';
        }
    	return $menu;
	}	
	
    /**
     * we need to show left menu 
     * @return string
     * @see getMenu()
     * 
     */
    public function getVerticalMenu(){
        $roleIds = 0;
        $session = Yii::app()->session;
        $isAuthenticated = (bool)$session->get('is_authenticated');
        if($isAuthenticated){
            $roleIds = $session->get('roles');
        }
        echo '<ul class="easyui-tree">';
        $dataReader = $this->getMenu(0, $roleIds, AppConstant::MENU_HORIZONTAL_MENU);
        foreach($dataReader as $row){
            echo "<li><span>" . $row['name'] . "</span>";
            $obj = $this->getMenu($row['id'], $roleIds, AppConstant::MENU_SUB_HORIZONTAL_MENU);
            echo "<ul>";
            foreach($obj as $key){
                echo "<li><a href='#' onclick='addTabDashboard(\"".$key['name']."\",\"".Yii::app()->request->getBaseUrl(true). $key['url']."\")'>" . $key['name'] . "</a></li>";
                
               // echo "<li><a  href='".Yii::app()->request->getBaseUrl(true). $key['url']."'>" . $key['name'] . "</a></li>";    
            }
            echo "</ul></li>";
        }
        echo '</ul>';
        //return $menu;
    }   
}
?>