<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>DizzyCafe</title>
<!-- Bootstrap core CSS-->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom fonts for this template-->
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<!-- Custom styles for this template-->
<link href="css/sb-admin.css" rel="stylesheet">
<link href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" rel="stylesheet">
<jsp:include page="../HTML/TitleIcon.jsp" />
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<jsp:include page="/backstage/index.jsp"></jsp:include>
	<div class="content-wrapper">
		<div class="container-fluid">
			<!-- Breadcrumbs-->
			<ol class="breadcrumb">
				<li class="breadcrumb-item">
					<a href="${pageContext.request.contextPath}/backstage/index.jsp">回首頁</a>
					</li>
				<li class="breadcrumb-item active">課程管理</li>
				<li class="breadcrumb-item">
					<a href="${pageContext.request.contextPath}/backstage/CourseCalendar.jsp">行事曆</a></li>
			</ol>
			<div class="row">
				<div class="col-12"></div>
			</div>
			
			
			
			<div>
				<table style="text-align: center;" id="dataTable"></table>
			</div>

			<a style="margin-left:680px;" href="${pageContext.request.contextPath}/backstage/courseNew.jsp"><button class="btn btn-primary">新增</button></a>
		</div>
	</div>
 	<script src="//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"></script> 
 	<script src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
 	<script> 
 	//顯示資料表dataTable
 	$('#dataTable').DataTable({
					ajax : {
						url:'/DizzyCafe/showCourseInBackstage.controller',
						type:'POST',
						dataSrc: ''
					},
					columns:[{
						data:'courseId',
						title:'編號',
						width:'10%',
					},{
						data:'courseName',
						title:'名稱',
						width:'10%',
					},{
						data:'courseCost',
						title:'價格',
						width:'10%',
					},{
						data:'courseTeacher',
						title:'老師名稱',
						width:'10%',
					},{
						data:'courseBegin',
						title:'開始時間',
						width:'10%',
					},{
						data:'courseEnd',
						title:'結束',
						width:'10%',
					},{
						data:'courseSignupBegin',
						title:'報名開始日期',
						width:'10%',
					},{
						data:'courseSignupEnd',
						title:'報名結束日期',
						width:'10%',
					},{
						data:'courseLimit',
						title:'人數上限',
						width:'10%',
					}],
					"columnDefs" : [{
						"targets" : 9,
						"data" : null,
						"render" : function(data,row) {
							var html = "<a href='${pageContext.request.contextPath}//backstage/courseFillBackUpdate.controller?courseId="+data.courseId+"' class='btn btn-success' id='edit"+data.courseId+"'><i class='fa fa-pencil' aria-hidden='true'></i></a>";
							return html;
						}
					}],
					language : {
						paginate : {
							next : "下一頁",
							previous : "上一頁"
						},
						lengthMenu : '一頁顯示 _MENU_ 筆資料'
					},
					info : false,
					order : [0,'desc']
				});
	
 	</script> 
	<jsp:include page="/backstage/footer.jsp"></jsp:include>
</body>
</html>