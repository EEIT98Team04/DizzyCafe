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
		 <div id="carouselExampleIndicators" class="carousel slide border border-light" data-pause="false" data-ride="carousel" data-interval="3000">
	        <div class="carousel-inner">
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
    
    <script>
    $(function() { 
    	$.ajax({
			url:'/DizzyCafe/getCarousel.controller',
			method:'GET',
			success:function(datas){
				
				var cell_div_carousel_inner = $('#carouselExampleIndicators>div.carousel-inner');
				var clientHeight = window.screen.height / 100 * 87;
				console.log(clientHeight);
				
				for(var i = 0; i < datas.length; i++){
					var class_carousel_item = "carousel-item";
					if(i == 0){
						class_carousel_item = "carousel-item active";
					}
					var cell_a = $('<a></a>').attr("href", "/DizzyCafe/activities?No=" + (datas[i].id - 1000));
					var cell_img = $('<img style="width:100%; height:' + clientHeight + 'px" class="d-block" alt="GGG" />').attr('src','/DizzyCafe'+datas[i].activityPicture);
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