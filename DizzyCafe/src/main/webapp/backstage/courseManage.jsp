<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>Dizzy Cafe</title>
  <link rel="stylesheet" href='${pageContext.request.contextPath }/minghui/css/minghui.css'>
  <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css" />
  <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>

</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
<%-- 	<jsp:include page="/backstage/header.jsp"></jsp:include> --%>
	<div class="content-wrapper">
		<div class="container-fluid">
	    	<table id="test"></table>
    	</div>
    
  	</div>
      
      
      
      
<!--     <script type="text/javascript" -->
<!-- 		src="//code.jquery.com/jquery-2.2.4.min.js"></script> -->
	<script type="text/javascript"
		src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#test').DataTable({
				ajax : {
					url : '/DizzyCafe/coupons.controller',
					type : 'POST',
// 					dataSrc : ''
					dataSrc : 
						function ( json ) {
							var result = {};
	      					for ( var i=0, ien=json.length ; i<ien ; i++ ) {
	        					if(json[i].couponStatus == 0){
	        						json[i].couponStatus = '未使用';
	        					}else if(json[i].couponStatus == 1){
	        						json[i].couponStatus = '已使用';
	        					}else if(json[i].couponStatus == 2){
	        						json[i].couponStatus = '已過期';
	        					}
	        					result
	      					}
	      					console.log(json);
	      				return json;
	    				}
				},
				columns : [ {
					data : 'eventDiscount',
					title : 'Discount'
				}, {
					data : 'couponDeadline',
					title : 'Deadline'
				}, {
					data : 'merchandiseId',
					title : 'MerchandiseId'
				}, {
					data : 'couponStatus',
					title : 'Status'
				} ],
				language : {
					paginate : {
						next : "下一頁",
						previous : "上一頁"
					},
					lengthMenu : '一頁顯示 _MENU_ 筆資料'
				},
				info : false,
				order : [3,'desc']
			});
		});
	</script>
  	<jsp:include page="/backstage/footer.jsp"></jsp:include>   

</body>
</html>