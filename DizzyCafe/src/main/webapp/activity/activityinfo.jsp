<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>活動</title>
<style type="text/css">
.activityItem {
	border: 1px black solid;
}
</style>
</head>
<body>


	<h1>HIHI</h1>
	<div id="showItems">
		<c:if test="${not empty items}">
			<table class="activityItem">
				<c:forEach items="${items }" var="showBean">
					<tr>
						<td><a href="${pageContext.request.contextPath}/activities?No=${showBean.activityNo-1000}">${showBean.activityName }</a></td>
						<td>${showBean.activityStart }~${showBean.activityEnd }</td>
					</tr>
				</c:forEach>
				<tr>
					<td></td>
					<td>
					<c:forEach begin="0" end="${totalPage }" var="pages">
							<a href="${pageContext.request.contextPath}/activity.controller?nowPage=${pages}">${pages+1 }</a>
					</c:forEach>
					</td>
				</tr>
			</table>
		</c:if>


	</div>
</body>
</html>