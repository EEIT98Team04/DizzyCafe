<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${activityBean.activityName }</title>
<style>
.info{
	width:1000px;
	margin:auto;
}
.date > div{
	width: 75px;
    height: 75px;
    text-align: center;
    color: #fff;
    padding: 3px 0 0 0;
    background: url(/DizzyCafe/activity/idx-10.png) center center no-repeat #FABE00;
    line-height: 2em;
    padding: 5px 0 0 0;
}
h3{
	color: #5b2407;
    padding: 0 0 0 25px;
    line-height: 1.3em;
}
</style>
</head>
<body>
	<jsp:include page="/HTML/Navbar.jsp" />
	<div style="height: 100px"></div>
	<p class="alert alert-warning" style="padding-left:25%;padding-bottom:0px"><strong style="font-size:36px">活動專區</strong></p>
	<div class="info">
		<div>
			<img style="padding-left:150px;" width="800px" src="${pageContext.request.contextPath}${activityBean.activityPicture}">
		</div>
		<div style="margin:20px 0;padding-left:150px;">
			<table>
				<tr>
					<td class="date">
						<div id="month">
							<b id="day"></b>
							<br>
						</div>
					</td>
					<td><h3>${activityBean.activityName }</h3></td>
				</tr>
			</table>		
		</div>
		<div style="padding-left:250px;">
			<p>${activityBean.activityContent }</p>
			<br>
			<p id="hoho">${activityBean.activityStart }-${activityBean.activityEnd }</p>
		</div>

	</div>
	
	<script>
		var temp = $('#hoho').html().split('-');
		console.log(temp[1]);
		$('#month').append(temp[1]+'月');
		$('#day').html(temp[2]);
		$('#hoho').html(temp[0]+'/'+temp[1]+'/'+temp[2]+' ~ '+temp[3]+'/'+temp[4]+'/'+temp[5]);
	</script>
</body>
</html>