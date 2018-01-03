<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>Dizzy Cafe</title>
<!--     <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/> -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.css"/>
</head>
<body>
	<jsp:include page="/backstage/header.jsp"></jsp:include>
	<div class="content-wrapper">

		<div class="container-fluid">
			<ol class="breadcrumb">
				<li class="breadcrumb-item">
					<a href="${pageContext.request.contextPath}/backstage/index.jsp">回首頁</a>
					</li>
				<li class="breadcrumb-item active">訂單管理</li>
			</ol>
			
			<div class="row">
				<div class="col-12"></div>
			</div>
		
			<div>
				<table style="text-align: center;" id="orderTable"></table>
			</div>
			
		</div>
	</div>
	
<jsp:include page="/backstage/footer.jsp"></jsp:include>

 	<script src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
 	<script> 
 	$('#orderTable').DataTable({
					ajax : {
						url:'/DizzyCafe/selectUnpaidOrder.controller',
						type:'POST',
						dataSrc: ''
					},
					columns:[{
						data:'ordersDate',
						title:'訂單日期',
						width:'5%',
					},{
						data:'autoOrderId',
						title:'訂單編號',
						width:'5%',
					},{
						data:'memberId',
						title:'會員編號',
						width:'5%',
					},{
						data:'buyer',
						title:'買家姓名',
						width:'5%',
					},{
						data:'shipPhone',
						title:'手機號碼',
						width:'5%',
					},{
						data:'shipAddress',
						title:'寄送地址',
						width:'5%',
					},{
						data:'storeName',
						title:'寄送門市',
						width:'5%',
					},{
						data:'shipStyle',
						title:'運送方式',
						width:'5%',
					},{
						data:'paymentStyle',
						title:'付款方式',
						width:'5%',
					},{
						data:'totalPrice',
						title:'總價',
						width:'5%',
					},{
						data:'ordersStatus',
						title:'訂單狀態',
						width:'5%',
					}]
// 					,"columnDefs" : [{
// 						"targets" : 11,
// 						"data" : null,
// 						"render" : function(data,row) {
// 							var html = "<a href='${pageContext.request.contextPath}//backstage/courseFillBackUpdate.controller?courseId="+data.courseId+"' class='btn btn-success' id='edit"+data.courseId+"'><i class='fa fa-pencil' aria-hidden='true'></i></a>";
// 							return html;
// 						}
// 					}],
// 					language : {
// 						paginate : {
// 							next : "下一頁",
// 							previous : "上一頁"
// 						},
// 						lengthMenu : '一頁顯示 _MENU_ 筆資料'
// 					},
// 					info : false,
// 					order : [0,'desc']
				});
	
 	</script> 
</body>
</html>