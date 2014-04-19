<?php 

class MediaProcess extends CApplicationComponent{
	
	private $_originalName;
	private $_fileNameConvert;
	private $_size;
	private $_mimeType;
	private $_ext;
	
	
	
	/**
	 * Get File by ID
	 * @param int $id
	 * @return array
	 */
	public function getFile($id){
		return FileUploadTemp::model()->findByPK($id);
	}
	
	
	/**
	 * Get File information
	 */
	public function getFileInfo($fileUpload){
		if($fileUpload!= null) return false;
		
		
	}
	
	/**
	 * Storing File in databse when uploaded files.
	 * @param $entry 
	 * @param $employeeId 
	 * @param $employeeDocId 
	 * @param $data 
	 * @param $fileName 
	 * @param $fielType 
	 * @param $mimeType 
	 * @param $size 
	 * @param $ext 
	 * @return boolean
	 */
	private function createFile($entry, $employeeId, $data = null, $fileName = null, $fielType =null, 
	$mimeType = null, $size = null, $ext = null, $thumbnail = null){
		if($employeeId <0 && $employeeDocId < 0) return false;
		
		$entry->setAttributes(array(
				'employee_id' => $employeeId,
				'data' => $data,
				'file_name' => $fileName,
				'file_type' => $fielType,
				'mime_type' => $mimeType,
				'size' => $size,
				'ext' => $ext,
				'thumbnail' => $thumbnail				
		));
		$entry->save(false);
		return $entry->id;
	}
	
	/**
	 * Storing information of file in file_uplode_temp table when uploaded files.
	 * @param int $employeeId
	 * @param int $employeeDocId 
	 * @param binary $data 
	 * @param string $fileName 
	 * @param string $fielType 
	 * @param string $mimeType 
	 * @param int $size 
	 * @param string $ext 
	 * @return boolean true or false
	 */
	public function createFileUploadTemp($employeeId, $data = null, $fileName = null, $fielType =null, 
											$mimeType = null, $size = null, $ext = null, $thumbnail = null){
		return $this->createFile(new FileUploadTemp(), $employeeId, $data, $fileName, $fielType, $mimeType, $size, $ext, $thumbnail);
	}
	
	/**
	 * Storing information of file in file_upload table when uploaded files.
	 * @param int $employeeId
	 * @param int $employeeDocId 
	 * @param binary $data 
	 * @param string $fileName 
	 * @param string $fielType 
	 * @param string $mimeType 
	 * @param int $size 
	 * @param string $ext 
	 * @return boolean true or false
	 */
	public function createFileUpload($employeeId, $data = null, $fileName = null, $fielType =null, $mimeType = null, 
									$size = null, $ext = null, $thumbnail = null){
		return $this->createFile(new FileUpload, $employeeId, $data, $fileName, $fielType, $mimeType, $size, $ext, $thumbnail);
	}
	
	/**
	 * Delete File
	 * @param $entity, model
	 * @return boolean true or false
	 */
	public function deleteFile($entity){
		$entity->setAttributes(array(
			'active' => false
		));
		
		return $entity->save(false);
	}
	
	/**
	 * Delete File upload temporery
	 * @param int $fileId
	 * @return boolean true or false
	 */
	public function deleteFileTemp($fileId){
		if($fileId <0 ) return false;
		$model = FileUploadTemp::model()->findByPK($fileId);
		return $this->deleteFile($model);
	}
	
	/**
	 * Delete File upload real
	 * @param int $fileId
	 * @return boolean true or false
	 */
	public function delteFileReal($fileId){
		if($fileId < 0 ) return false;
		$model = FileUpload::model()->findByPK($fileId);
		return $this->deleteFile($model);
	}
	
	
	/**
	 * Update File in databse when uploaded files.
	 * @param $entry 
	 * @param $employeeId 
	 * @param $employeeDocId 
	 * @param $data 
	 * @param $fileName 
	 * @param $fielType 
	 * @param $mimeType 
	 * @param $size 
	 * @param $ext 
	 * @return int
	 */
	private function updateFile($entry, $data = null, $fileName = null, $fielType =null, 
	$mimeType = null, $size = null, $ext = null, $thumbnail = null){
		if($employeeId <0 && $employeeDocId < 0) return false;
		
		$entry->setAttributes(array(
				'data' => $data,
				'file_name' => $fileName,
				'file_type' => $fielType,
				'mime_type' => $mimeType,
				'size' => $size,
				'ext' => $ext,
				'thumbnail' => $thumbnail				
		));
		$entry->save(false);
		return $entry->id;
	}
	
	
	/**
	 * Update File upload real
	 * @param int $fileId
	 * @return boolean true or false
	 */
	public function updateFileReal($fileId, $data = null, $fileName = null, $fielType =null, 
						$mimeType = null, $size = null, $ext = null, $thumbnail = null){
		if($fileId < 0 ) return false;
		$model = FileUpload::model()->findByPK($fileId);
		return $this->updateFile($model, $data = null, $fileName = null, $fielType =null, 
								$mimeType = null, $size = null, $ext = null, $thumbnail = null);
	}
	
