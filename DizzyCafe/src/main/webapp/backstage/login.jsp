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
  <title>login</title>
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
      <div class="card-header">Login</div>
      <div class="card-body">
        <form action="${pageContext.request.contextPath }/backstage/login.controller" method="post">
          <div class="form-group">
            <label for="exampleInputEmail1">Account</label>
            <input class="form-control" value="${param.account}" id="exampleInputAccount" name="account" type="text" aria-describedby="emailHelp" placeholder="Enter account">
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">Password</label>
            <input class="form-control" id="exampleInputPassword1" name="pwd" type="password" placeholder="Password">
          </div>
          <div class="form-group text-center">
	          <input id="manager_login" type="submit" class="btn btn-primary btn-block" style="cursor: pointer;" value="Login"></input>
          </div>
          <div class="form-group text-center">
	          <p>${error}</p>
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
  $('#manager_login').on('click',function(e){
	if(!$('#exampleInputAccount').val().trim() || !$('#exampleInputPassword1').val().trim()){
		e.preventDefault();
		$('div.form-group>p').text('cannot be null');
	}
  });
  	
  </script>

</body>

</html>