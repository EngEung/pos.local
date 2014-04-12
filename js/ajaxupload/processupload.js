$(function(){	 
	//Callback handler for form submit event
	var button ='btn-save';
	
	
	/**
	 * Traning Record
	 */
		$("#traingRecordForm").submit(function(e){
			submitForm('traingRecordForm', button, $('#windowForm'), $("#dg"));
			e.preventDefault(); //Prevent Default action.
			$("#traingRecordForm").unbind;
		});
	
		$('#btn-save').click(function(){
			if(onVlidateFormTraining()){
				button = 'btn-save';
				$("#traingRecordForm").submit();
			}
		});
		$('#btn-save-close').click(function(){
			if(onVlidateFormTraining()){
				button = 'btn-save-close';
				$("#traingRecordForm").trigger('submit');
			}
		});
	
	/**
	 * Work Experience
	 * 
	 */
		$("#WorkExperienceForm").submit(function(e){
			submitForm('WorkExperienceForm', button, $('#windowForm'), $("#dg"));
			e.preventDefault(); //Prevent Default action.
			$("#WorkExperienceForm").unbind;
		});
		
		$('#btn-save-work').click(function(){
			if(onValidateFormWorkExperience()){
				button = 'btn-save';
				$("#WorkExperienceForm").submit();
			}
		});
		
		$('#btn-save-close-work').click(function(){
			if(onValidateFormWorkExperience()){
				button = 'btn-save-close';
				$("#WorkExperienceForm").submit();
			}
		});
	
	/**
	 * Education 
	 */
		$("#educationForm").submit(function(e){
			submitForm('educationForm', button, $('#windowForm'), $("#dg"));
			e.preventDefault(); //Prevent Default action.
			$("#educationForm").unbind;
		});
	
		$('#btn-save-edu').click(function(){
			if(onVlidateFormEducation()){
				button = 'btn-save';
				$("#educationForm").submit();
			}
		});
		
		$('#btn-save-close-edu').click(function(){
			if(onVlidateFormEducation()){
				button = 'btn-save-close';
				$("#educationForm").submit();
			}
		});
	
	/**
	 * Language
	 */
		$("#languageForm").submit(function(e){
			submitForm('languageForm', button, $('#windowFormLang'), $("#dtlang"));
			e.preventDefault(); //Prevent Default action.
			$("#languageForm").unbind;
		});
	
		$('#btn-save-lang').click(function(){
			//if(onVlidateFormEducation()){
				button = 'btn-save';
				$("#languageForm").submit();
			//}
		});
		
		$('#btn-save-close-lang').click(function(){
			//if(onVlidateFormEducation()){
				button = 'btn-save-close';
				$("#languageForm").submit();
			//}
		});
		
	/**
	 * Language
	 */
		$("#awardForm").submit(function(e){
			submitForm('awardForm', button, $('#windowFormAward'), $("#dgAward"));
			e.preventDefault(); //Prevent Default action.
			$("#awardForm").unbind;
		});
	
		$('#btn-save-award').click(function(){
			//if(onVlidateFormEducation()){
				button = 'btn-save';
				$("#awardForm").submit();
			//}
		});
		
		$('#btn-save-close-award').click(function(){
			//if(onVlidateFormEducation()){
				button = 'btn-save-close';
				$("#awardForm").submit();
			//}
		});		
		
		

	/**
	 * Submit Form
	 * @param string form, selector #id of tag form
	 * @param string button, to define when user click Save&new or Save&close button
	 * @param string winForm, selector #id of Window Pop up
	 * @param stirng n, selector #n of datagrid easyui 
	 */	
	function submitForm(form, button, winForm, n){
		var formObj = $("#"+form);
	    var formURL = formObj.attr("action");
	    var formElement = document.getElementById(form);
	    var formData = new FormData(formElement);
	    $.ajax({
		    url: formURL,
		    type: 'POST',
		    data:  formData,
		  //  beforeSend:  beforeSubmit,
		    mimeType:"multipart/form-data",
		    contentType: false,
		    cache: false,
		    processData:false,
		    dataType:'json',
		  //  uploadProgress: OnProgress,
		    success: function(response, textStatus, jqXHR){
		    	$.messager.progress('close');
		    	if(response.validated == true){
		        	if(response.success==true){
		        		if(button == 'btn-save-close')
		        			winForm.dialog('close');
		        	 	
		        	 	if(button == 'btn-save')
		        	 		resetForm(formObj);
		    
		        	 	refreshGrid(n);
		        	}else{
		        	 	$.messager.alert('Warning','Save training record has not been successfully!','warning');
		        	}
		    	}else {
		    		$.messager.alert('Error','Error occured.please try again.','warning');
		    	}
		    },
		     error: function(jqXHR, textStatus, errorThrown){
		     }         
	    });
	    return false;
	}
	
	$('#imageInput').on("change", function(){
		onChangefileUpload();
	});
	
	/**
	 * vlidate form inpu file 
	 */
	function onChangefileUpload(){
	 //check whether browser fully supports all File API
	   if (window.File && window.FileReader && window.FileList && window.Blob)
		{

			if( !$('#imageInput').val()) //check empty input filed
			{
				$("#alerter").notice("Please select  file");
				return false
			}
			
			var fsize = $('#imageInput')[0].files[0].size; //get file size
			var ftype = $('#imageInput')[0].files[0].type; // get file type
			var fileName = $('#imageInput')[0].files[0].name;
			
			
			//allow only valid image file types 
			switch(ftype)
	        {
	            case 'image/png': case 'image/gif': case 'image/jpeg': case 'image/pjpeg': case 'application/pdf':
	                break;
	            default:
	                $("#output").notice("<b>"+ftype+"</b> Unsupported file type!");
	            	$("#imageInput").val("");
					return false;
	        }
			
			//Allowed file size is less than 1 MB (1048576)
			if(fsize>1048576) 
			{
				$("#output").notice("<b>"+bytesToSize(fsize) +"</b> Too big Image file! <br />Please reduce the size of your photo using an image editor.");
				return false;
			}
			
			$("#alerter .alert").alert("close");
			var file = '<a target="_blank" id="file_link" href="/hr/staff/empTraining/viewFile/?id="><i class="icon-file"> </i>' + fileName +'</a>';
			file = file + '<a id="file_delete" href="#" onclick="onDeleteFile()" ><i class="icon-remove"> </i></a>';
			$("#output").html(file);
		}
		else
		{
			//Output error to older unsupported browsers that doesn't support HTML5 File API
			$("#alerter").notice("Please upgrade your browser, because your current browser lacks some new features we need!");
			return false;
		}
	}
	 
});



