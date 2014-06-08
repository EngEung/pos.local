<?php 

class DAO extends  CApplicationComponent{
	
	 /**
	 * Applies LIMIT, OFFSET and ORDER to the specified query criteria.
	 * @param CDbCriteria $criteria The query criteria that should be applied restrictions
	 * @param CActiveRecord $model The model that will execute criteria 
	 */
	protected static function prepareList()
	{
		$params = array();
		if (isset($_REQUEST['rows']))
		{
			$limit = $_REQUEST['rows'];
			$params = array('limit' => $limit, 'offset' => ($_REQUEST['page']-1) * $limit);
		}
	
		if (isset($_REQUEST['sort']))
		{
			$sort = $_REQUEST['sort'];
			$direction = (isset($_REQUEST['order'])) ? $_REQUEST['order'] : "";
			$params['order'] = $sort .' '. $direction;
		}
		return $params; 
	}
	
	/**
     * Exports an array to a special readable JSON object.     
     * <p>The $total parameter indicates the total number of records. This is useful is case of pagination where
     * the total number of records is needed by the control to create the correct pagination<br/>     
     * @param string $sql 
     * @param int $total total number of records in the entire data-source
     * @return array  Data representation in JSON format
     */
	public static function exprotData($sql){
		if($sql == null) return null;
		$arr = array();
		$arr1 = array();
		$str = array();
		$total = 0;
		//$total = self::getTotalNumberofRecord($sql);
		# get params
		$params = self::prepareList();
		//if($params == null) return null;
		$total = self::countTotal($sql);
		# query with order by
		if(isset($params['order']))
			$sql .= " order by ".$params['order'];
		
		# query with limit and offset
		if(isset($params['limit']) && isset($params['offset'])){
			
			if($params['limit'] != null){
				$sql .= " limit {$params['limit']} offset {$params['offset']}";
			}
		}
		
		try{
			$cnc = Yii::app()->db;
    		$cmd = new CDbCommand($cnc);
    		$cmd = $cnc->createCommand($sql);
    		$dataReader = $cmd->query();
			//$total = count($dataReader);
			foreach($dataReader as $row ){
				foreach($row as $key => $value){
					$arr1 =array($key=> $value);
					$arr = array_merge($arr, $arr1);
				}
				$str[] = $arr;
			}
		}catch(CException $e){
			echo $e;
		}
		return array('total'=>"$total", 'rows' => $str);
	
	}
        
 	public static function getTotalNumberofRecord($sql){
		return Yii::app()->db->createCommand($sql)->queryScalar();
	}
	
	
	public static function countTotal($sql){
		$cnc = Yii::app()->db;
		$cmd = new CDbCommand($cnc);
		$cmd = $cnc->createCommand($sql);
		$dataReader = $cmd->query();
		$total = count($dataReader);
		return $total;
	}
    /**
	 * Exports an model to a special readable JSON to work with formulÃ¡rios
	 * @param CModel $model
	 * @return string JSON string representation of model
	 */
	public static function exportModel($model)
	{
		$data = self::encodeData($model);
		foreach ($data as $k => $v)
		{
			$className = get_class($model);
			$data[$className.'['.$k.']'] = $v;
			unset($data[$k]);
		}
		return CJSON::encode($data);
	}    
        
        
        
        /**
     * Convert model to array for export JSON format
     * @param $model the model to encode
     * @param boolean $hidePk whether to export primary key attribute
     * @param array $exports attribute names of export
     */
    private static function encodeData($model, $alias=null, $hidePk=false, $exports=array())
    {
    	$data = array();    	
    	foreach ($model as $key => $value)    	  		   
    	{    		
    		if ($hidePk && $key == $model->getTableSchema()->primaryKey)    		    		
    			continue;    			    		

    		if (empty($exports) || in_array($key, $exports))    		
    		{    			    		
    			$key = ($alias) ? strtolower($alias).'_'.$key : $key;
	    		$data[$key] = $value;
    		}
    	}    	
    	
    	if ($model instanceof CActiveRecord)
    	{    	
    		foreach ($model->relations() as $k => $relation)
    		{    		
    			if ($relation[0] === CActiveRecord::BELONGS_TO)    		
    			{    			    		    			
    				$fk = $model->{$k};    				    				
    				if ((empty($exports) || in_array($k, $exports)) && $fk !== null){
    					$cls = get_class($fk);
    					$alias = ($alias !== null) ? $alias.'_'.$cls : $cls; 
    					$data = array_merge($data, self::encodeData($fk, $alias, true, $exports));
    				}    				
    			}
    		}    		    	
    	}
    	return $data;
    }
}
?>