	/**
	 * Update File upload real
	 * @param int $fileId
	 * @return boolean true or false
	 */
	public function updateFileTemp($fileId, $data = null, $fileName = null, $fielType =null, 
						$mimeType = null, $size = null, $ext = null, $thumbnail = null){
		if($fileId < 0 ) return false;
		$model = FileUploadTemp::model()->findByPK($fileId);
		return $this->updateFile($model, $data = null, $fileName = null, $fielType =null, 
								$mimeType = null, $size = null, $ext = null, $thumbnail = null);
	}
		
	/**
	 * we do not need to store files in database, so just store in uploads folders
	 * @param file upload $uploadedFile,
	 * @param string $fileType,
	 * @param int $fileId,
	 * @param int $employeeId
	 * @return int file id  
	 */
	public function processFileUploadInFolder($uploadedFile, $fileType, $fileId = null, $employeeId = null){
		$file = new FileUploadForm();
    	$path = Yii::getPathOfAlias('webroot.uploads').'/';
		$file->ext = $uploadedFile->extensionName;
		$originalName = $uploadedFile->name;
		$nameWithoutExt = Utils::createGuid(false); 
		$name = $nameWithoutExt . '.' . $file->ext;
		$relativePath = "/uploads/" . $name;
		$currentUrl = parse_url(Yii::app()->createAbsoluteUrl(Yii::app()->request->url));
		$fullPath = $path . $name;
		$uri = 'http://' . $currentUrl['host'] . $relativePath;
		
		# $mimeType = $model->uploadedFile->type; 
		$file->mimeType = $uploadedFile->type; 
		
		$file->size = $uploadedFile->size;
		
		#save file in folder
		$model->uploadedFile->saveAs($fullPath);
		  
		$file->fileType = $fileType;
		$file->fileName = $originalName;
		
		$file->uploadedFile = null;
		if($fileId != null || $fileId>0){
			#update file's info
			$file->fileId = $this->updateFileTemp($fileId,$file->uploadedFile, $file->fileName, 
									$file->fileType, $file->mimeType, $file->size, 
									$file->ext); 
		}else{
			#save file's info
			$file->fileId = $this->createFileUploadTemp($employeeId,
									$file->uploadedFile, $file->fileName, 
									$file->fileType, $file->mimeType, $file->size, 
									$file->ext);
		}
		return $file->fileId;
	}	
		
	/**
	 * store content file in database
	 * @param file upload $uploadedFile,
	 * @param string $fileType,
	 * @param int $fileId,
	 * @param int $employeeId
	 * @return int file id
	 */					
	public function processFileUpload($uploadedFile, $fileType, $fileId = null, $employeeId = null){
		$file = new FileUploadForm();
		$file->ext = $uploadedFile->extensionName;
		$originalName = $uploadedFile->name;
		$nameWithoutExt = Utils::createGuid(false); 
		$name = $nameWithoutExt . '.' . $file->ext;
		$file->mimeType = $uploadedFile->type;
		$file->size = $uploadedFile->size;
		$file->fileType = $fileType;
		$file->fileName = $originalName;	
						
		# read content of file to binary for store content in database 
		$fp = fopen($uploadedFile->tempName, 'r');
		$content = fread($fp, filesize($uploadedFile->tempName));
		fclose($fp);
		$file->uploadedFile = $content;
		
		if($fileId != null || $fileId>0){
			#update file's info
			$file->fileId = $this->updateFileTemp($fileId,$file->uploadedFile, $file->fileName, 
									$file->fileType, $file->mimeType, $file->size, 
									$file->ext); 
		}else{
			#save file's info
			$file->fileId = $this->createFileUploadTemp($employeeId,
									$file->uploadedFile, $file->fileName, 
									$file->fileType, $file->mimeType, $file->size, 
									$file->ext);
		}
		
		return $file->fileId;
	}
}

?>