<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>每日活動</title>
<style type="text/css">
.BIG{
	height:auto;
}
body{
	background-image: url("/DizzyCafe/event/wood.jpg");
	background-size: cover;
	background-repeat: no-repeat;
    background-attachment: fixed;
    background-position: center;
}
.forDiv { 
	POSITION: relative; 
 	height:480px;
}
#circleImg{
	POSITION: absolute;
	TOP: 25px; LEFT : 335px;
	Z-INDEX: 1; 
} 
#playImg { 
	POSITION: absolute; 
	TOP: 125px; LEFT : 435px; 
	Z-INDEX: 4; 
} 
#firstImg { 
 	position: absolute; 
 	top: 370px; left : 600px;
 	Z-INDEX: 3;
}
#secondImg { 
 	position: absolute; 
 	top: 385px; left : 485px;
 	Z-INDEX: 3;
} 
#thirdImg { 
 	position: absolute; 
 	top: 250px; left : 400px;
 	Z-INDEX: 3;
} 
#fourthImg { 
 	position: absolute; 
 	top: 145px; left : 485px;
 	Z-INDEX: 3;
} 
#fifthImg { 
 	position: absolute; 
 	top: 130px; left : 600px;
 	Z-INDEX: 3;
} 
#sixthImg { 
 	position: absolute; 
 	top: 260px; left : 700px;
 	Z-INDEX: 3;
}  

#haha{
	margin: auto; 
}

.btn:hover {
  background: #2aa83d;
  text-decoration: none;
}
.hoho{
	width:100px;
	margin-left:60%;
	Z-INDEX: 5;
}
</style>
</head>
<body>
	<jsp:include page="/HTML/Navbar.jsp" />
	<div style="height:100px"></div>
<div class="BIG">
	<div class="forDiv">
		<img src="${pageContext.request.contextPath }/event/coolarrow.png" width="300px" id="playImg" />
		<img src="${pageContext.request.contextPath }/event/roulette_bg.png" width="500px" id="circleImg"/>  
<!-- 		<img src="/DizzyCafe/event/event.png" width="500px" id="firstImg" /> -->
		<span id="firstImg" class="imm"><img width="45px" src='<c:url value="/event/coffee.png"></c:url>'>firstImg</span>
		<span id="secondImg" class="imm"><input type="hidden" value="87"/>銘謝惠顧</span>
		<span id="thirdImg" class="imm"><img width="45px" src='<c:url value="/event/coffee.png"></c:url>'>thirdImg</span>
		<span id="fourthImg" class="imm"><input type="hidden" value="87"/>銘謝惠顧</span>
		<span id="fifthImg" class="imm"><img width="45px" src='<c:url value="/event/coffee.png"></c:url>'>fifthImg</span>
		<span id="sixthImg" class="imm"><input type="hidden" value="87"/>銘謝惠顧</span>
<!-- 		<form action="/gimedacoupon.controller" method="POST" id="forForm"> -->
<!-- 		</form> -->
	</div>
	<div style="padding-bottom:10px">
			<%@ page import="java.util.Date"%>
			<jsp:useBean id="now" class="java.util.Date" />
			<fmt:formatDate value="${user.memberPlay }" var="temp"/>
			<fmt:parseDate value="${temp}" pattern="yyyy/MM/dd" var="submitDate"/>
			<c:choose>
				<c:when test="${empty user}">
					<span id="here" style="line-height:80px;margin-left: 64%;font-size: 32px;font-weight: bold;">請先登入</span>
					<p class="hoho">
						<input type="button" value="抽獎" class="btn btn-lg" id="pressOne" disabled="disabled">
					</p>
				</c:when>
				<c:when test="${submitDate lt now}">
					<span id="here" style="line-height:80px;margin-left: 64%;font-size: 32px;font-weight: bold;">&nbsp;</span>
					<p class="hoho">
						<input type="button" value="抽獎" class="btn btn-lg" id="pressOne">
					</p>
				</c:when>
				<c:otherwise>
					<span id="here" style="line-height:80px;margin-left: 64%;font-size: 32px;font-weight: bold;">今天已經玩過囉~</span>
					<p class="hoho">
						<input type="button" value="抽獎" class="btn btn-lg" id="pressOne" disabled="disabled">
					</p>
				</c:otherwise>
			</c:choose>					
	</div>
</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		$.getJSON('/DizzyCafe/getItem.controller',function(showItems){
			console.log(showItems);
			$('#firstImg').html('<img width="45px" src="<c:url value="/event/coffee.png"></c:url>">' 
					+ showItems[0].merchandiseName + '<input type="hidden" value="'
					+ showItems[0].merchandiseId+'"/>'+ '<input type="hidden" value="'
					+ showItems[0].discount+'"/>');
			$('#thirdImg').html('<img width="45px" src="<c:url value="/event/coffee.png"></c:url>">' 
					+ showItems[1].merchandiseName + '<input type="hidden" value="'
					+ showItems[1].merchandiseId+'"/>'+ '<input type="hidden" value="'
					+ showItems[1].discount+'"/>');
			$('#fifthImg').html('<img width="45px" src="<c:url value="/event/coffee.png"></c:url>">' 
					+ showItems[2].merchandiseName + '<input type="hidden" value="'
					+ showItems[2].merchandiseId+'"/>'+ '<input type="hidden" value="'
					+ showItems[2].discount+'"/>');
		});
		
	});
		var $elie = $("#playImg"), degree = 0, timer,stop,count = 0;
// 	   	 rotate();
		function rotate() {
		      $elie.css({ WebkitTransform: 'rotate(' + degree + 'deg)'});  
		      $elie.css({ '-moz-transform': 'rotate(' + degree + 'deg)'});                      
		      timer = setTimeout(function() {
		            degree=degree+2; rotate();
// 		            count++;
		      },5);
		}
		$("#pressOne").one('click',function() {
			rotate();
// 		    clearTimeout(timer);
		    stop = setTimeout(function(){
		    	clearTimeout(timer);
// 		    	degree = degree-count*360;
				temp = degree%360;
				if(parseInt(temp/60)==0){
					$("#here").html($(".imm:nth-child(3)").html());
				}else if(parseInt(temp/60)==1){
					$("#here").html($(".imm:nth-child(4)").html());
				}else if(parseInt(temp/60)==2){
					$("#here").html($(".imm:nth-child(5)").html());
				}else if(parseInt(temp/60)==3){
					$("#here").html($(".imm:nth-child(6)").html());
				}else if(parseInt(temp/60)==4){
					$("#here").html($(".imm:nth-child(7)").html());
				}else if(parseInt(temp/60)==5){
					$("#here").html($(".imm:nth-child(8)").html());
				}
// 				prize = 'prize=' + $("#here input:first").val();
// 				dis = 'discount=' + $("#here input:last").val();
// 				res = prize+'&'+dis;
				res = {};
				res.prize = $("#here input:first").val();
				res.discount = $("#here input:last").val();
				
		    	$.post('/DizzyCafe/dailyEvent.controller',res);
				
			},parseInt(Math.random()*2000+3000));
		});	

	</script>
</body>
</html>