<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/DizzyCafe/wayne/css/merchandise.css">
<title>Merchandise</title>
</head>
<body>
	<jsp:include page="/HTML/Navbar.jsp" />
	<article class="articleone">
	<div>
		<header></header>
		<section class="sectionone"> <aside class="asideone">
		<h3 class="asideTitle">coffee</h3>
		<ul>
			<li><a
				href="${pageContext.request.contextPath}/merchandisetag.controller?page=1&tag=bean">咖啡豆
					Whole Beans</a></li>
			<li><a href="${pageContext.request.contextPath}/merchandisetag.controller?page=1&tag=drip coffee">濾掛式咖啡 Drip Coffee</a></li>
		</ul>
		<h3 class="asideTitle">Merchandise</h3>
		<ul>
			<li><a href="${pageContext.request.contextPath}/merchandisetag.controller?page=1&tag=drip coffee set">手沖濾杯 Drip Coffee Set</a></li>
			<li><a href="${pageContext.request.contextPath}/merchandisetag.controller?page=1&tag=accessories">咖啡沖煮相關器具 Accessories</a></li>
			<li><a
				href="${pageContext.request.contextPath}/merchandisetag.controller?page=1&tag=bottle">咖啡杯瓶及保溫罐
					Bottle</a></li>
		</ul>

		</aside>
		<c:choose>
			<c:when test="${param.tag == 'bean' }"><div class="title"><h1>咖啡豆 Whole Beans</h1></div>
			</c:when>
			<c:when test="${param.tag == 'drip coffee' }"><div class="title"><h1>濾掛式咖啡 Drip Coffee</h1></div>
			</c:when>
			<c:when test="${param.tag == 'drip coffee set' }"><div class="title"><h1>手沖濾杯 Drip Coffee Set</h1></div>
			</c:when>
			<c:when test="${param.tag == 'accessories' }"><div class="title"><h1>咖啡沖煮相關器具 Accessories</h1></div>
			</c:when>
			<c:when test="${param.tag == 'bottle' }"><div class="title"><h1>咖啡杯瓶及保溫罐 Bottle</h1></div>
			</c:when>
		</c:choose>
		<c:if test="${not empty beansTag}">
			<c:forEach var="beanTag" items="${beansTag}" varStatus="b">
				<c:choose>
					<c:when test="${b.count%3==1}">
						<c:out value='<div class="rowlist">' escapeXml="false"></c:out>
					</c:when>
				</c:choose>
				<div class="colone">
					<div class="coltwo">
						<a
							href="${pageContext.request.contextPath}/merchandisedetails.controller?merchandiseId=${beanTag.merchandiseId}">
							<img class="imgone"
							src="${pageContext.request.contextPath}/${beanTag.merchandisePicture}">
						</a>
					</div>
					<div class="colthree">
						<input type="hidden" class="tag" value="${beanTag.merchandiseTag }"/>
						<p class="pone">
							${beanTag.merchandiseName}<br />原價 : ${beanTag.merchandisePrice}元<br />
						</p>
						<span class="spanone"><input class="button1" type="button" value="立即購買" 
						onclick="location.href='${pageContext.request.contextPath}/merchandisedetails.controller?merchandiseId=${beanTag.merchandiseId}'"></span>
					</div>
				</div>
				<c:choose>
					<c:when test="${b.count%3==0}">
						<c:out value="</div>" escapeXml="false"></c:out>
					</c:when>
				</c:choose>
			</c:forEach>


		</c:if> 
		</section>
	</div>

	</article>


	<div style="margin-left: 1000px;">
		<c:if test="${not empty param.tag}">
			<c:forEach var="pagesTag" begin="1" end="${totalPagesTag}">
				<a class="aone" href="${pageContext.request.contextPath}/merchandisetag.controller?tag=${param.tag}&page=${pagesTag}">${pagesTag}</a>
			</c:forEach>
		</c:if>
	</div>

	<footer></footer>
	<script>
		$.ajax({
			url : '/DizzyCafe/checkactivitydiscount.controller',
			type : 'GET',
			success : function(data){
				var temp = [1,1];
				$.each(data,function(key,value){
					if(value.tag=='bean'){
						if(temp[0] > value.discount){
							temp[0] = value.discount;
						}	
					}
// 					else if(value.tag=='bottle'){
// 						if(temp[1] > value.discount){
// 							temp[1] = value.discount;
// 						}
// 					}
					
				});
				$.each($('.tag'),function(key,value){
// 					if($(value).val()==data[0].tag){
						var old = $(this).parent().find('p').html().split('<br>');
						var oo = old[1].split('元')[0].split(' ');
						if($(value).val()=='bean'){
							oo[2] = parseInt(oo[2]*temp[0]);
							$(this).parent().find('p').html(old[0]+'<br>特價 : '+oo[2]+'元<br>');	
						}
// 						else if($(value).val()=='bottle'){
// 							oo[2] = parseInt(oo[2]*temp[1]);
// 							$(this).parent().find('p').html(old[0]+'<br>特價 : '+oo[2]+'元<br>');	
// 						}
// 						$(this).parent('p').html();
// 					};
				});
			}
		});
	
	</script>
</body>
</html>