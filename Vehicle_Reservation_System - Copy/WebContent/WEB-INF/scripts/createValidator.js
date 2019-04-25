$(document).ready(function() {  // <-- enclose your code in a DOM ready handler

	jQuery.validator.addMethod("lettersonly", function(value, element) {
		return this.optional(element) || /^[a-z\s]+$/i.test(value);
	});
	jQuery.validator.addMethod("alp", function(value, element) {
		return this.optional(element) || /^[A-Za-z0-9\s]+$/i.test(value);
	});
	jQuery.validator.addMethod("datesonly", function(value, element) {
		return this.optional(element) || /^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$/i.test(value);
	});
	jQuery.validator.addMethod("pwcheck", function(value) {
		return /^[A-Za-z0-9\d=!\-@._*]*$/.test(value) 
		&& /[a-z]/.test(value) 
		&& /\d/.test(value) 
	}); 
	jQuery.validator.addMethod("notEqual",
			function (value) {
		var altcntct=value;         
		var cntct=$("#contactNumber").val();
		if(cntct==altcntct)
			return false;
		else
			return true;
	}
	);

	jQuery.validator.addMethod("availAdminId", function() {
		var bool=false;
		$.ajax({
			url:"checkAdminId",
			data:{adminId:$("#adminId").val()},
			//async:false,
			success: function(data){
				var m=data;
				if(m=="Admin id is Available"){
					alert("Is avail");
					bool=true;
				}
				if(m=="Admin id is Taken"){
					alert("Is taken");
					bool=false;
				}
			}

		});
		alert(bool);
		return bool;
	})
	
	jQuery.validator.addMethod("noSpace", function(value, element) { 
		return value.indexOf(" ") < 0 && value != ""; 
	})


	$("#createForm").validate({
		rules: {
			"vehicleNo":{ 
				required: true,
				minlength: 3,
				maxlength: 15,
				alp: true,
				noSpace:true
			},
			"vehicleType":{ 
				required: true,
				minlength: 3,
				maxlength: 15,
				lettersonly: true,
				noSpace:true
			},
			"insuranceExpiryDate":{
				required: true,
				datesonly:true
			},
			"lastServiceDate":{
				required: true,
				datesonly:true
			},
			"serviceDueDate":{
				required:true,
				digits:true,
			},
			"branch":{
				required:true,
			}

		},
		messages: {
			"vehicleNo": {
				required: "First name is required!",
				minlength: "First name must be at least 3 characters long",
				maxlength: "First name must be at most 15 characters long",
				lettersonly: "Enter valid name",
				noSpace:"Spaces are not allowed"
			},
			"lastName": {
				required: "Last name is required!",
				minlength: "Lase name must be at least 3 characters long",
				maxlength: "First name must be at most 15 characters long",                
				lettersonly: "Enter valid name",
				noSpace:"Spaces are not allowed"
			},
			"insuranceExpiryDate":{
				required: "mandatory",
				datesonly: "enter valid date"
			},
			"lastServiceDate":{
				required: "mandatory",
				datesonly: "enter valid date"
			},
			"serviceDueDate":{
				required: "mandatory",
				datesonly: "enter valid date"
			},
			"branch":{
				reuired:"mandatory"
			}


		},
		highlight: function(element) {
			$(element).parent().addClass('has-error');
		},
		unhighlight: function(element) {
			$(element).parent().removeClass('has-error');
		},
		errorClass:"errors"



	});

});

$(document).ready(function(){
	$('#mydate').datepicker({dateFormat: "dd-mm-yy",
		changeMonth: true,
		changeYear: true,
		yearRange: '-80:+0'
	});
});