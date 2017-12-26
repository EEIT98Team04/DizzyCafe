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
	<article class="article"> 如果是使用者點選的按鈕，由使用者送出資料的前面都要加
	${pageContext.request.contextPath}
	<form action="" method="post">
		<table>
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
				<table>
					<thead class="details">
						<th><span class="arrow">&#9660;</span></th>
					</thead>
					<tbody>
						<table  class="detailsList">
							<thead>
								<tr>
									<td>商品編號</td>
									<td>商品名稱</td>
									<td>單價</td>
									<td>購買數量</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>藍山咖啡</td>
									<td>150</td>
									<td>10</td>
								</tr>
							</tbody>
						</table>
					</tbody>
				</table>
			</tbody>
		</table>
	</form>
	
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
	<script>
	$(document).ready(function(){
// 		load();
// 		function load(){
// 			$.getJSON('/DizzyCafe/myOrder.controller', function(json){
// 				$.each(json, function(index, value){
// 					/*訂單明細欄位名稱*/
// 					var details_thread_cell1 = $('<td></td>').text("商品編號");
// 					var details_thread_cell2 = $('<td></td>').text("商品名稱");
// 					var details_thread_cell3 = $('<td></td>').text("單價");
// 					var details_thread_cell4 = $('<td></td>').text("購買數量");

// 					var details_thread_tr = $('<tr></tr>').append([details_thread_cell1, details_thread_cell2
// 																 , details_thread_cell3, details_thread_cell4]);
// 					/*訂單明細欄位資料*/
// 					var details_tbody_cell1 = $('<td></td>').text(json[index].merchandiseId);/*商品編號*/
// 					var details_tbody_cell2 = $('<td></td>').text(json[index].merchandiseName);/*商品名稱*/
// 					var details_tbody_cell3 = $('<td></td>').text(json[index].merchandisePrice);/*商品單價*/
// 					var details_tbody_cell4 = $('<td></td>').text(json[index].buyCount);/*購買數量*/

// 					var details_tbody_tr = $('<tr></tr>').append([details_tbody_cell1, details_tbody_cell2
// 																, details_tbody_cell3, details_tbody_cell4]);

// 					var details_table = $('<table></table>').attr("class", "detailsList")
// 										.append([details_thread_tr, details_tbody_tr]);

// 					/*訂單欄位資料*/
// 					var order_tbody_td_cell1 = $('<td></td>').text(json[index].ordersDate); /*訂單日期*/
// 					var order_tbody_td_cell2 = $('<td></td>').text(json[index].autoOrderId); /*訂單編號*/
// 					var order_tbody_td_cell3 = $('<td></td>').text(json[index].shipStyle); /*運送方式*/
// 					var order_tbody_td_cell4 = $('<td></td>').text(json[index].paymentStyle); /*付款方式*/
// 					var order_tbody_td_cell5 = $('<td></td>').text(json[index].totalPrice); /*總價*/
// 					var order_tbody_td_cell6 = $('<td></td>').text(json[index].ordersStatusId); /*訂單狀態*/

// 					var order_tbody_tr = $('<tr><tr>').append([order_tbody_td_cell1, order_tbody_td_cell2
// 															 , order_tbody_td_cell3, order_tbody_td_cell4
// 															 , order_tbody_td_cell5, order_tbody_td_cell6]);
// 					var order_tbody = $('<tbody></tbody>').append([order_tbody, details_table]);

// 					/*訂單欄位名稱*/
// 					var order_thead_cell1 = $('<th></th>').text("訂單日期");
// 					var order_thead_cell2 = $('<th></th>').text("訂單編號");
// 					var order_thead_cell3 = $('<th></th>').text("運送方式");
// 					var order_thead_cell4 = $('<th></th>').text("付款方式");
// 					var order_thead_cell5 = $('<th></th>').text("總價");
// 					var order_thead_cell6 = $('<th></th>').text("訂單狀態");

// 					var order_thead_tr = $('<tr></tr>').append([order_thead_cell1, order_thead_cell2, order_thead_cell3
// 															  , order_thead_cell4, order_thead_cell5, order_thead_cell6]);
// 					var order_thead = $('<thead></thead>').append(order_thead_tr);

// 					var order_table = $('<table></table>').append([order_thead, order_tbody ]);
// 				});
// 			});
// 		}
		
		$('.details').on('click', function(){
			/*測試是否點擊有反應*/
// 			alert("yesy");
			$('.detailsList').slideToggle(0);
			
			$.post('/DizzyCafe/myOrder.controller', function(json){
					/*測試是否有拿取到資料*/
// 					alert(json[0].merchandiseName);

					/*測試是否有迴圈列出merchandiseName*/
					$.each(json, function(index, value){
						var 
						alert(json[index].ordersDate.year+1900 json[index].ordersDate.month+1);
					});
					/*測試是否可以直接相乘算出總價*/
// 					alert(json[index].merchandisePrice * json[index].buyCount);						
				}
			);
		});
		
	});
	</script>
</body>
</html>