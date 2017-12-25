<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/dragon/css/shoppingCartStyle.css" />
<title>shopping</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="/HTML/Navbar.jsp" />
	<article class="article">
	<!-- 	如果是使用者點選的按鈕，由使用者送出資料的前面都要加 ${pageContext.request.contextPath}-->
	<form action="<c:url value="/shopping/shoppingCart.controller"/>"
		method="post">
		<table id="showLsit">
			<thead>
				<tr>
					<th></th>
					<th>商品編號</th>
					<th>商品名稱</th>
					<th>單價</th>
					<th>商品數量</th>
					<th>小計</th>
					<th><a href="${pageContext.request.contextPath}/shopping/shoppingCart.controller">購物</a></th>
				</tr>
			</thead>
			<c:if test="${not empty result}">
				<tbody>
<%-- 					<c:forEach var="i" begin="0" end="${count}" step="1"> --%>
<!-- 						<tr> -->
<%-- 							<td>${i+1}</td> --%>
<%-- 							<td>${merchandiseId[i]}</td> --%>
<%-- 							<td>${merchandiseName[i]}</td> --%>
<%-- 							<td>${merchandisePrice[i]}</td> --%>
<!-- 							<td> -->
<!-- 							<select name="defaultSelect"  style="width: 45px;text-align: right;"> -->

<!-- 							</select></td> -->
<%-- 							<td>${merchandisePrice[i] * buyCount[i]}</td> --%>
<!-- 							<td><button name="delete" type="button">刪除</button></td> -->
<!-- 						</tr> -->
<%-- 					</c:forEach> --%>
				</tbody>
			</c:if>
		</table>
	</form>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
	<script>
	$(document).ready(function(){
		
		load();
		function load(){
			$.getJSON('/DizzyCafe/selectShopping.controller', function(json){
				var tb = $('#showLsit>tbody');
				/*function(index, value) 裡面的index, value為固定寫法，不可更改*/
				$.each(json, function(index, value){
					/*測試是否有回圈index 0 1 2 3*/
//					alert(index);
					
					/*下拉選單選項*/
					var option1 = $('<option></option>').attr("value","1").text("1");
					var option2 = $('<option></option>').attr("value","2").text("2");
					var option3 = $('<option></option>').attr("value","3").text("3");
					var option4 = $('<option></option>').attr("value","4").text("4");
					var option5 = $('<option></option>').attr("value","5").text("5");
					var option6 = $('<option></option>').attr("value","6").text("6");
					var option7 = $('<option></option>').attr("value","7").text("7");
					var option8 = $('<option></option>').attr("value","8").text("8");
					var option9 = $('<option></option>').attr("value","9").text("9");
					var option10 = $('<option></option>').attr("value","10").text("10");
					var select = $('<select></select>')
								.attr("name", "defaultSelect")
								.append([option1, option2, option3, option4, option5, option6, option7, option8, option9, option10]);
				
					var cell1 = $('<td></td>').text(index+1);
					var cell2 = $('<td></td>').text(json[index].merchandiseId);
					var cell3 = $('<td></td>').text(json[index].merchandiseName);
					var cell4 = $('<td></td>').text(json[index].merchandisePrice);
					var cell5 = $('<td></td>').append(select.val(json[index].buyCount));						
					var cell6 = $('<td></td>').text(json[index].merchandisePrice * json[index].buyCount);
					var cell7 = $('<td></td>').html('<button class="btn btn-danger">刪除 </button>');
					
					var row = $('<tr></tr>').append([cell1, cell2, cell3, cell4, cell5, cell6, cell7]);
					tb.append(row);	
				});
					var submit = $('<tr></tr>').html('<button class="Checkout">下一步</button>');
					tb.append(submit);

			});
		};

		/*點擊後抓取當前商品ID後將ID傳給controler*/
		$('#showLsit>tbody').on('click', 'tr>td>button', function(){
<%-- 			var memberId = "<%=session.getAttribute("user")%>"; --%>
			var merchandiseId = $(this).parents('tr').find('td:nth-child(2)').text();
			
			/*找到tbody*/
			var tb = $('#showLsit>tbody');
			/*清空tbody底下所有元素(將舊表格刪除)*/
			tb.empty();
// 			var merchandiseId = ${merchandiseId};
// 			var merchandiseName = $(this).parents('tr').find('td:nth-child(2)').text();
// 			alert(merchandiseId);
			$.post('/DizzyCafe/merchandiseDelete.controller', {
				'MerchandiseId': merchandiseId
				}, function(json){
					/*測試是否有拿取到資料*/
// 					alert(json[0].merchandiseName);

					/*測試是否有迴圈列出merchandiseName*/
// 					alert(json[index].merchandiseName);
						
					/*測試是否可以直接相乘算出總價*/
// 					alert(json[index].merchandisePrice * json[index].buyCount);						
				
					load();	
				}
			);
		});
		/*如果把$select改成其他變數就沒反應*/
		
		$('#showLsit>tbody').on('change', 'tr>td>select', function(){
			var merchandiseId = $(this).parents('tr').find('td:nth-child(2)').text();
			var amount =  $(this).parents('tr').find('select').val();
			/*測試抓取當行  購買數量值*/
// 			alert(amount);
			var total = $(this).parents('tr').find('td:nth-child(4)').text();
			/*測試是否有抓到當行  單價欄位值*/
// 			alert(total);
			
			/*測試抓取當行  總價欄位值*/
// 			alert($(this).parents('tr').find('td:nth-child(6)').text());
			/*測試重新選取完數量*單價*/
// 			alert(amount*total);
			/*給予更改數量後總價的變動數值*/
			$(this).parents('tr').find('td:nth-child(6)').text(total*amount);

			
// 			$('select[name="defaultSelect"] option[name="defaultCount"]').remove();
			
			
			$.post('/DizzyCafe/amountChange.controller',{
				'MerchandiseId': merchandiseId,
				'Amount': amount
				});
		});
	});
	</script>
</body>
</html>