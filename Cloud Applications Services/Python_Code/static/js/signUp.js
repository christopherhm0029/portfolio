// This ajax code allows to add and edit values from the profile.html
// At the same time allows the POST communication with flask to retrieve user inputs

$(document).ready(function(){
	$('#chris').click(function(){
		var user = $('#add-name').val();
		var modified = $('#edit-name').val();
		$.ajax({
			url: '/profileUser',
			data: $('form').serialize(),
			type: 'POST',
			success: function(response){
				console.log(response);
			},
			error: function(error){
				console.log(error);
			}
		});
	
	});
})
$(document).ready(function(){
	$('#chris2').click(function(){
		var modified = $('#edit-name').val();
		$.ajax({
			url: '/profileUser',
			data: $('form').serialize(),
			type: 'POST',
			success: function(response){
				console.log(response);
			},
			error: function(error){
				console.log(error);
			}
		});
	
	});
})
