<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DizzyCafe backstage</title>
<jsp:include page="../HTML/TitleIcon.jsp" />
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">
<jsp:include page="/backstage/header.jsp"></jsp:include>
<div class="content-wrapper">
    <div class="container-fluid">  
		
	  <div class="card mb-3">
        <div class="card-header">
          <i class="fa fa-area-chart"></i> 每日網站人氣</div>
        <div class="card-body">
          	<canvas id="myAreaChart" width="100%" height="30%"></canvas> 
        </div>
        <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
      </div>
	    
	</div>
</div>

<jsp:include page="/backstage/footer.jsp"></jsp:include>
    <!-- Page level plugin JavaScript-->
    <script src="vendor/chart.js/Chart.min.js"></script>
    <!-- Custom scripts for this page-->
    <script src="js/sb-admin-charts.min.js"></script>
</body>
</html>
