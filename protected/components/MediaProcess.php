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
	private function createFile($entry, $name = null,  $descr = null, $data = null, $url = null,
	 $size = null, $ext = null, $width= null, $height = null, $ratio = null,$mimeType = null, $pictureType =null ){
		$entry->setAttributes(array(
				'name' => $name,
				'descr' => $descr,
				'data' => $data,
				'url' => $url,
				'size' => $size,
				'ext' => $ext,
				'width' => $width,
				'height' => $height,
				'ratio' => $ratio,
				'mime_type' => $mimeType,
				'picture_type_id' => $pictureType			
		));
		$entry->save(false);
		return $entry->id;
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
	private function updateFile($entry, $name = null, $descr = null, $data = null, $url = null,
	 $size = null, $ext = null, $width= null, $height = null, $ratio = null,$mimeType = null, $pictureType =null){
		
		$entry->setAttributes(array(
				'name' => $name,
				'descr' => $descr,
				'data' => $data,
				'url' => $url,
				'size' => $size,
				'ext' => $ext,
				'width' => $width,
				'height' => $height,
				'ratio' => $ratio,
				'mime_type' => $mimeType,
				'picture_type_id' => $pictureType			
		));
		$entry->save(false);
		return $entry->id;
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
	 * @return int file id
	 */					
	public function processFileUpload($uploadedFile, $fileType, $fileId = null, $descr = null){
		$file = new FileUploadForm();
		$file->ext = $uploadedFile->extensionName;
		$originalName = $uploadedFile->name;
		$nameWithoutExt = Utils::createGuid(false); 
		$name = $nameWithoutExt . '.' . $file->ext;
		$file->mimeType = $uploadedFile->type;
		$file->size = $uploadedFile->size;
		$file->fileType = PictureTypes::model()->findByAttributes(array('name' => $fileType))->id;
		$file->name = $originalName;
		//$file->width = $uploadedFile->width;
		//$file->height = $uploadedFile->height;	
		$file->url = null;
		$file->ratio = null;
		$file->descr = 	$descr;
		
					
		# read content of file to binary for store content in database 
		$fp = fopen($uploadedFile->tempName, 'r');
		$content = fread($fp, filesize($uploadedFile->tempName));
		fclose($fp);
		$file->uploadedFile = $content;
		
		if($fileId != null || $fileId>0){
			#update file's info
			$entry = Pictures::model()->findByPK($fileId);
			$file->fileId = $this->updateFile($entry, $file->fileName, $file->descr, $file->uploadedFile, 
											$file->url, $file->size, $file->ext, $file->width, $file->height, $file->ratio, $file->mineType, $file->fileType);
		}else{
			#save file's info
			$file->fileId= $this->createFile(new Pictures(), $file->name, $file->descr, $file->uploadedFile, $file->url, $file->size, $file->ext, 
											$file->width, $file->height, $file->ratio, $file->mimeType, $file->fileType);
		}
		
		return $file->fileId;
	}
}

?>