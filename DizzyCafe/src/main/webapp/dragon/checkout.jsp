<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/dragon/css/checkout.css" />
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/HTML/Navbar.jsp" />
	<div class="article" id="test">
	<br>
		<div class="shipmain">
		<h4 class="selectShipTitle">運送方式</h4>
			<ul class="selectShip">
<!-- 				list-style控制li前面點的樣式 -->
<!-- 				將name名稱都取一樣，選擇時就會擇一選擇，1預設，點2時就會把1的預設用掉 -->
				<li>
					<label>
						<input type="radio" name="optionsRadios" value="郵寄到府" checked="checked">
						<span>郵寄到府</span>
					</label>
				</li>
				
				<li>
					<label>
						<input type="radio" name="optionsRadios" value="貨到付款">
						<span>貨到付款</span>
						
					</label>
				</li>
				
				<li>
					<label>
						<input type="radio" name="optionsRadios" value="超商取貨">
						<span>超商取貨</span>
					</label>
				</li>
				
				<li class="shipCostCell">
					<label>
						<span>+運費 : </span>
						<span name="shipCost">80</span>
						<span> 元</span>
					</label>
				</li>
			</ul>
			<hr>
			<div class="totalPrice" style="width: 300px;margin: auto;text-align: right;">
				<label>
						<span>應付總金額: </span>
						<span class="payPrice"></span>
						<span> 元</span>
					</label>
			</div>
		</div>
		
	<div class="userdata">
		<h4 class="titleName">取件人資料</h4>
		<div class="selectuserdata">
			<label>
				<input id="checkbox" type="checkbox" >
				<span>同會員資料</span>
			</label>
		</div>
		<form action="<c:url value=""/>" method="post">

		</form>
	</div>
	</div>
	
	

	
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
	<link type="text/css" rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css"/>
	<link rel="stylesheet" href='<c:url value="/minghui/css/minghui.css" />'>
	<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
	<script>
	
	
	$(document).ready(function(){
		
		loadCheckout1();
		
		/*測試讀取貨到付款超商取貨等的val*/
		$('input[name="optionsRadios"]').on('click', function(){
			/*抓當前運送方式*/
			var shipment= $(this).val();
			/*測試是否抓取*/
//			alert(shipment);
			
			/*抓運費的價格*/
			var shipCost = $('span[name="shipCost"]');
			
			/*javascript沒有else if語法所以都用if，用return就可以中斷下面的程式*/
			if(shipment=='郵寄到府'){
//				alert("2");
				$('input[name="shipAddress"]').val("");
				$('input[name="storeName"]').val("無");
				$('input[name="storAddress"]').val("無");
				$('span[name="shipCost"]').text('80')
				
				loadCheckout1();
				
				return;
			}
			if(shipment=='貨到付款' || '超商取貨'){
//				alert("1");
// 				shipAddress.val("無");
				$('input[name="shipAddress"]').val("無");
				$('span[name="shipCost"]').text('60')
				
				loadCheckout2();
				
				return;
			}
		});
		
		$('#checkbox').on('click', function(){
			/*抓取布林值判斷是否勾選*/
			var checkbox = $('#checkbox').prop("checked");
			if(checkbox == true){
// 				alert(checkbox);
				$('input[name="buyer"]').val('${user.memberName}');
				$('input[name="shipPhone"]').val('${user.memberPhone}');
				$('input[name="shipAddress"]').val('${user.memberAddress}');
			}
			else{
				$('input[name="buyer"]').val('');
				$('input[name="shipPhone"]').val('');
				$('input[name="shipAddress"]').val('');
			}
		});

	});
	
	/*郵寄到府*/
	function loadCheckout1(){
		var userdata_form = $('.userdata>form')
		$('#checkbox').prop("checked", false);
		userdata_form.empty();

		var buyer_div = $('<div></div>').attr("class", "divstyle");
		var buyer_label = $('<label></label>').text("姓名：");
		var buyer_input = $('<input>').attr("type","text")
		  							  .attr("size", "10")
		    						  .attr("maxlength", "30")
		     						  .attr("name", "buyer")
		var buyer_span = $('<span></span>').text('');
		buyer_div.append([buyer_label, buyer_input, buyer_span]);


		var phone_div = $('<div></div>').attr("class", "divstyle");
		var phone_label = $('<label></label>').text("手機：");
		var phone_input = $('<input><').attr("type","text")
		  							   .attr("size", "10")
		  							   .attr("maxlength", "30")
		  							   .attr("name", "shipPhone")
		var phone_span = $('<span></span>').text('');
		phone_div.append([phone_label, phone_input, phone_span]);


		var address_div = $('<div></div>').attr("class", "divstyle");
		var address_label = $('<label></label>').text("地址：");
		var address_input = $('<input>').attr("type","text")
		    							.attr("size", "50")
		    							.attr("maxlength", "30")
		    							.attr("name", "shipAddress")
		var address_span = $('<span></span>').text('');
		address_div.append([address_label, address_input, address_span]);		
		   
		var playment_div = $('<div></div>').attr("class", "divstyle");
		var playment_label = $('<label></label>').text("付款：");
		var playment_select = $('<select></select>').attr("class", "playment");
		var playment_option1 = $('<option></option>').attr("value", "請選擇付款方式")
													 .text("請選擇付款方式");
		var playment_option2 = $('<option></option>').attr("value", "信用卡扣款")
													 .text("信用卡扣款");
		var playment_option3 = $('<option></option>').attr("value", "ATM轉帳")
													 .text("ATM轉帳");
		playment_select.append([playment_option1, playment_option2, playment_option3]);
		playment_div.append([playment_label, playment_select]);
		var check_button = $('<input>').attr("class", "check btn btn-primary")
		    							.attr("type", "submit")
		    							.attr("value", "確定");
		
		loadTotal1();
		
		userdata_form.append([buyer_div, phone_div, address_div, playment_div, check_button]);
		$('.check').on('click', function(e){
			e.preventDefault();
			var buyer = $('input[name="buyer"]').val();
			var shipPhone = $('input[name="shipPhone"]').val();
			var shipAddress = $('input[name="shipAddress"]').val();
			var storeName = $('.storeName').text();
			var storAddress;
			var shipment = $('input[name="optionsRadios"]:checked').val();
			var shipCost = $('span[name="shipCost"]').text();
			console.log(shipment);		
			var playment = $('.playment').val();
			var TotalPrice = $('.payPrice').text();
			
			if(shipment=='郵寄到府'){
				$.post('/DizzyCafe/insertOrder.controller',{
					'buyer':buyer,
					'shipPhone':shipPhone,
					'ShipAddress':shipAddress,
					'StoreName':'無',
					'storAddress':'無',
					'shipment':shipment,
					'ShipCost':shipCost,
					'playment':playment,
					'TotalPrice':TotalPrice
				}, function(e){
// 					alert("訂單完成");
// 					location.replace('/DizzyCafe/dragon/myorder.jsp');
					$.post('/DizzyCafe/checkoutjiijij.hohoho',function(str){
//	 					console.log(str);
						$('#test').html(str);
					});
				})
			}
		
		});
		
	};
	
	/*貨到付款 and 超商取貨*/
	function loadCheckout2(){
		var userdata_form = $('.userdata>form');
		var shipment = $('input[name="optionsRadios"]:checked').val();
		$('#checkbox').prop("checked", false);
		userdata_form.empty();

		var buyer_div = $('<div></div>').attr("class", "divstyle");
		var buyer_label = $('<label></label>').text("姓名： ");
		var buyer_input = $('<input>').attr("type","text")
		      						  .attr("size", "10")
		      						  .attr("maxlength", "30")
		      						  .attr("name", "buyer")
		var buyer_span = $('<span></span>').text('');
		buyer_div.append([buyer_label, buyer_input, buyer_span]);


		var phone_div = $('<div></div>').attr("class", "divstyle");
		var phone_label = $('<label></label>').text("手機： ");
		var phone_input = $('<input><').attr("type","text")
		      						   .attr("size", "10")
		      						   .attr("maxlength", "30")
		      						   .attr("name", "shipPhone")
		var phone_span = $('<span></span>').text('');
		phone_div.append([phone_label, phone_input, phone_span]);


		var store_div = $('<div></div>').attr("class", "divstyle");
		var store_label = $('<label></label>').text("門市：");
		var store_button = $('<button></button>').attr("class", "selectStore")
		      					 				 .text('選擇門市');
		var store_span = $('<span></span>').attr("class", "storeName")
										   .attr("name", "storeName");
		store_div.append([store_div, store_label, store_button, store_span]);		

		if(shipment=='超商取貨'){
			var playment_div = $('<div></div>').attr("class", "divstyle");
			var playment_label = $('<label></label>').text("付款：");
			var playment_select = $('<select></select>').attr("class", "playment");
			var playment_option1 = $('<option></option>').attr("value", "請選擇付款方式")
														 .text("請選擇付款方式");
			var playment_option2 = $('<option></option>').attr("value", "信用卡扣款")
														 .text("信用卡扣款");
			var playment_option3 = $('<option></option>').attr("value", "ATM轉帳")
													 .text("ATM轉帳");
			playment_select.append([playment_option1, playment_option2, playment_option3]);
			playment_div.append([playment_label, playment_select]);
		}
		if(shipment=='貨到付款'){
			var playment_div = $('<div></div>').attr("class", "divstyle");
			var playment_label = $('<label></label>').text("付款：");
			var playment_select = $('<select></select>').attr("class", "playment");
			var playment_option1 = $('<option></option>').attr("value", "請選擇付款方式")
														 .text("請選擇付款方式");
			var playment_option2 = $('<option></option>').attr("value", "貨到付款")
														 .text("貨到付款");
			playment_select.append([playment_option1, playment_option2]);
			playment_div.append([playment_label, playment_select]);
		}
		var check_button = $('<input><').attr("class", "check btn btn-primary")
		      						    .attr("type", "submit")
		      						    .attr("value", "確定");
		

		userdata_form.append([buyer_div, phone_div, store_div, playment_div, check_button]);
		
		loadTotal2();
		
		$('.selectStore').on('click', function(e){
			console.log(123);
			e.preventDefault();
//				$('.selectStoreMap').css("display", "block");
// 			window.open('${pageContext.request.contextPath}/dragon/storemap.jsp', '', config='height=500,width=500');
			window.open('${pageContext.request.contextPath}/dragon/storemap.jsp', '', config='height=500,width=800');
		});
		
		
		$('.check').on('click', function(e){
			e.preventDefault();
			var buyer = $('input[name="buyer"]').val();
			var shipPhone = $('input[name="shipPhone"]').val();
			var shipAddress = $('input[name="shipAddress"]').val();
			var storeName = $('.storeName').text();
			var storAddress = $('input[name="storAddress"]').val();
			var shipment = $('input[name="optionsRadios"]:checked').val();
			var shipCost = $('span[name="shipCost"]').text();
			var TotalPrice = $('.payPrice').text();
			
			
			var playment = $('.playment').val();
			if(shipment=='貨到付款' || shipment=='超商取貨'){
				$.post('/DizzyCafe/insertOrder.controller',{
					'buyer':buyer,
					'shipPhone':shipPhone,
					'ShipAddress':'無',
					'StoreName':storeName,
					'StorAddress':shipAddress,
					'shipment':shipment,
					'ShipCost':shipCost,
					'playment':playment,
					'TotalPrice':TotalPrice
				}, function(){
// 					alert("訂單完成");
// 					location.replace('/DizzyCafe/dragon/myorder.jsp');
					$.post('/DizzyCafe/checkoutjiijij.hohoho',function(str){
//	 					console.log(str);
						$('#test').html(str);
					});
				});
			}
		});
		
	};
	
	function loadTotal1(){
		$.getJSON('/DizzyCafe/selectShopping.controller', function(json){
			var total = 0;
			/*function(index, value) 裡面的index, value為固定寫法，不可更改*/
			$.each(json, function(index, value){			
// 				alert(total);
				total = total + (json[index].price * json[index].buyCount);
// 				alert(total);		
			});
			$('.payPrice').text("");
			$('.payPrice').text(total+80);
		});
	};
	
	function loadTotal2(){
		$.getJSON('/DizzyCafe/selectShopping.controller', function(json){
			var total = 0;
			/*function(index, value) 裡面的index, value為固定寫法，不可更改*/
			$.each(json, function(index, value){			
				total = total + (json[index].price * json[index].buyCount);
			});
			$('.payPrice').text("");
			$('.payPrice').text(total+60);
		});
	};
	
	function childclose(a){
// 		alert(a);
		$('.storeName').text(a);
	}
	
	
	</script>
</body>
</html>