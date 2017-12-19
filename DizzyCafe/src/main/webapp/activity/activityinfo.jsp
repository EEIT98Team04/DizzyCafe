<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>活動</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<style type="text/css">
.activityItem {
	border: 1px black solid;
	margin: auto;
}
.more{
	background: url(/DizzyCafe/activity/nws-02.png) right center no-repeat;
	padding: 0 20px 0 0;
	cursor: pointer;
	color: #9c3f0d;
	text-decoration: none;
}
.more:hover{ 
 	color:#BC5B27; 
 	text-decoration: none; 
} 
</style>
</head>
<body>
	<jsp:include page="/HTML/Navbar.jsp" />
	<div style="height:100px;"></div>
	<p class="alert alert-warning" style="padding-left:30%;padding-bottom:0px"><strong style="font-size:24px">活動專區</strong></p>
	<div id="showItems">
		<c:if test="${not empty items}">
			<div class="card-group" style="width:500px;margin:auto;">
			<c:forEach items="${items }" var="showBean">
				<div class="card">
    				<a href="${pageContext.request.contextPath}/activities?No=${showBean.activityNo-1000}">
						<img class="card-img-top" width="240px" src="<c:url value="/activity/${showBean.activityNo }.jpg"/>"/>
					</a>
    				<div class="card-body">
      					<h4 class="card-title">${showBean.activityName }</h4>
      					<p class="card-text">${showBean.activityContent }</p>
     					 <p class="card-text"><small class="text-muted"><a class="more" href="${pageContext.request.contextPath}/activities?No=${showBean.activityNo-1000}">看更多</a></small></p>
   					</div>
  				</div>
			</c:forEach>
			</div>
		</c:if>
		<div style="margin:5px 50%;width:500px;">
			<ul class="pagination">
				<c:forEach begin="0" end="3" var="pages" varStatus="haha">
					<c:if test="${haha.first && (param.page-1)>0}">
						<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/activity.controller?page=${param.page-1}">
						Previous</a></li>				
					</c:if>
					<c:if test="${param.page+1*pages <= totalPage }">
  						<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/activity.controller?page=${param.page+1*pages}">${param.page+1*pages }</a></li>
  					</c:if>					
  					<c:if test="${haha.last && param.page < totalPage }">
						<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/activity.controller?page=${param.page+1}">
						Next</a></li>				
					</c:if>					
				</c:forEach>
			</ul>
		</div>
	</div>
</body>
</html>