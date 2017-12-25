<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<style type="text/css">
#form1 div {
	width: 1000px;
	margin: auto;
}
</style>
</head>
<body>
	<jsp:include page="/backstage/index.jsp"></jsp:include>

	<div class="content-wrapper">
		<div class="container-fluid"
			style="margin-top: 50px">
			<h2 style="margin: 20px auto; width: 90%">新增課程</h2>
			<form id="form1" enctype="multipart/form-data" method="post"
				action="${pageContext.request.contextPath}/course/courseNew.controller">
				<fieldset>
					<div> 
						<label>課程名稱</label> <input type="text" name="courseName" required>
						<span style="float: right;padding-right: 22.5%"> 
							<label>課程圖片</label> 
						</span>
					</div>
					<div>
						<label>課程介紹</label>
						<input type="text" name="courseIntro" required>
						<span style="float: right;"> 
							<input type="file" name="courseImg" accept="image/*" required>
						</span>
					</div>
					<div>
						<label>課程內容</label>
						<div>
							<input type="text" name="courseContent" required id="editor1">
						</div>
					</div>
					<div style="margin-top:10px;">
						<label>課程價格</label> <input type="text" name="courseCost" required>
						<span>${error.xxxcourseCost }</span>
						<span style="margin-left: 20%"> 
							<label>上課時間</label> 
							<select name="time">
								<option value="9">09:00</option>
								<option value="10">10:00</option>
								<option value="11">11:00</option>
								<option value="12">12:00</option>
								<option value="13">13:00</option>
								<option value="14">14:00</option>
								<option value="15">15:00</option>
								<option value="16">16:00</option>
								<option value="17">17:00</option>
								<option value="18">18:00</option>
							</select>
						</span>
					</div>
					<div>
						<label>授課教師</label> <input type="text" name="courseTeacher"
							required>
						<span style="margin-left: 20%"> 
							<label>上課時數</label> 
							<select name="courseLength">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
							</select> <span>小時</span>
						</span>
					</div>
					<div>
						<label>人數上限</label> <input type="text" name="courseLimit" required>
						<span style="margin-left: 20%"> 
							<label>每周幾上課</label> <label for="monday"><input
							id="monday" type="checkbox" name="whichDay" value="2" />星期一</label> <label
							for="tuesday"><input id="tuesday" type="checkbox"
							name="whichDay" value="3" />星期二</label> <label for="wednesday"><input
							id="wednesday" type="checkbox" name="whichDay" value="4" />星期三 </label>
							<label for="thursday"><input id="thursday" type="checkbox"
							name="whichDay" value="5" />星期四 </label> <label for="friday"><input
							id="friday" type="checkbox" name="whichDay" value="6" />星期五 </label> <label
							for="saturday"><input id="saturday" type="checkbox"
							name="whichDay" value="7" />星期六 </label> <label for="sunday"><input
							id="sunday" type="checkbox" name="whichDay" value="1" />星期日</label>
						</span>
					</div>
					<div style="margin-top:10px;">
						<label for="courseSignupBegin">報名開始日期</label> <input type="text"
							id="courseSignupBegin" name="courseSignupBegin" readonly>
						<label style="margin-left: 17%" for="courseSignupEnd">報名結束日期</label> <input type="text"
							id="courseSignupEnd" name="courseSignupEnd" readonly>
					</div>
  
					<div>
						<label for="courseBegin">課程開始日期</label> <input type="text"
							id="courseBegin" name="courseBegin" readonly> 
						<label style="margin-left: 17%"	for="courseEnd">課程結束日期</label> <input type="text" id="courseEnd"
							name="courseEnd" readonly>
					</div>

 

					<div style="margin:15px auto; width:20%">
						<button id="submit" type="submit" class="btn btn-info">送出</button>
						<button type="reset" class="btn" style="margin-left: 50px">清除</button>
					</div>
					 
				</fieldset>
			</form> 
		</div>
	</div>
	<div>
		<jsp:include page="/backstage/footer.jsp"></jsp:include>
	</div>

	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="../backstage/ckeditor/ckeditor.js"></script>
	<script>
		//editor
		CKEDITOR.replace('editor1');

		$('#submit').click(
				function(e) {
					//editor 資料處理
					$('input[name="courseContent"]').val(
							CKEDITOR.instances.editor1.getData());
				});

		//課程時間
		$(function() {
			var dateFormat = "mm/dd/yy", from = $("#courseBegin").datepicker({
				defaultDate : "+1w",
				changeMonth : true,
				numberOfMonths : 1
			}).on("change", function() {
				to.datepicker("option", "minDate", getDate(this));
			}), to = $("#courseEnd").datepicker({
				defaultDate : "+1w",
				changeMonth : true,
				numberOfMonths : 1
			}).on("change", function() {
				from.datepicker("option", "maxDate", getDate(this));
			});

			function getDate(element) {
				var date;
				try {
					date = $.datepicker.parseDate(dateFormat, element.value);
				} catch (error) {
					date = null;
				}

				return date;
			}
		});
	</script>
	<script>
		//報名時間
		$(function() {
			var dateFormat = "mm/dd/yy", from = $("#courseSignupBegin")
					.datepicker({
						defaultDate : "+1w",
						changeMonth : true,
						numberOfMonths : 1
					}).on("change", function() {
						to.datepicker("option", "minDate", getDate(this));
					}), to = $("#courseSignupEnd").datepicker({
				defaultDate : "+1w",
				changeMonth : true,
				numberOfMonths : 1
			}).on("change", function() {
				from.datepicker("option", "maxDate", getDate(this));
			});

			function getDate(element) {
				var date;
				try {
					date = $.datepicker.parseDate(dateFormat, element.value);
				} catch (error) {
					date = null;
				}

				return date;
			}
		});
	</script>

</body>
</html>
