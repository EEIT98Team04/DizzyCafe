<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DizzyCafe</title>
<style>
</style>
<jsp:include page="/HTML/TitleIcon.jsp" />
</head>
<body>
	<jsp:include page="/HTML/Navbar.jsp" />
	<div style="height: 100px"></div>
	<div>
		<a href="${pageContext.request.contextPath}/shopping/shoppingCart.controller">購物車</a>
	</div>
		 <div id="carouselExampleIndicators" class="carousel slide border border-light" data-ride="carousel" style="margin:auto;width:1024px;height:600px" data-interval="3000">
<!-- 	        <ol class="carousel-indicators"> -->
<!-- 	            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li> -->
<!-- 	            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li> -->
<!-- 	        </ol> -->
	        <div class="carousel-inner">
<!-- 	            <div class="carousel-item active"> -->
<%-- 	            	<a href="${pageContext.request.contextPath}/activities?No=1"> --%>
<%-- 	                	<img class="d-block" width='1024' height='600' src="${pageContext.request.contextPath}/activity/1001.jpg" alt="First slide"> --%>
<!-- 	                </a> -->
<!-- 	                <div class="carousel-caption d-none d-md-block"> -->
<!-- 	                    <h3>活動名稱</h3> -->
<!-- 	                    <p>簡單敘述</p> -->
<!-- 	                </div> -->
<!-- 	            </div> -->
	            
<!-- 	            <div class="carousel-item"> -->
<%-- 	            	<a href="${pageContext.request.contextPath}/activities?No=2"> --%>
<%-- 	                	<img class="d-block" width='1024' height='600' src="${pageContext.request.contextPath}/activity/1002.jpg" alt="Second slide"> --%>
<!-- 	                </a> -->
<!-- 	                <div class="carousel-caption d-none d-md-block"> -->
<!-- 	                    <h3>活動名稱</h3> -->
<!-- 	                    <p>簡單敘述</p> -->
<!-- 	                </div> -->
<!-- 	            </div> -->
	        </div>
	        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
	            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	            <span class="sr-only">Previous</span>
	        </a>
	        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
	            <span class="carousel-control-next-icon" aria-hidden="true"></span>
	            <span class="sr-only">Next</span>
	        </a>
	    </div>
    
    <footer class="fixed-bottom text-center">
          <p>Copyright © DizzyCafe 2017</p>
    </footer>
    
    <script>
    $(function() { 
    	$.ajax({
			url:'/DizzyCafe/getCarousel.controller',
			method:'GET',
			success:function(datas){
				
				var cell_div_carousel_inner = $('#carouselExampleIndicators>div.carousel-inner');
				
				for(var i = 0; i < datas.length; i++){
					var class_carousel_item = "carousel-item";
					if(i == 0){
						class_carousel_item = "carousel-item active";
					}
					var cell_a = $('<a></a>').attr("href", "/DizzyCafe/activities?No=" + (datas[i].id - 1000));
					var cell_img = $('<img class="d-block" width="1024" height="600" alt="GGG" />').attr('src','/DizzyCafe'+datas[i].activityPicture);
					cell_a.append(cell_img);
					var cell_h3 = $('<h3></h3>').text(datas[i].activityName);
					var cell_p = $('<p></p>').text(datas[i].name);
					var cell_div_carousel_caption = $('<div class="carousel-caption d-none d-md-block"></div>').append([cell_h3, cell_p]);
					var cell_div_carousel_item = $('<div></div>').addClass(class_carousel_item).append([cell_a, cell_div_carousel_caption]);
					cell_div_carousel_inner.append(cell_div_carousel_item);
				}
				
			}
		});
    }); 
    
    </script>
</body>
</html>