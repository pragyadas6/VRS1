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


	$("#registerForm").validate({
		rules: {
			"firstName":{ 
				required: true,
				minlength: 3,
				maxlength: 15,
				lettersonly: true,
			},
			"lastName":{ 
				required: true,
				minlength: 3,
				maxlength: 15,
				lettersonly: true,
				noSpace:true
			},
			"age":{
				required: true,
				digits:true,
				min: 18,
				max: 60

			},
			"gender":{
				required:true
			},
			"contactNumber":{
				required:true,
				digits:true,
				minlength:10,
				maxlength:10
			},
			"adminId":{
				required:true,
				alp:true,
				minlength:10,
				maxlength:10,
				availAdminId:true,
				noSpace:true
			},
			"emailId":{
				required:true,
				//avail:true,
				email:true
			},
			"password":{
				required:true,
				minlength:8,
				maxlength:20,
				pwcheck:true
			},
			"branch":{
				required:true
			}

		},
		messages: {
			"firstName": {
				required: "First name is required!",
				minlength: "First name must be at least 3 characters long",
				maxlength: "First name must be at most 15 characters long",
				lettersonly: "Enter valid name"
			},
			"lastName": {
				required: "Last name is required!",
				minlength: "Lase name must be at least 3 characters long",
				maxlength: "First name must be at most 15 characters long",                
				lettersonly: "Enter valid name",
				noSpace:"Spaces are not allowed"
			},
			"age":{
				required: "Age is required",
				min: "You are too young to join.",
				max: "Age should be within 60 years.",
				digits: "Only digits are allowed"
			},
			"contactNumber":{
				required:"Contact no is required",
				digits:"Only digits are allowed",
				minlength:"Enter a valid no",
				maxlength:"Enter a valid no"
			},
			"emailId":{
				required:"mandatory",
				//avail:"Present",
				email:"Invalid"
			},
			"adminId":{
				reuired:"mandatory",
				minlength:"Admin id must be 10 characters long",
				maxlength:"Admin id must be 10 characters long",
				noSpace:"no spaces are allowed",
				alp:"no special characters are allowed",
				availAdminId:"Your account already exists"
			},
			"password":{
				required:"Enter a password",
				minlength:"Password should be at least 8 characters long",
				maxlength:"password cant be longer than 20 characters",
				pwcheck:"password must contain a digit,special character and a lowercase letter"
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

/*$(document).ready(function(){
	$('#mydate').datepicker({dateFormat: "dd-mm-yy",
		changeMonth: true,
		changeYear: true,
		yearRange: '-80:+0',
		onSelect: function(value, ui) {
			var today = new Date(); 
			var age = parseInt(today.getFullYear()) - parseInt(ui.selectedYear);
			$('#age').val(age);}
	});
});*/