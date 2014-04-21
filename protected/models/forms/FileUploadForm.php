<?php

class FileUploadForm extends CFormModel 
{
	public $maxNumOfFiles;
	public $uploadedFile;
	public $uploadTypeId; 
	public $uploadTypes;
	public $validatedCode;
	
	public $width;
	public $height;
	public $ratio;
	public $ext;
	public $name;
	public $fileType;
	public $descr;
	public $url;
	public $data;
	public $size;
	public $mimeType;
	
	
	
	public function __construct() {
		$this->maxNumOfFiles = 1;
		//$common = new Common();
		//$this->uploadTypes = CHtml::listData($common->getFileUploadTypes(), 'id', 'name');
		$this->uploadTypeId = 2; // urban 
		# set validated code 
		//$media = new MediaProcess();
		//$this->validatedCode = $media->validateFileUpload() ? 1 : 0;
	}
	
	public function rules() {
		return array(
			array('uploadTypeId', 'required'),
		);
	}
	
	public function attributeLabels() {
		return array(
			'uploadTypeId' => 'Upload Type'
		);
	}
}
