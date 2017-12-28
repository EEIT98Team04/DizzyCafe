<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/dragon/css/myorder.css" />
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/HTML/Navbar.jsp" />
	<article class="article">
		<table id="1" class="myOrder">
			<thead>
				<tr>
					<th>訂單日期</th>
					<th>訂單編號</th>
					<th>運送方式</th>
					<th>付款方式</th>
					<th>總價</th>
					<th>訂單狀態</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>20121125</td>
					<td>1001</td>
					<td>甩尾</td>
					<td>不付</td>
					<td>0</td>
					<td>劫標中</td>
				</tr>
				<tr class="click">
					<td colspan="6"><span class="arrow">&#9660;</span></td>
				</tr>
			</tbody>
		</table>

		<div id="table1" class="detailsList">
			<table class="detailsListTable">
				<thead>
					<tr class="detailsListName">
						<td>商品編號</td>
						<td>商品名稱</td>
						<td>單價</td>
						<td>購買數量</td>
					</tr>
				</thead>
				<tbody>
					<tr >
						<td>1</td>
						<td>藍山咖啡</td>
						<td>150</td>
						<td>10</td>
					</tr>
				</tbody>
			</table>
		</div>
			<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
	<script>
	$(document).ready(function(){	
		$('.click').on('click', function(){
			/*測試是否點擊有反應*/
// 			alert("yesy");
			$('.detailsList').slideToggle(1500);

		});
		
	});
	</script>
</body>
</html>