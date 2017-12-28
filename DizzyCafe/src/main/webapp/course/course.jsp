<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DizzyCafe課程</title>
<jsp:include page="/HTML/TitleIcon.jsp" />
<style type="text/css">
.img {
	width: 240px;
}

.list {
	margin: 20px auto;
	width: 70%;
}

.page {
	margin: 20px auto;
	width: 50%;
}
#news-list .content:hover .date {
    background: url(../image/idx-10.png) center center no-repeat #FABE00;
}

#news-list .date {
    position: absolute;
    top: 27%;
    left: 15px;
    width: 50px;
    height: 50px;
    text-align: center;
    background: url(../image/idx-10.png) center center no-repeat #979797;
    color: #fff;
}
#news-list .content:first-child {
    padding-top: 0;
}
#news-list .content {
    border-bottom: 1px solid #8E8A85;
    padding: 2.5% 0;
}
.row {
	margin-top: 15px;
    margin-right: -15px;
    margin-left: -15px;
}
#news-list h3 a {
    color: #5b2407;
    font-size: 1em!important;
}
#news-list .more {
    display: inline-block;
    color: #9c3f0d;
    padding: 0 20px 0 0;
    cursor: pointer;
    background: url(../image/nws-02.png) right center no-repeat;
}

</style>
</head>
<body style="font-family: Microsoft JhengHei;">
	<jsp:include page="/HTML/Navbar.jsp" />
	<div style="height: 80px"></div>
	<div class="container row">
      <p style="font-weight:normal;word-spacing:0pt;font-size:32px;text-align:left;line-height:1;padding-left:300px;">課程專區
    </div>
	<div style="width:100%;">
		<article class="container-fluid" style="padding-left:475px">
			<section class="row container" id="news-list">
				<c:forEach var="course" items="${courseList}" varStatus="status">
					<div class="col-sm-8 col-sm-offset-2 col-xs-12">
						<div class="content row">
							<div class="col-md-4 cover">
								<a href="${pageContext.request.contextPath}/course/courseShow.controller?course=${course.courseId}">
									<img class="img-responsive img"
									src="${pageContext.request.contextPath}${course.courseImg}">
								</a>
								<input type="hidden" id="tempTime${status.count }" value="${course.courseBegin}"/>
								<div id="date${status.count }" class="date"></div>
							</div>
							<div class="col-md-8">
								<h3>
									<a href="${pageContext.request.contextPath}/course/courseShow.controller?course=${course.courseId}">
									${course.courseName}</a>
								</h3>
								<p>${course.courseIntro}</p>
								<a class="more"
									href="${pageContext.request.contextPath}/course/courseShow.controller?course=${course.courseId}">看更多</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</section>
		</article>

		<div style="width:300px ; margin:auto" >
			<ul class="pagination page">
				<c:forEach var="pages" begin="1" end="${TotalPages}">
					<li class="page-item"><a class="page-link"
						href="${pageContext.request.contextPath}/course/course.controller?page=${pages}">${pages}</a></li>
				</c:forEach>
			</ul>
		</div>

	</div>
	<script type="text/javascript">
		for(var i = 1;i<=${rows_perPage};i++){
			temp=$('#tempTime'+i).val().split('-');
			$('#date'+i).html("<p style='height:11px;'>"+temp[2]+"</p>");
			$('#date'+i).append(temp[1]+"月");
		}
	</script>
</body>
</html>
