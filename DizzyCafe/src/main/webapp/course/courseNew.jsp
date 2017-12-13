<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/HTML/Navbar.jsp" />
	<div style="height:100px"></div>
	<form action="${pageContext.request.contextPath}/course/courseNew.controller">
		<fieldset>
			<div>
				<label>課程名稱</label> <input type="text" name="courseName" required>
			</div>
			<div>
				<label>課程圖片</label> <input type="file" name="courseImg" required>
			</div>
			<div>
				<label>課程介紹</label>
				<textarea cols="40" rows="5" name="courseIntro" required></textarea>
			</div>
			<div>
				<label>課程內容</label>
				<textarea cols="40" rows="8" name="courseContent" required></textarea>
			</div>
			<div>
				<label>課程價格</label> <input type="text" name="courseCost" required>
				<span>${error.xxxcourseCost }</span>
			</div>
			<div>
				<label>授課教師</label> <input type="text" name="courseTeacher" required>
			</div>
			<div>
				<label>每周幾上課</label> 
				<input type="checkbox" name="whichDay"value="2" />星期一
				<input type="checkbox" name="whichDay" value="3" />星期二
				<input type="checkbox" name="whichDay" value="4" />星期三 
				<input type="checkbox" name="whichDay" value="5" />星期四 
				<input type="checkbox" name="whichDay" value="6" />星期五 
				<input type="checkbox" name="whichDay" value="7" />星期六 
				<input type="checkbox" name="whichDay" value="1" />星期日
			</div>
			<div>
				<label>上課時間</label> <select name="time">
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
			</div>
			<div>
				<label>上課時數</label> 
				<select name="courseLength">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
				</select>
				<span>小時</span>
			</div>
			<div>
				<label>課程開始日期</label> <input type="date" name="courseBegin" required>
			</div>
			<div>
				<label>課程結束日期</label> <input type="date" name="courseEnd" required>
			</div>
			<div>
				<label>報名開始日期</label> <input type="date" name="courseSignupBegin"
					required>
			</div>
			<div>
				<label>報名結束日期</label> <input type="date" name="courseSignupEnd"
					required>
			</div>
			<div>
				<input type="submit" value="送出"> 
				<input type="reset"	value="取消" />
			</div>
		</fieldset>
	</form>
</body>
</html>