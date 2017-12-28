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
		<div class="myOrderList">
		</div>
	<script>
	$(document).ready(function(){
		load();
		function load(){
			var main_table = $('.myOrderList');
			$.getJSON('/DizzyCafe/myOrder.controller', function(json){
				$.each(json, function(index, value){
					/*定義myorder table thead tbody*/
					var myOrder_table = $('<table></table>').attr("id", index+1).attr("class", "myOrder");
					var myOrder_thead = $('<thead></thead>');
					var myOrder_tbody = $('<tbody></tbody>');
					
					var myOrder_thead_tr_cell1 = $('<th></th>').text("訂單日期");
					var myOrder_thead_tr_cell2 = $('<th></th>').text("訂單編號");
					var myOrder_thead_tr_cell3 = $('<th></th>').text("運送方式");
					var myOrder_thead_tr_cell4 = $('<th></th>').text("付款方式");
					var myOrder_thead_tr_cell5 = $('<th></th>').text("總價");
					var myOrder_thead_tr_cell6 = $('<th></th>').text("訂單狀態");
					
					var myOrder_thead_tr = $('<tr></tr>').append([myOrder_thead_tr_cell1, myOrder_thead_tr_cell2
																, myOrder_thead_tr_cell3, myOrder_thead_tr_cell4
																, myOrder_thead_tr_cell5, myOrder_thead_tr_cell6]);
					myOrder_thead.append(myOrder_thead_tr);
					
					
					var year = json[index].ordersDate.year+1900;
					var month = json[index].ordersDate.month + 1;
					var date = json[index].ordersDate.date;
					var ordersDate ="" + year + "/" + month + "/"+ date;
					/**/
					/*訂單欄位資料*/
					var myOrder_tbody_tr_cell1 = $('<td></td>').text(ordersDate); /*訂單日期*/
					var myOrder_tbody_tr_cell2 = $('<td></td>').text(json[index].autoOrderId); /*訂單編號*/
					var myOrder_tbody_tr_cell3 = $('<td></td>').text(json[index].shipStyle); /*運送方式*/
					var myOrder_tbody_tr_cell4 = $('<td></td>').text(json[index].paymentStyle); /*付款方式*/
					var myOrder_tbody_tr_cell5 = $('<td></td>').text(json[index].totalPrice); /*總價*/
					var myOrder_tbody_tr_cell6 = $('<td></td>').text(json[index].ordersStatus); /*訂單狀態*/
					
					var myOrder_tbody_tr = $('<tr></tr>').append([myOrder_tbody_tr_cell1, myOrder_tbody_tr_cell2
														      , myOrder_tbody_tr_cell3, myOrder_tbody_tr_cell4
															  , myOrder_tbody_tr_cell5, myOrder_tbody_tr_cell6]);
					myOrder_tbody.append(myOrder_tbody_tr);
					
					
					var myOrder_tbody_tr_td_sapn = $('<span></span>').attr("class", "arrow").html('&#9660');
					var myOrder_tbody_tr_td = $('<td></td>').attr("colspan", "6").append(myOrder_tbody_tr_td_sapn);
					var myOrder_tbody_tr = $('<tr></tr>').attr("class", "click").append(myOrder_tbody_tr_td);
					myOrder_tbody.append(myOrder_tbody_tr);
					
					myOrder_table.append([myOrder_thead, myOrder_tbody]);
					main_table.append(myOrder_table);

					
					/*定義detailsList div table thead tbody*/
					var detailsList = $('<div></div>').attr("id", "details"+(index+1)).attr("class", "detailsList");
					
					var detailsListTable = $('<table></table>').attr("class", "myOrder");
					var detailsListTable_thead = $('<thead></thead>');
					var detailsListTable_tbody = $('<tbody></tbody>');
					
					/*訂單明細欄位*/
					var detailsListTable_thead_tr_cell1 = $('<td></td>').text("商品編號");
					var detailsListTable_thead_tr_cell2 = $('<td></td>').text("商品名稱");
					var detailsListTable_thead_tr_cell3 = $('<td></td>').text("單價");
					var detailsListTable_thead_tr_cell4 = $('<td></td>').text("購買數量");
					
					var detailsListTable_thead_tr = $('<tr></tr>').append([detailsListTable_thead_tr_cell1, 
																		 , detailsListTable_thead_tr_cell2
																		 , detailsListTable_thead_tr_cell3
																		 , detailsListTable_thead_tr_cell4]);
					detailsListTable_thead.append(detailsListTable_thead_tr);
					
					
					var OrdersId = json[index].autoOrderId;
					$.getJSON('/DizzyCafe/myOrderDetails.controller', {'OrdersId':OrdersId}, function(details){
						$.each(details, function(index, value){
							var detailsListTable_tbody_tr_cell1 = $('<td></td>').text(details[index].merchandiseId);
							var detailsListTable_tbody_tr_cell2 = $('<td></td>').text(details[index].merchandiseName);
							var detailsListTable_tbody_tr_cell3 = $('<td></td>').text(details[index].merchandisePrice);
							var detailsListTable_tbody_tr_cell4 = $('<td></td>').text(details[index].buyCount);
							
							var detailsListTable_tbody_tr = $('<tr></tr>')
													.append([detailsListTable_tbody_tr_cell1
														   , detailsListTable_tbody_tr_cell2
														   , detailsListTable_tbody_tr_cell3
														   , detailsListTable_tbody_tr_cell4]);
							
							detailsListTable_tbody.append(detailsListTable_tbody_tr);
						
							detailsListTable.append(detailsListTable_tbody);
						})
					})
					
					detailsListTable.append(detailsListTable_thead);
					
					detailsList.append(detailsListTable);
					
					main_table.append(detailsList);
				})
							
			})
		}	
		$('.myOrderList').on('click', '.click', function(){
			var detailsId = "details" + $(this).parents('table').attr("id");
// 			alert(detailsId);
			var arrow = $('.arrow').html();
// 			if(arrow='&#9660'){
// 				$('.arrow').html('&#9650');
// 			}
// 			else{
// 				$('.arrow').html('&#9660');
// 			}
			$('#'+ detailsId + '').slideToggle(500);
		});
		
	});
	</script>
</body>
</html>