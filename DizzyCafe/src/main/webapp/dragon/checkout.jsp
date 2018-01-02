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
	<article class="article">
	<a href="${pageContext.request.contextPath}/Checkout/
	Checkout">結帳</a>
	<br>
		<div class="shipmain">
		<h4 class="selectShipTitle">運送方式</h4>
			<ul class="selectShip">
<!-- 				list-style控制li前面點的樣式 -->
<!-- 				將name名稱都取一樣，選擇時就會擇一選擇，1預設，點2時就會把1的預設用掉 -->
				<li>
					<label>
						<input type="radio" name="optionsRadios" value="郵寄到府" checked>
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
						<span></span>
						<span> 元</span>
					</label>
			</div>
		</div>
		
	<div class="userdata">
		<h4 class="titleName">取件人資料</h4>
		<div class="selectuserdata">
			<label>
				<input id="checkbox" type="checkbox">
				<span>同會員資料</span>
			</label>
		</div>
		<form action="<c:url value=""/>" method="post">

		</form>
	</div>
	
	<div class="selectStoreMap" title="視窗的標題">
		<select class="city">
			<option value="0">請選擇縣市</option>
			<option value="台北市">台北市</option>
			<option value="基隆市">基隆市</option>
			<option value="新北市">新北市</option>
			<option value="桃園市">桃園市</option>
			<option value="新竹市">新竹市</option>
			<option value="新竹縣">新竹縣</option>
			<option value="苗栗縣">苗栗縣</option>
			<option value="台中市">台中市</option>
			<option value="彰化縣">彰化縣</option>
			<option value="南投縣">南投縣</option>
			<option value="嘉義市">嘉義市</option>
			<option value="嘉義縣">嘉義縣</option>
			<option value="雲林縣">雲林縣</option>
			<option value="台南市">台南市</option>
			<option value="高雄市">高雄市</option>
			<option value="屏東縣">屏東縣</option>
			<option value="台東縣">台東縣</option>
			<option value="花蓮縣">花蓮縣</option>
			<option value="宜蘭縣">宜蘭縣</option>
			<option value="澎湖縣">澎湖縣</option>
			<option value="金門縣">金門縣</option>
			<option value="連江縣">連江縣</option>
		</select>
		
		<select class="district">
			<option value="0">請選擇鄉鎮市區</option>
		</select>
		
		<select class="street">
			<option value="0">請選擇街道</option>
		</select>
		
		<select class="Store">
			<option value="0">請選擇門市</option>
		</select>
		<div id="map">
		</div>
	</div>
	
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
	<link type="text/css" rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css"/>
	<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
	<script>
	$(document).ready(function(){
		
		load1();
		/*郵寄到府*/
		function load1(){
			var userdata_form = $('.userdata>form')
			userdata_form.empty();

			var buyer_div = $('<div></div>');
			var buyer_label = $('<label></label>').text("姓名：");
			var buyer_input = $('<input>').attr("type","text")
			  							  .attr("size", "10")
			    						  .attr("maxlength", "30")
			     						  .attr("name", "buyer")
			var buyer_span = $('<span></span>').text('');
			buyer_div.append([buyer_label, buyer_input, buyer_span]);


			var phone_div = $('<div></div>');
			var phone_label = $('<label></label>').text("手機：");
			var phone_input = $('<input><').attr("type","text")
			  							   .attr("size", "10")
			  							   .attr("maxlength", "30")
			  							   .attr("name", "shipPhone")
			var phone_span = $('<span></span>').text('');
			phone_div.append([phone_label, phone_input, phone_span]);


			var address_div = $('<div></div>');
			var address_label = $('<label></label>').text("地址：");
			var address_input = $('<input>').attr("type","text")
			    							.attr("size", "10")
			    							.attr("maxlength", "30")
			    							.attr("name", "shipAddress")
			var address_span = $('<span></span>').text('');
			address_div.append([address_label, address_input, address_span]);		
			   
			var playment_div = $('<div></div>');
			var playment_label = $('<label></label>').text("付款方式：");
			var playment_select = $('<select></select>').attr("class", "playment");
			var playment_option1 = $('<option></option>').attr("value", "請選擇付款方式")
														 .text("請選擇付款方式");
			var playment_option2 = $('<option></option>').attr("value", "信用卡扣款")
														 .text("信用卡扣款");
			var playment_option3 = $('<option></option>').attr("value", "ATM轉帳")
														 .text("ATM轉帳");
			playment_select.append([playment_option1, playment_option2, playment_option3]);
			playment_div.append([playment_label, playment_select]);
			var check_button = $('<input><').attr("class", "check")
			    							.attr("type", "submit")
			    							.attr("value", "前往結帳")

			userdata_form.append([buyer_div, phone_div, address_div, playment_div, check_button]);
		}
		
		/*貨到付款 and 超商取貨*/
		function load2(){
			var userdata_form = $('.userdata>form');
			var shipment = $('input[name="optionsRadios"]:checked').val();
			userdata_form.empty();

			var buyer_div = $('<div></div>');
			var buyer_label = $('<label></label>').text("姓名： ");
			var buyer_input = $('<input>').attr("type","text")
			      						  .attr("size", "10")
			      						  .attr("maxlength", "30")
			      						  .attr("name", "buyer")
			var buyer_span = $('<span></span>').text('');
			buyer_div.append([buyer_label, buyer_input, buyer_span]);


			var phone_div = $('<div></div>');
			var phone_label = $('<label></label>').text("手機： ");
			var phone_input = $('<input><').attr("type","text")
			      						   .attr("size", "10")
			      						   .attr("maxlength", "30")
			      						   .attr("name", "shipPhone")
			var phone_span = $('<span></span>').text('');
			phone_div.append([phone_label, phone_input, phone_span]);


			var store_div = $('<div></div>');
			var store_label = $('<label></label>').text("門市：");
			var store_span = $('<span></span>').attr("class", "storeName");
			var store_a = $('<a></a>').attr("class", "selectStore")
			      					  .attr("href", "#")
									  .text('選擇門市');
			store_div.append([store_div, store_label, store_span, store_a]);		

			if(shipment=='超商取貨'){
				var playment_div = $('<div></div>');
				var playment_label = $('<label></label>').text("付款方式：");
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
				var playment_div = $('<div></div>');
				var playment_label = $('<label></label>').text("付款方式：");
				var playment_select = $('<select></select>').attr("class", "playment");
				var playment_option1 = $('<option></option>').attr("value", "請選擇付款方式")
														 .text("請選擇付款方式");
				var playment_option2 = $('<option></option>').attr("value", "貨到付款")
															 .text("貨到付款");
				playment_select.append([playment_option1, playment_option2]);
				playment_div.append([playment_label, playment_select]);
			}
			var check_button = $('<input><').attr("class", "check")
			      						    .attr("type", "submit")
			      						    .attr("value", "前往結帳")

			userdata_form.append([buyer_div, phone_div, store_div, playment_div, check_button]);
		}
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
				
				load1();
				
				return;
			}
			if(shipment=='貨到付款' || '超商取貨'){
//				alert("1");
// 				shipAddress.val("無");
				$('input[name="shipAddress"]').val("無");
				$('span[name="shipCost"]').text('60')
				
				load2();
				
				return;
			}
		})
		
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
		})
		
		$('.check').on('click', function(){
			var buyer = $('input[name="buyer"]').val();
			var shipPhone = $('input[name="shipPhone"]').val();
			var shipAddress = $('input[name="shipAddress"]').val();
			var storeName = $('input[name="storeName"]').val();
			var storAddress = $('input[name="storAddress"]').val();
			var shipment = $('input[name="optionsRadios"]:checked').val();
			var shipCost = $('span[name="shipCost"]').text();
			
			var playment = $('playment').text();
// 			if(shipment=='郵寄到府'){
// 				storeName='無';
// 				storAddress='無';
// 			}
// 			if(shipment=='貨到付款' || '超商取貨'){
// 				shipAddress='無';
// 			}

			$.post('/DizzyCafe/insertOrder.controller',{
				'buyer':buyer,
				'shipPhone':shipPhone,
				'shipAddress':shipAddress,
				'storeName':storeName,
				'storAddress':storAddress,
				'shipment':shipment,
				'ShipCost':shipCost,
				'playment':playment
			}, function(){
				
			})
		})
		
		
		$('.selectStoreMap').dialog({
// 			autoOpen:false,
 			position:'center',
// 			modal:true
			height:$(window).height()*0.5,
			width:$(window).width()*0.5,
			model:true,
			dialogClass:"dlg-no-close",
			buttons:{
			關閉: function(){
					$(this).dialog("close");
				}
			}
		})
		$('a[class="selectStore"]').on('click', function(){
			$('#map').dialog('open');
		})
		
		
		$('.city').on('change', function(){
			var city = $(this).val();
			var district = $('.district');
			/*測試是否抓到城市名稱*/
//			alert(city);
			if(city=='請選擇縣市'){
				district.empty();
				var district1 = $('<option></option>').attr("value","請選擇縣市").text("請選擇縣市");
				district.append(district1);
			}
			if(city=='台北市'){
				district.empty();
				var district1 = $('<option></option>').attr("value","請選擇縣市").text("請選擇縣市");
				var district2 = $('<option></option>').attr("value","中正區").text("中正區");
				var district3 = $('<option></option>').attr("value","大同區").text("大同區");
				var district4 = $('<option></option>').attr("value","中山區").text("中山區");
				var district5 = $('<option></option>').attr("value","松山區").text("松山區");
				var district6 = $('<option></option>').attr("value","大安區").text("大安區");
				var district7 = $('<option></option>').attr("value","萬華區").text("萬華區");
				var district8 = $('<option></option>').attr("value","信義區").text("信義區");
				var district9 = $('<option></option>').attr("value","士林區").text("士林區");
				var district10 = $('<option></option>').attr("value","北投區").text("北投區");
				var district11 = $('<option></option>').attr("value","內湖區").text("內湖區");
				var district12 = $('<option></option>').attr("value","南港區").text("南港區");
				var district13 = $('<option></option>').attr("value","文山區").text("文山區");
				district.append([district1, district2, district3, district4, district5, district6
							   , district7, district8, district9, district10, district11, district12
							   , district13]);
			}
			if(city=='基隆市'){
				district.empty();
				var district1 = $('<option></option>').attr("value","請選擇縣市").text("請選擇縣市");
				var district2 = $('<option></option>').attr("value","仁愛中山區").text("仁愛區");
				var district3 = $('<option></option>').attr("value","信義區").text("信義區");
				var district4 = $('<option></option>').attr("value","中正區").text("中正區");
				var district5 = $('<option></option>').attr("value","中山區").text("中山區");
				var district6 = $('<option></option>').attr("value","安樂區").text("安樂區");
				var district7 = $('<option></option>').attr("value","暖暖區").text("暖暖區");
				var district8 = $('<option></option>').attr("value","七堵區").text("七堵區");
				district.append([district1, district2, district3, district4, district5, district6
					   		   , district7, district8]);
			}
			if(city=='新北市'){
				district.empty();
				var district1 = $('<option></option>').attr("value","請選擇縣市").text("請選擇縣市");
				var district2 = $('<option></option>').attr("value","萬里區").text("萬里區");
				var district3 = $('<option></option>').attr("value","金山區").text("金山區");
				var district4 = $('<option></option>').attr("value","板橋區").text("板橋區");
				var district5 = $('<option></option>').attr("value","汐止區").text("汐止區");
				var district6 = $('<option></option>').attr("value","深坑區").text("深坑區");
				var district7 = $('<option></option>').attr("value","石碇區").text("石碇區");
				var district8 = $('<option></option>').attr("value","瑞芳區").text("瑞芳區");
				var district9 = $('<option></option>').attr("value","平溪區").text("平溪區");
				var district10 = $('<option></option>').attr("value","雙溪區").text("雙溪區");
				var district11 = $('<option></option>').attr("value","貢寮區").text("貢寮區");
				var district12 = $('<option></option>').attr("value","新店區").text("新店區");
				var district13 = $('<option></option>').attr("value","坪林區").text("坪林區");
				var district14 = $('<option></option>').attr("value","烏來區").text("烏來區");
				var district15 = $('<option></option>').attr("value","永和區").text("永和區");
				var district16 = $('<option></option>').attr("value","中和區").text("中和區");
				var district17 = $('<option></option>').attr("value","土城區").text("土城區");
				var district18 = $('<option></option>').attr("value","三峽區").text("三峽區");
				var district19 = $('<option></option>').attr("value","樹林區").text("樹林區");
				var district20 = $('<option></option>').attr("value","鶯歌區").text("鶯歌區");
				var district21 = $('<option></option>').attr("value","三重區").text("三重區");
				var district22 = $('<option></option>').attr("value","新莊區").text("新莊區");
				var district23 = $('<option></option>').attr("value","泰山區").text("泰山區");
				var district24 = $('<option></option>').attr("value","林口區").text("林口區");
				var district25 = $('<option></option>').attr("value","蘆洲區").text("蘆洲區");
				var district26 = $('<option></option>').attr("value","五股區").text("五股區");
				var district27 = $('<option></option>').attr("value","八里區").text("八里區");
				var district28 = $('<option></option>').attr("value","淡水區").text("淡水區");
				var district29 = $('<option></option>').attr("value","三芝區").text("三芝區");
				var district30 = $('<option></option>').attr("value","石門區").text("石門區");
				district.append([district1, district2, district3, district4, district5, district6
					   , district7, district8, district9, district10, district11, district12
					   , district13, district14, district15, district16, district17, district18
					   , district19, district20, district21, district22, district23, district24
					   , district25, district26, district27, district28, district29, district30]);
			}
			
		})
		
		$('.district').on('change', function(){
			var district = $(this).val();
			var street = $('.street');
			if(district=='中山區'){
				street.empty();
				var street1 = $('<option></option>').attr("value","請選擇街道").text("請選擇街道");
				var street2 = $('<option></option>').attr("value","中山二路").text("中山二路");
				var street3 = $('<option></option>').attr("value","中和路").text("中和路");
				var street4 = $('<option></option>').attr("value","中華路").text("中華路");
				var street5 = $('<option></option>').attr("value","文化路").text("文化路");
				var street6 = $('<option></option>').attr("value","西定路").text("西定路");
				var street7 = $('<option></option>').attr("value","復興路").text("復興路");
				street.append([street1, street2, street3, street4, street5, street6, street7, street8]);
			}
			if(district=='中正區'){
				street.empty();
				var street1 = $('<option></option>').attr("value","請選擇街道").text("請選擇街道");
				var street2 = $('<option></option>').attr("value","中船路").text("中船路");
				var street3 = $('<option></option>').attr("value","北寧路").text("北寧路");
				var street4 = $('<option></option>').attr("value","和一路").text("和一路");
				var street5 = $('<option></option>').attr("value","祥豐街").text("祥豐街");
				var street6 = $('<option></option>').attr("value","新豐街").text("祥豐街");
				var street7 = $('<option></option>').attr("value","義一路").text("義二路");
				var street8 = $('<option></option>').attr("value","豐稔街").text("觀海街");
				street.append([street1, street2, street3, street4, street5, street6, street7, street8]);
			}
		})
		$('.street').on('change', function(){
			var street = $(this).val();
			var store = $('.Store');
			if(street=='中和路'){
				store.empty();
				var store1 = $('<option></option>').attr("value","請選擇門市").text("請選擇門市");
				var store2 = $('<option></option>').attr("value","新大慶門市").text("新大慶門市");
				store.append([store1, store2]);
			}
			if(street=='中華路'){
				store.empty();
				var store1 = $('<option></option>').attr("value","請選擇門市").text("請選擇門市");
				var store2 = $('<option></option>').attr("value","富華門市").text("富華門市");
				store.append([store1, store2]);
			}

			if(street=='西定路'){
				store.empty();
				var store1 = $('<option></option>').attr("value","請選擇門市").text("請選擇門市");
				var store2 = $('<option></option>').attr("value","聖心門市").text("聖心門市");
				store.append([store1, store2]);
			}
			if(street=='復興路'){
				store.empty();
				var store1 = $('<option></option>').attr("value","請選擇門市").text("請選擇門市");
				var store2 = $('<option></option>').attr("value","德欣門市").text("德欣門市");
				var store3 = $('<option></option>').attr("value","德復門市").text("德復門市");
				store.append([store1, store2, store3]);
			}
		})
	});
	</script>
</body>
</html>