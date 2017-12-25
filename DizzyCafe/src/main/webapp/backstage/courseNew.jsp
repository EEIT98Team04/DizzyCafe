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
		<div class="container-fluid" style="margin-top: 50px">
			<h2 style="margin: 20px auto; width: 90%">新增課程</h2>
			<form id="form1" enctype="multipart/form-data" method="post"
				action="${pageContext.request.contextPath}/course/courseNew.controller">
				<fieldset>
				<div align="center"> 
					<table>
						<tr>
							<td>
								<table>
									<tr>
									<th>名稱</th>
										<td>
										<input type="text"
											name="courseName" required></td>
									</tr>
									<tr>
									<th>圖片</th>
									<td>
										<input type="file" name="courseImg" accept="image/*" required>
									</td>
									</tr>
									<tr>
									<th>簡介</th>
										<td><input type="text"
											name="courseIntro" required> </td>
									</tr>
									<tr>
									<th>講師</th>
										<td>
										<input type="text" name="courseTeacher" required></td>
									</tr>
									<tr>
									<th>人數上限</th>
										<td>
										<input type="text" name="courseLimit" required></td>
									</tr>
									<tr>
									<th>課程價格</th>
									<td>
									<input type="text" name="courseCost" required>
									</td>
									</tr>
								</table>
							</td>
							<td>
								<table>
									<tr>
									<th><label for="courseSignupBegin">報名期限</label></th>
										<td>
											<input type="text" id="courseSignupBegin" name="courseSignupBegin" readonly>～ 
											<input type="text" id="courseSignupEnd" name="courseSignupEnd" readonly>
										</td>
									<tr>
									<th><label for="courseBegin">課程日期</label></th>
										<td>
											<input type="text" id="courseBegin" name="courseBegin" readonly>～
											<input type="text" id="courseEnd" name="courseEnd" readonly>
										</td>
									</tr>
									<tr>
									<th>上課時間</th>
										<td>
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
										</select></td>
									</tr>
									<tr>
									<th>上課時數</th>
										<td>
										<select name="courseLength">
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
													<option value="6">6</option>
											</select><span>小時</span>
											</td>
									</tr>
									<tr>
									<th>上課日</th>
									</tr>
									<tr>
										<th></th>
											<td>
												<label for="monday">
												<input id="monday" type="checkbox" name="whichDay" value="2" />星期一</label>
												<label for="tuesday">
												<input id="tuesday" type="checkbox" name="whichDay" value="3" />星期二</label>
												<label for="wednesday">
												<input id="wednesday" type="checkbox" name="whichDay" value="4" />星期三</label>
												<label for="thursday"> 
												<input id="thursday" type="checkbox" name="whichDay" value="5" />星期四</label>
												<label for="friday">
												<input id="friday" type="checkbox" name="whichDay" value="6" />星期五</label>
												<label for="saturday">
												<input id="saturday" type="checkbox" name="whichDay" value="7" />星期六</label>
												<label for="sunday">
												<input id="sunday" type="checkbox" name="whichDay" value="1" />星期日</label>
											</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr height="20px"></tr>
						<tr>
						<th>課程內容</th>
						<td colspan="2"></td>
						</tr>
						<tr>
						<td colspan="2">
							<input type="text" name="courseContent" required id="editor1">
						</td>
						</tr>
						<tr height="20px"></tr>
						<tr>
						<td colspan="2" align="center">
						<button id="submit" type="submit" class="btn btn-info">送出</button>
						<button type="reset" class="btn" style="margin-left: 50px">清除</button>
						</td>
						</tr>
					</table>
					</div>
					<!--<div> 
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
					<div>
						<label>課程內容</label>
						<div>
							<input type="text" name="courseContent" required id="editor1">
						</div>
					</div>
 

					<div style="margin:15px auto; width:20%">
						<button id="submit" type="submit" class="btn btn-info">送出</button>
						<button type="reset" class="btn" style="margin-left: 50px">清除</button>
					</div>-->

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
		
		var dateFormat = "yy/mm/dd";
		//課程時間
		$(function() {
			var today = new Date();
			
			//報名起始
			signFrom = $("#courseSignupBegin").datepicker({
				dateFormat :dateFormat,
				defaultDate : "+1w",
				changeMonth : true,
				numberOfMonths : 1,
				minDate: today
			}).on("change", function() {
				signTo.datepicker("option", "minDate", getDate(this,0));
			});
			
			//報名結束
			signTo = $("#courseSignupEnd").datepicker({
				dateFormat :dateFormat,
				defaultDate : "+1w",
				changeMonth : true,
				numberOfMonths : 1,
				minDate : today
			}).on("change", function() {
				signFrom.datepicker("option", "maxDate", getDate(this,0));
				courseFrom.datepicker("option", "minDate", getDate(this,1));
				courseTo.datepicker("option", "minDate", getDate(this,1));
			});
			
			//課程起始
			courseFrom = $("#courseBegin").datepicker({
				dateFormat :dateFormat,
				defaultDate : "+1w",
				changeMonth : true,
				minDate : today,
				numberOfMonths : 1
			}).on("change", function() {
				courseTo.datepicker("option", "minDate", getDate(this,0));
			});
			
			//課程結束
			courseTo = $("#courseEnd").datepicker({
				dateFormat :dateFormat,
				defaultDate : "+1w",
				changeMonth : true,
				minDate : today,
				numberOfMonths : 1
			}).on("change", function() {
				courseFrom.datepicker("option", "maxDate", getDate(this,0));
			});
		});
		
		function getDate(element, days) {
			var date;
			try {
				debugger;
				date = $.datepicker.parseDate(dateFormat, element.value);
				date.setDate(date.getDate() + parseInt(days));
			} catch (error) {
				date = null;
			} 
			return date;
		}
	</script>

</body>
</html>
