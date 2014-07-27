function validationEmpty(fld){
		var error = "";
		//fld = $("#WorkExperienceForm_companyName");
		if(fld.val().length == 0){
			/*fld.style.backgroundColor  = '#FFEEEE';
			fld.style.border = '1px solid #CC0000';*/
			fld.closest('.control-group').addClass("error");
			error = "<li>" + fld.title + " is required.</li>";
		}
		return error;
}