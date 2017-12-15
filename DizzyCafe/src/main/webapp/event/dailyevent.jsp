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
#playImg { 
	POSITION: absolute; 
	TOP: 28%; LEFT : 20%; 
	Z-INDEX: 0; 
} 
#firstImg { 
 	position: absolute; 
 	top: 75%; left : 47%;
}
#secondImg { 
 	position: absolute; 
 	top: 93%; left : 30%;
} 
#thirdImg { 
 	position: absolute; 
 	top: 75%; left : 15%;
} 
#fourthImg { 
 	position: absolute; 
 	top: 25%; left : 15%;
} 
#fifthImg { 
 	position: absolute; 
 	top: 7%; left : 30%;
} 
#sixthImg { 
 	position: absolute; 
 	top: 25%; left : 47%;
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
  margin-left: 65%;
}

.btn:hover {
  background: #2aa83d;
  text-decoration: none;
}
</style>
</head>
<body>
	<div class="forDiv">
		<img src="/DizzyCafe/event/arrow.png" width="350x" id="playImg" /> 
<!-- 		<img src="/DizzyCafe/event/event.png" width="500px" id="firstImg" /> -->
		<span id="firstImg">firstImg</span>
		<span id="secondImg">secondImg</span>
		<span id="thirdImg">thirdImg</span>
		<span id="fourthImg">fourthImg</span>
		<span id="fifthImg">fifthImg</span>
		<span id="sixthImg">sixthImg</span>
<!-- 		<form action="/gimedacoupon.controller" method="POST" id="forForm"> -->
<!-- 		</form> -->
	</div>
	<input type="button" value="抽獎" class="btn">
	<script type="text/javascript"
		src="//code.jquery.com/jquery-2.2.4.min.js"></script>
	<script type="text/javascript">
// 	$(document).ready(function() {
		 var $elie = $("img"), degree = 0, timer,stop,count = 0;
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
// 		      clearTimeout(timer);
		      stop = setTimeout(function(){
		    	  clearTimeout(timer);
// 		    	  degree = degree-count*360;
		      },parseInt(Math.random()*2000+3000));
		 });	
	</script>
</body>
</html>