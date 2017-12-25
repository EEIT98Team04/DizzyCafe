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
.forContent{
	overflow : hidden;
  	text-overflow : ellipsis;
  	white-space : nowrap;
  	width: 240px;
}
</style>
</head>
<body>
	<jsp:include page="/HTML/Navbar.jsp" />
	<div style="height:100px;"></div>
	<p class="alert alert-warning" style="padding-left:30%;padding-bottom:0px"><strong style="font-size:24px">活動專區</strong></p>
	<div id="showItems">
		<c:if test="${not empty items}">
			<div class="card-group" style="width:800px;margin:50px auto;">
			<c:forEach items="${items }" var="showBean" varStatus="sta">
				<div class="card">
    				<a href="${pageContext.request.contextPath}/activities?No=${showBean.activityNo-1000}">
						<img class="card-img-top" width="240px" src="${pageContext.request.contextPath}${showBean.activityPicture}"/>
					</a>
    				<div class="card-body">
      					<h4 class="card-title">${showBean.activityName }</h4>
      					<div class="card-text content">${showBean.activityContent }</div>
     					 <p class="card-text"><small class="text-muted"><a class="more" href="${pageContext.request.contextPath}/activities?No=${showBean.activityNo-1000}">看更多</a></small></p>
   					</div>
  				</div>
  				<c:if test="${sta.last && sta.count==2 }">
  					<div class="card"></div>
  				</c:if>
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
	<script>
		$(document).ready(function(){
			for(var i = 0;i<3;i++){
				var temp = $('.content:eq('+i+')').html().split('>',2);
				stringx = temp[1].substring(0,15);
				$('.content:eq('+i+')').html('<p>'+stringx+'...</p>');				
			}
		});
	</script>
<!-- 	<button type="button" id="newEvent">新增</button> -->
<!-- 	<script> -->
<!--  		$(function(){ -->
<!--  			$('#newEvent').click(function(){ -->			
<!--  			}); -->
<!--  		}); -->
<!-- 	</script> -->
</body>
</html>