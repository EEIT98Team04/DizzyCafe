<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DizzyCafe</title>
<style>
.minghui_send_email {
	border: 1px dashed red; width : 50%;
	margin: auto;
	margin-top: 100px;
	text-align: center;
	width: 50%;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<div class="minghui_send_email">
		<h3>您的信箱</h3>
		<input type="text" name="forgot_password">
		<button id="sent_email">sent_email</button>
	</div>
</body>

<script>
	$(function() {
		$("#sent_email").click(function() {
			var address = $('input[name="forgot_password"]').val();
			$('#sent_email').attr('disabled', true);
			$.post("/DizzyCafe/forgotPassword.controller", {
				'memberEmail' : address
			}, function(data) {
				alert(data);
				if (data == '信件已寄出') {
					window.close();
				}
				$('#sent_email').attr('disabled', false);
			});
		});
	});
</script>
</html>