/**
 * Refresh Gridview easyui
 * @param n
 */
function refreshGrid(n){
	n.datagrid('clearSelections');
	n.datagrid('reload');	
}


/**
 * Reset Form
 * @param e
 */
function resetForm(e){
	$(':input',e)
	 .val('')
 	.removeAttr('checked')
 	.removeAttr('selected');
 	e[0].reset(); 
	$('#output').html('');
}	

//after succesful upload
function afterSuccess()
{
	$('#loading-img').hide(); //hide submit button
	$('#submit-btn').attr('disabled','disabled'); // disable button upload if has file already.
	$('#statustxt').html("");
}

jQuery.fn.notice = function(message){
		return this.each(function(){
		var $this = $(this)
	
		$this.html("<div class='alert btn-block alert-warning'><button type='button' class='close' data-dismiss='alert'></button>"+message+"</div>")	
	})	
}

/**
 * validate form work experience
 * @returns {Boolean}
 */
function onValidateFormWorkExperience() {
    var name = validationEmpty($("#WorkExperienceForm_companyName"));
    var businessType = validationEmpty($("#WorkExperienceForm_businessType"));
    var phone = validationEmpty($("#WorkExperienceForm_companyPhone"));
    var startPosition = validationEmpty($("#WorkExperienceForm_startPosition"));
    var startDate = validationEmpty($("#WorkExperienceForm_startDate"));
    var endDate = validationEmpty($("#WorkExperienceForm_endDate"));
    var lastPosition = validationEmpty($("#WorkExperienceForm_lastPosition"));
    var startSalary = validationEmpty($("#WorkExperienceForm_startSalary"));
    var leaveSalary = validationEmpty($("#WorkExperienceForm_leaveSalary"));
    var companyAddress = validationEmpty($("#WorkExperienceForm_companyAddress"));
		if( name != "" || businessType != "" || phone != "" || startPosition != "" ||
			startDate != "" || endDate != "" || lastPosition != ""|| startSalary != "" ||
			leaveSalary != "" || companyAddress != ""){
			return false;	
		}
		return true;
}

