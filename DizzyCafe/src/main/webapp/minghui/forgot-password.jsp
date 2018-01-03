<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>reset password</title>
  <!-- Bootstrap core CSS-->  
  <link href="${pageContext.request.contextPath}/backstage/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->  
  <link href="${pageContext.request.contextPath}/backstage/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template--> 
  <link href="${pageContext.request.contextPath}/backstage/css/sb-admin.min.css" rel="stylesheet">
</head>

<body class="bg-dark">
  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">Reset Password</div>
      <div class="card-body">
        <div class="text-center mt-4 mb-5">
          <h4>Forgot your password?</h4>
          <p>Enter your email address and we will send you instructions on how to reset your password.</p>
        </div>
        <form>
          <div class="form-group">
            <input class="form-control" name="forgot_password" id="exampleInputEmail1" type="email" aria-describedby="emailHelp" placeholder="Enter email address">
          </div>
          <div class="text-center">
          	<button type="button" id="sent_email" style="cursor: pointer" class="btn btn-primary">send_email</button>
          </div>
        </form>
      </div>
    </div>
  </div>
  <!-- Bootstrap core JavaScript-->  
  <script src="${pageContext.request.contextPath}/backstage/vendor/jquery/jquery.min.js"></script>  
  <script src="${pageContext.request.contextPath}/backstage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Core plugin JavaScript-->  
  <script src="${pageContext.request.contextPath}/backstage/vendor/jquery-easing/jquery.easing.min.js"></script>
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
</body>
</html>