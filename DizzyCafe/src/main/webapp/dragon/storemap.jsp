<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="stylesheet"
	href="${pageContext.request.contextPath}/dragon/css/StoreMap.css" />
  <title>門市位置</title>
</head>

<body>
  <div class="selectStoreMap" title="門市位置">
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
		<button class="selectOver">確定</button>
		<div class="map">
			<img class="storeImage">
		</div>
	</div>
  </div>
  <!-- Bootstrap core JavaScript-->  
  <script src="${pageContext.request.contextPath}/backstage/vendor/jquery/jquery.min.js"></script>  
  <script src="${pageContext.request.contextPath}/backstage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Core plugin JavaScript-->  
  <script src="${pageContext.request.contextPath}/backstage/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script>
	$(function() {
		
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
				var district1 = $('<option></option>').attr("value","請選擇鄉鎮市區").text("請選擇鄉鎮市區");
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
				var district1 = $('<option></option>').attr("value","請選擇鄉鎮市區").text("請選擇鄉鎮市區");
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
				var district1 = $('<option></option>').attr("value","請選擇鄉鎮市區").text("請選擇鄉鎮市區");
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
			
		});
		
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
		});
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
		});
		
		$('.Store').on('change', function(){
			var store = $('.Store').val();
// 			alert(store);
			if(store=='請選擇門市'){
				$('.storeImage').attr("src", "");
			}
			
			if(store=='德欣門市'){
				$('.storeImage').attr("src", "/DizzyCafe/dragon/images/德欣門市.PNG");
			}
			
			if(store=='德復門市'){
				$('.storeImage').attr("src", "/DizzyCafe/dragon/images/德復門市.PNG");
			}
		});
		$(".selectOver").click(function() {
			var storeName = $('.Store').val();
			window.opener.childclose(storeName);
			window.close();					

		});
	});
</script>
</body>
</html>