/**
 * validate form Traning record
 * @returns {Boolean}
 */
function onVlidateFormTraining(){
	var courseTitle = validationEmpty($("#TrainingForm_courseTitle"));
    var organizer = validationEmpty($("#TrainingForm_organizer"));
    var sponsorBy = validationEmpty($("#TrainingForm_sponsorBy"));
    var place = validationEmpty($("#TrainingForm_place"));
    var duration = validationEmpty($("#TrainingForm_duration"));
	if( courseTitle != "" || organizer != "" || sponsorBy != "" ||
			place != "" || duration != ""){
		return false;	
	}
	return true;
}

/**
 * validate form education
 * @returns {Boolean}
 */
function onVlidateFormEducation(){
	var school = validationEmpty($("#EducationForm_schoolName"));
    var location = validationEmpty($("#EducationForm_location"));
    var country = validationEmpty($("#EducationForm_countryId"));
    var level = validationEmpty($("#EducationForm_educationLevelId"));
	if( school != "" || location != "" || country != "" ||
			level != ""){
		return false;	
	}
	return true;
}

//function to format bites bit.ly/19yoIPO
function bytesToSize(bytes) {
   var sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB'];
   if (bytes == 0) return '0 Bytes';
   var i = parseInt(Math.floor(Math.log(bytes) / Math.log(1024)));
   return Math.round(bytes / Math.pow(1024, i), 2) + ' ' + sizes[i];
}

function onDeleteFileRelateTable(id, url){
	var fileId = id;
	$('#progressbox').show();
	if(fileId > 0) {
		var data = {id: fileId};
		$.ajax({
			url: url,
			type: 'POST',
			data: data,
			dataType: 'json',
			success: function (result) {
				if(result == true){
					$('#progressbox').hide();
					$("#output").html("<div class='alert btn-block alert-warning'><button type='button' class='close' data-dismiss='alert'></button>Delete file succesfully.</div>");
					$('#submit-btn').removeAttr('disabled');
				}
				else{
					$('#progressbox').hide();
					$("#output").html("<div class='alert btn-block alert-warning'><button type='button' class='close' data-dismiss='alert'></button>Delete file unsuccesfully.</div>");
				}
			},
			error: function(result){
				$('#progressbox').hide();
				$("#output").append(
						"<div class='alert btn-block alert-warning'><button type='button' class='close' data-dismiss='alert'></button>Error delele file.!</div>");
			}
		 });
	}
	return false;
}

function onDeleteFile(){
	$("#imageInput").val("");
	$("#output").html("<div class='alert btn-block alert-warning'><button type='button' class='close' data-dismiss='alert'></button>Delete file.</div>");
}

function onDeleteFileForUpdate(){
	var id = $('#file_delete').attr('rel');
	$(id).val("1");
	$("#output").html("<div class='alert btn-block alert-warning'><button type='button' class='close' data-dismiss='alert'></button>Delete file.</div>");
}