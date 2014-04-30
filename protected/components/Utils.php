<?php 
/**
 * @version 1.0
 * Date: 2012-10-11
 */


class Utils extends CApplicationComponent {
	
	/**
	 * Starts the $haystack string with the prefix $needle?
	 * Credit: http://stackoverflow.com/questions/834303/php-startswith-and-endswith-functions
	 * http://doc.nette.org/en/strings
	 * @param  string
	 * @param  string
	 * @return bool
	 */
	public static function startsWith($haystack, $needle) {
     	return strncmp($haystack, $needle, strlen($needle)) === 0;
 	}
	 /**
	  * Ends the $haystack string with the suffix $needle?
	  * Credit: http://stackoverflow.com/questions/834303/php-startswith-and-endswith-functions
	  * http://doc.nette.org/en/strings
	  * @param  string
	  * @param  string
	  * @return bool
	  */
	public static function endsWith($haystack, $needle) {
		return strlen($needle) === 0 || substr($haystack, -strlen($needle)) === $needle;
	}	
    
    /**
     * Encodes the HTML string for safely saving into the database
     * @param string $html the HTML string to be encoded.
     * @return string the encoded HTML string. 
     */
    public static function encodeHtml($html) {
         if (strlen($html) < 1 ) return null;
         return htmlspecialchars($html, ENT_QUOTES);
    }
    /**
     * Decodes HTML string for displaying in web page.
     * @param string $str the HTML string
     * @return the decoded HTML string for display
     */
    public static function decodeHtml($str) {
        if (strlen($str) < 1) return null;
        return htmlspecialchars_decode($str, ENT_QUOTES);
    }
    
    /**
     * Redirects the user to the specified target URL.
     * @param string $url the specified target URL.
     * @return void
     */
    public static function redirectUrl($url) {
        header("location:" . $url);
    }
    
    /**
     * Credit: http://www.php.net/manual/en/function.date-add.php   
     * This function allows the addition of day(s),month(s),year(s) to the original date 
     * while still preserving the Hours, minutes and seconds
     * You can also modify to add to hours, miuntes and even seconds.
     * Retrieved date: 2012-10-04
     */ 
    public static function addDate($givendate,$day=0,$mth=0,$yr=0) {
        $cd = strtotime($givendate);
        $newdate = date('Y-m-d h:i:s', mktime(date('h',$cd),
        date('i',$cd), date('s',$cd), date('m',$cd)+$mth,
        date('d',$cd)+$day, date('Y',$cd)+$yr));
        return $newdate;
    }
    
    /**
     * Creates the GUID using seeded random number
     * Credit => http://guid.us/GUID/PHP
     * Date:2012-11-23
     * @param boolean $addCurlyBrace adding curly brace if true; false otherwise.
     * @return string the requested GUID.
     */
    public static function createGuid($addCurlyBrace=true) {
        if (function_exists('com_create_guid')){
            return com_create_guid();
        } else {
            mt_srand((double)microtime()*10000);//optional for php 4.2.0 and up.
            $charid = strtoupper(md5(uniqid(rand(), true)));
            $hyphen = chr(45);// "-"
            $uuid = '';
            if($addCurlyBrace) {
                $uuid = chr(123)// "{"
                .substr($charid, 0, 8).$hyphen
                .substr($charid, 8, 4).$hyphen
                .substr($charid,12, 4).$hyphen
                .substr($charid,16, 4).$hyphen
                .substr($charid,20,12)
                .chr(125);// "}"
            } else {
                $uuid = substr($charid, 0, 8).$hyphen
                .substr($charid, 8, 4).$hyphen
                .substr($charid,12, 4).$hyphen
                .substr($charid,16, 4).$hyphen
                .substr($charid,20,12);
            }
        return $uuid;
      }
   }
   /**
    * Cleans up the phone number making it easier for comparision 
    * when the user recovers the security account. 
    * @param string $phoneNum the phone number.
    * @return string the cleaned phone number or orginal phone number
    */
   public static function cleanUpPhoneNumber($phoneNum) {
       if(strlen($phoneNum) < 1) return $phoneNum;
       return preg_replace("/[\(\)\s+-\.]/", '', $phoneNum);
   }
   
   /**
    * Formats the US phone number in +1(980) 933-4732 format.
    * @param string $phoneNum the US phone number.
    * @return string the fomatted phone number. 
    * Credit => http://stackoverflow.com/questions/4708248/formatting-phone-numbers-in-php
    * Test status => not yet 
    */
   public static function formatUSPhoneNumber($phoneNum) {
       if(strlen($phoneNum) < 1) return $phoneNum;
       $formattedPhoneNum = '';
       if(preg_match('/^\+\d(\d{3})(\d{3})(\d{4}|\d+)$/',$phoneNum,$matches)) {
           if (count($matches) >= 3) {
                $formattedPhoneNum = $matches[1] . '-' .$matches[2] . '-' . $matches[3];
           }
       }
       return strlen($formattedPhoneNum) > 0 ? $formattedPhoneNum : $phoneNum;
   }
   
   public static function getConstantValue($constName){
   		return defined($constName) ? constant($constName) : null;
   }
   
   /**
    * http://www.yiiframework.com/wiki/425
    * Salted Password with crypt php buildin function
    */
   public static function createSaltedPassword($psswd){
   	   $salt = openssl_random_pseudo_bytes(22);
	   $salt = '$2b$%13$' . strtr($salt, array('_' => '.', '~' => '/'));
	   $password_hash = crypt($psswd, $salt);
	   return $password_hash;
   }
   
   /**
    * http://www.yiiframework.com/wiki/425
    * Salted Password with crypt php buildin function
    */
   public static function getSaltedPasswd($passwd){
   	return crypt($passwd, self::createSaltedPassword($passwd));
   }
   
   
   
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
		
		$total = self::getTotalNumberofRecord($sql);
		# get params
		$params = self::prepareList();
		if($params == null) return null;
		
		# query with order by
		if(isset($params['order']))
			$sql .= " order by ".$params['order'];
		
		# query with limit and offset
		if($params['limit'] != null && $params['offset'] != null)
	    	$sql .= " limit {$param['limit']} offset {$params['offset']}";
		try{
			$cnc = Yii::app()->db;
    		$cmd = new CDbCommand($cnc);
    		$cmd = $cnc->createCommand($sql);
    		$dataReader = $cmd->query();
			$total = count($dataReader);
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
}



















