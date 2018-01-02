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
	background-image: url("/DizzyCafe/event/coffe.png");
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
		<span id="firstImg" class="imm"><img width="45px" src='<c:url value="/event/coffee.png"></c:url>'>firstImg</span>
		<span id="secondImg" class="imm"><input type="hidden" value="87"/>銘謝惠顧</span>
		<span id="thirdImg" class="imm"><img width="45px" src='<c:url value="/event/coffee.png"></c:url>'>thirdImg</span>
		<span id="fourthImg" class="imm"><input type="hidden" value="87"/>銘謝惠顧</span>
		<span id="fifthImg" class="imm"><img width="45px" src='<c:url value="/event/coffee.png"></c:url>'>fifthImg</span>
		<span id="sixthImg" class="imm"><input type="hidden" value="87"/>銘謝惠顧</span>
	</div>
	<div style="padding-bottom:10px">
			<%@ page import="java.util.Date"%>
			<jsp:useBean id="now" class="java.util.Date" />
			<fmt:formatDate value="${user.memberPlay }" var="temp"/>
			<fmt:parseDate value="${temp}" pattern="yyyy/MM/dd" var="submitDate"/>
			<c:choose>
				<c:when test="${empty user}">
					<span id="here" style="line-height:80px;margin-left: 64%;font-size: 32px;font-weight: bold;"><input type="hidden" id="hide" value="notLogin">&nbsp;</span>
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
					<span id="here" style="line-height:80px;margin-left: 64%;font-size: 32px;font-weight: bold;"><input type="hidden" id="hide" value="played">&nbsp;</span>
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
		var roundDecimal = function (val, precision) {
			  return Math.round(Math.round(val * Math.pow(10, (precision || 0) + 1)) / 10) / Math.pow(10, (precision || 0));
			}
		
		
		$.getJSON('/DizzyCafe/getItem.controller',function(showItems){
			$('#firstImg').html('<img width="45px" src="<c:url value="/event/coffee.png"></c:url>"><span>' 
					+ showItems[0].merchandiseName + '</span><br><span style="margin-left:45px">' 
					+ (showItems[0].discount*100).toString().split('0')[0] + '折</span>'
					+ '<input type="hidden" value="' + showItems[0].merchandiseId+'"/>');
			$('#thirdImg').html('<img width="45px" src="<c:url value="/event/coffee.png"></c:url>"><span>' 
					+ showItems[1].merchandiseName + '</span><br><span style="margin-left:45px">' 
					+ (showItems[1].discount*100).toString().split('0')[0] + '折</span>'
					+ '<input type="hidden" value="' + showItems[1].merchandiseId+'"/>');
			$('#fifthImg').html('<img width="45px" src="<c:url value="/event/coffee.png"></c:url>"><span>' 
					+ showItems[2].merchandiseName + '</span><br><span style="margin-left:45px">' 
					+ (showItems[2].discount*100).toString().split('0')[0] + '折</span>'
					+ '<input type="hidden" value="' + showItems[2].merchandiseId+'"/>');
		});		
		
		setTimeout(function(){
			if($('#hide').val()=='played'){
				alert('今天已經玩過囉~');
			}else if($('#hide').val()=='notLogin'){
				alert('請先登入');
			}				
		},500);
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
				res.prize = $("#here input").val();
				res.discount = $("#here span:last").html().split('折')[0]/100;
		    	$.post('/DizzyCafe/dailyEvent.controller',res);
				
			},
// 			parseInt(Math.random()*2000+3000));
			parseInt(3260));
		});	

	</script>
</body>
</html>