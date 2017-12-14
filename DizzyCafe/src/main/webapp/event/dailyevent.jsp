<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>每日活動</title>
<style type="text/css">
.forDiv { 
	POSITION: relative; 
 	height:400px;
}
#circleImg{
	POSITION: absolute;
	TOP: -66%; LEFT : -3%;
	Z-INDEX: 1; 
} 
#playImg { 
	POSITION: absolute; 
	TOP: 15%; LEFT : 20.8%; 
	Z-INDEX: 2; 
} 
#firstImg { 
 	position: absolute; 
 	top: 75%; left : 47%;
 	Z-INDEX: 3;
}
#secondImg { 
 	position: absolute; 
 	top: 93%; left : 30%;
 	Z-INDEX: 3;
} 
#thirdImg { 
 	position: absolute; 
 	top: 75%; left : 15%;
 	Z-INDEX: 3;
} 
#fourthImg { 
 	position: absolute; 
 	top: 25%; left : 15%;
 	Z-INDEX: 3;
} 
#fifthImg { 
 	position: absolute; 
 	top: 7%; left : 30%;
 	Z-INDEX: 3;
} 
#sixthImg { 
 	position: absolute; 
 	top: 25%; left : 47%;
 	Z-INDEX: 3;
}  
/* #forForm{ */
/* 	top: 80%; left : 30%; */
/* 	text-align: center; */
/* } */
#haha{
	margin: auto; 
}
.btn {
  -webkit-border-radius: 28px;
  -moz-border-radius: 28px;
  border-radius: 28px;
  font-family: Arial;
  color: #ffffff;
  font-size: 30px;
  background: #3ec953;
  padding: 10px 20px 10px 20px;
  text-decoration: none;
  margin-left: 80%;
  z-index:10;
}

.btn:hover {
  background: #2aa83d;
  text-decoration: none;
}
</style>
</head>
<body>
	<div class="forDiv">
		<img src="${pageContext.request.contextPath }/event/arrow123.png" width="300px" id="playImg" />
		<img src="${pageContext.request.contextPath }/event/circle123.png" width="900px" id="circleImg"/>  
<!-- 		<img src="/DizzyCafe/event/event.png" width="500px" id="firstImg" /> -->
		<span id="firstImg" class="imm"><img width="60px" src='<c:url value="/event/coffee.png"></c:url>'>firstImg</span>
		<span id="secondImg" class="imm"><img width="60px" src='<c:url value="/event/coffee.png"></c:url>'>secondImg</span>
		<span id="thirdImg" class="imm"><img width="60px" src='<c:url value="/event/coffee.png"></c:url>'>thirdImg</span>
		<span id="fourthImg" class="imm"><img width="60px" src='<c:url value="/event/coffee.png"></c:url>'>fourthImg</span>
		<span id="fifthImg" class="imm"><img width="60px" src='<c:url value="/event/coffee.png"></c:url>'>fifthImg</span>
		<span id="sixthImg" class="imm"><img width="60px" src='<c:url value="/event/coffee.png"></c:url>'>sixthImg</span>
<!-- 		<form action="/gimedacoupon.controller" method="POST" id="forForm"> -->
<!-- 		</form> -->
	</div>
	<div>
		<p><span id="here" style="line-height:80px;margin-left: 64%;font-size: 36px;font-weight: bold;">&nbsp;</span><input type="button" value="抽獎" class="btn"></p>				
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">
// 	$(document).ready(function() {
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
		$(".btn").one('click',function() {
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
			},parseInt(Math.random()*2000+3000));
		});	
	</script>
</body>
</html>