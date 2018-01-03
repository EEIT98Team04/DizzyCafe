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
		<table class="myOrder">
		</table>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
	<script>
	$(document).ready(function(){
		load();
		function load(){
			var main_table = $('.myOrder');
			$.getJSON('/DizzyCafe/myOrder.controller', function(json){
					$.each(json, function(index, value){
						var order_table = $('<table></table>').attr("class", "myOrderList");
						var order_thead = $('<thead></thead>');
						var order_tbody = $('<tbody></tbody>');
						
						var order_details_table = $('<table></table>').attr("class", "detailsTable");
						var order_details_thead = $('<thead></thead>').attr("class", "details");
						var order_details_tbody = $('<tbody></tbody>');
						
						var order_details_detailsList_table = $('<table></table>').attr("class", "detailsList");;
						var order_details_detailsList_thead = $('<thead></thead>');
						var order_details_detailsList_tbody = $('<tbody></tbody>');
						
						var order_thead_cell1 = $('<th></th>').text("訂單日期");
						var order_thead_cell2 = $('<th></th>').text("訂單編號");
						var order_thead_cell3 = $('<th></th>').text("運送方式");
						var order_thead_cell4 = $('<th></th>').text("付款方式");
						var order_thead_cell5 = $('<th></th>').text("總價");
						var order_thead_cell6 = $('<th></th>').text("訂單狀態");
						
						var order_thead_tr = $('<tr></tr>').append([order_thead_cell1, order_thead_cell2
																  , order_thead_cell3, order_thead_cell4
																  , order_thead_cell5, order_thead_cell6]);
						/*append到第一表格的thead*/
						order_thead.append(order_thead_tr);
						
						var year = json[index].ordersDate.year+1900;
						var month = json[index].ordersDate.month + 1;
						var date = json[index].ordersDate.date;
						var ordersDate ="" + year + "/" + month + "/"+ date;
						/**/
						/*訂單欄位資料*/
						var order_tbody_td_cell1 = $('<td></td>').text(ordersDate); /*訂單日期*/
						var order_tbody_td_cell2 = $('<td></td>').text(json[index].autoOrderId); /*訂單編號*/
						var order_tbody_td_cell3 = $('<td></td>').text(json[index].shipStyle); /*運送方式*/
						var order_tbody_td_cell4 = $('<td></td>').text(json[index].paymentStyle); /*付款方式*/
						var order_tbody_td_cell5 = $('<td></td>').text(json[index].totalPrice); /*總價*/
						var order_tbody_td_cell6 = $('<td></td>').text(json[index].ordersStatus); /*訂單狀態*/
						
						var order_tbody_tr = $('<tr></tr>').append([order_tbody_td_cell1, order_tbody_td_cell2
															     , order_tbody_td_cell3, order_tbody_td_cell4
																 , order_tbody_td_cell5, order_tbody_td_cell6]);
// 						/*append到第一表格的tbody*/
						order_tbody.append(order_tbody_tr);
// // 						/*第二表格thead中th裡的span*/
						var order_details_thead_th_span = $('<span></span>').attr("class", "arrow").html('&#9660;');
// 						/*第二表格thead中th*/											    
						var order_details_thead_td = $('<td colspan="6"></td>').attr("class", "orderDetailsThead")
																   .append(order_details_thead_th_span);
																   
// 						/*將append好的thead放到第二表格裡*/
						order_details_thead.append(order_details_thead_tr);
						/*將第二表格的thead放到第二表格的table裡*/
						order_details_table.append(order_details_thead);
						
// 						/*第三表格的thead中tr裡的td*/
// 						var order_details_detailsList_thread_tr_cell1 = $('<td></td>').text("商品編號");
// 						var order_details_detailsList_thread_tr_cell2 = $('<td></td>').text("商品名稱");
// 						var order_details_detailsList_thread_tr_cell3 = $('<td></td>').text("單價");
// 						var order_details_detailsList_thread_tr_cell4 = $('<td></td>').text("購買數量");
// 						/*把第三表格的td放進第三表格tr裡*/
// 						var order_details_detailsList_thread_tr = $('<tr></tr>')
// 																	.append([order_details_detailsList_thread_tr_cell1
// 																		   , order_details_detailsList_thread_tr_cell2
// 																		   , order_details_detailsList_thread_tr_cell3
// 																		   , order_details_detailsList_thread_tr_cell4]);
// 						/*第三表格的tr放進第三表格的thead中*/
// 						order_details_detailsList_thead.append(order_details_detailsList_thread_tr);
// 						/*將第三表格的thead放進第三表格的table裡*/
// 						order_details_detailsList_table.append(order_details_detailsList_thead);
// 						/*拿到當前迴圈的訂單邊行*/
// 						var OrdersId = json[index].autoOrderId;
						
// 						/*將訂單編號送到controller拿取訂單明細資料*/
// 						$.getJSON('/DizzyCafe/myOrderDetails.controller', {'OrdersId':OrdersId}, function(details){
// 							$.each(details, function(index, value){
// 							alert("1");
// 								var order_details_detailsList_tbody_tr_td_cell1 = $('<td></td>').text(details[index].merchandiseId);
// 								var order_details_detailsList_tbody_tr_td_cell2 = $('<td></td>').text(details[index].merchandiseName);
// 								var order_details_detailsList_tbody_tr_td_cell3 = $('<td></td>').text(details[index].merchandisePrice);
// 								var order_details_detailsList_tbody_tr_td_cell4 = $('<td></td>').text(details[index].buyCount);
// 								/*將第三表格tbody裡tr中td放進第三表格tbody的tr裡*/
// 								var order_details_detailsList_tbody_tr = $('<tr></tr>')
// 														.append([order_details_detailsList_tbody_tr_td_cell1
// 															   , order_details_detailsList_tbody_tr_td_cell2
// 															   , order_details_detailsList_tbody_tr_td_cell3
// 															   , order_details_detailsList_tbody_tr_td_cell4]);
// 								/*將第三表格tbody的tr放進第三表格的tbody裡*/
// 								order_details_detailsList_tbody.append(order_details_detailsList_tbody_tr);
// 								/*將第三表格的tbody放進第三表格table裡*/
// 								order_details_detailsList_table.append(order_details_detailsList_tbody);
// 							})
// 						})
// 						/*將第三表格table放進第二表格tbody裡*/
// 						order_details_tbody.append(order_details_detailsList_table);
// 						/*將第二表格tbody放進第二表格裡*/
// 						order_details_table.append(order_details_tbody);
// 						/*將第二表格放進第一表格的tbody裡*/
						order_tbody.append(order_details_table);
						/*將append好的第一表格thead和tbody放進外圈table*/
						order_table.append(order_thead, order_tbody);
						
						main_table.append(order_table);
					})
		})
		}
				
		$('.myOrder').on('click', function(){
			/*測試是否點擊有反應*/
// 			alert("yesy");
			$('.detailsList').slideToggle(0);

		});
		
	});
	</script>
</body>
</html>