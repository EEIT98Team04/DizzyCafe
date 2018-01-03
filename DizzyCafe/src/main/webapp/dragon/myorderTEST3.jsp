	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
	<script>
	$(document).ready(function(){
		load();
		function load(){
				var main_table = $('.myOrderList');
			$.getJSON('/DizzyCafe/myOrder.controller', function(json){
				
				$.each(json, function(index, value){
					
					/*訂單欄位名稱*/
					var order_thead_cell1 = $('<th></th>').text("訂單日期");
					var order_thead_cell2 = $('<th></th>').text("訂單編號");
					var order_thead_cell3 = $('<th></th>').text("運送方式");
					var order_thead_cell4 = $('<th></th>').text("付款方式");
					var order_thead_cell5 = $('<th></th>').text("總價");
					var order_thead_cell6 = $('<th></th>').text("訂單狀態");

					var order_thead_tr = $('<tr></tr>').append([order_thead_cell1, order_thead_cell2
															  , order_thead_cell3, order_thead_cell4
															  , order_thead_cell5, order_thead_cell6]);
					/*訂單table下的thead*/
					var order_thead = $('<thead></thead>').append(order_thead_tr);
					
					
					var OrdersId = json[index].autoOrderId;
					
					$.getJSON('/DizzyCafe/myOrderDetails.controller'
							, {'OrdersId': OrdersId}
							, function(details){
						/*class="detailsList" table部分*/
						/*訂單明細欄位名稱*/
						var detailsList_table_thread_td_cell1 = $('<td></td>').text("商品編號");
						var detailsList_table_thread_td_cell2 = $('<td></td>').text("商品名稱");
						var detailsList_table_thread_td_cell3 = $('<td></td>').text("單價");
						var detailsList_table_thread_td_cell4 = $('<td></td>').text("購買數量");

						var detailsList_table_thead_tr = $('<tr></tr>').append([detailsList_table_thread_td_cell1
																			  , detailsList_table_thread_td_cell2
																	    	  , detailsList_table_thread_td_cell3
																	    	  , detailsList_table_thread_td_cell4]);
						
						/*訂單table的tbody裡的訂單明細table中的明細資料table中的thead*/
						var detailsList_table_thead = $('<thead></thead>').append(detailsList_table_thead_tr);
						
						
						
						/*將所有訂單明細迴圈出來*/
						$.each(details, function(index, value){
							/*訂單明細欄位資料*/
							var detailsList_table_tbody_cell1 = $('<td></td>').text(json[index].merchandiseId);/*商品編號*/
							var detailsList_table_tbody_cell2 = $('<td></td>').text(json[index].merchandiseName);/*商品名稱*/
							var detailsList_table_tbody_cell3 = $('<td></td>').text(json[index].merchandisePrice);/*商品單價*/
							var detailsList_table_tbody_cell4 = $('<td></td>').text(json[index].buyCount);/*購買數量*/

							var detailsList_tbody_tr = $('<tr></tr>').append([detailsList_table_tbody_cell1
																			, detailsList_table_tbody_cell2
																		    , detailsList_table_tbody_cell3
																		    , detailsList_table_tbody_cell4]);
							/*訂單table的tbody裡的訂單明細table中的明細資料table中的tbody*/
							var detailsList_table_tbody = $('<tbody></tbody>').append(detailsList_table_tbody_tr);
							
						})	

						/*訂單table的tbody裡的訂單明細table中的明細資料table*/
						var detailsList_table = $('<table></table>').attr("class", "detailsList")
																	.append([detailsList_table_thead, detailsList_table_tbody]);
						
						var details_thead_th_span = $('<span></span>').attr("class", "arrow")
						  											  .text('&#9660;');
						var details_thead_th = $('<th></th>').append(details_thead_th_span);
						/*訂單table的tbody裡的訂單明細table的thead*/
						var details_thead = $('<thead></thead>').append(details_thead_th);
						/*將明細資料table放到訂單明細table的tbody*/
						var details_tbody = $('<tbody></tbody>').append(detailsList_table);
						/*將明細資料details_thead和details_tbody放到details_table裡*/
						var details_table = $('<table></table>').append([details_thead, details_tbody]);
						
					/*因為json[index].ordersDate是 {"ordersDate":{"date":20,"day":0,"hours":23
					,"minutes":59,"month":9...這種情況所已分別塞值到變數再以第一位"" 來串接成字串
					(沒有加""的話變數值會相加)*/
					var year = json[index].ordersDate.year+1900;
					var month = json[index].ordersDate.month + 1;
					var date = json[index].ordersDate.date;
					var ordersDate ="" + year + "/" + month + "/"+ date;
					
					/*訂單欄位資料*/
					var order_tbody_td_cell1 = $('<td></td>').text(ordersDate); /*訂單日期*/
					var order_tbody_td_cell2 = $('<td></td>').text(json[index].autoOrderId); /*訂單編號*/
					var order_tbody_td_cell3 = $('<td></td>').text(json[index].shipStyle); /*運送方式*/
					var order_tbody_td_cell4 = $('<td></td>').text(json[index].paymentStyle); /*付款方式*/
					var order_tbody_td_cell5 = $('<td></td>').text(json[index].totalPrice); /*總價*/
					var order_tbody_td_cell6 = $('<td></td>').text(json[index].ordersStatus); /*訂單狀態*/

					var order_tbody_tr = $('<tr><tr>').append([order_tbody_td_cell1, order_tbody_td_cell2
															 , order_tbody_td_cell3, order_tbody_td_cell4
															 , order_tbody_td_cell5, order_tbody_td_cell6]);
					/*訂單table下的tbody裡的訂單資料(後面table放訂單明細)*/
					var order_tbody = $('<tbody></tbody>').append([order_tbody_tr, details_table]);
						
					main_table.append([order_thead, order_tbody]);
					})

			});
		}
		
		$('.details').on('click', function(){
			/*測試是否點擊有反應*/
// 			alert("yesy");
			$('.detailsList').slideToggle(0);
		});
		
	});
	</script>