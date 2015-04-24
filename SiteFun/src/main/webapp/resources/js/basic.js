$(document).ready(function() {
	$('#newComment').submit(function() {
		$.ajax({
			url : $("#newComment").attr( "action"),
			type : 'POST',
			dataType : 'json',
			data : $('#newComment').serialize(),
			success : function(data) {
				if (data.isValid) {
					$('#hideLogin').show();
					$('#getcomment').html(data.comment);
					$('#getcomment').slideDown("slow");		
				} else {
					alert('You have not written anything!');
				}
			}

		});
			return false;
	});
});
