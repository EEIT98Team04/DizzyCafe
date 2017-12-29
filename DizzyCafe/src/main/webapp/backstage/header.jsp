<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


  <!-- Bootstrap core CSS-->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">
  <link href="css/changeFont.css" rel="stylesheet">

  <!-- Navigation-->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/backstage/index.jsp">DizzyCafe Backstage</a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
          <a class="nav-link" href="${pageContext.request.contextPath }/index.jsp">
            <i class="fa fa-fw fa-dashboard"></i>
            <span class="nav-link-text">前台首頁</span>
          </a>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Menu Levels">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMulti" data-parent="#exampleAccordion">
            <i class="fa fa-fw fa-futbol-o"></i>
            <span class="nav-link-text">活動管理</span>
          </a>
          <ul class="sidenav-second-level collapse" id="collapseMulti">
            <li>
              <a href="${pageContext.request.contextPath }/backstage/activitiymanage.jsp">活動清單</a>
            </li>
            <li>
              <a href="${pageContext.request.contextPath }/backstage/dailyeventmanage.jsp">每日活動</a>
            </li>
          </ul>
        </li>
        
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
          	<a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#manage" data-parent="#exampleAccordion">
          		<i class="fa fa-fw fa-book"></i>
            	<span class="nav-link-text">論壇管理</span>
          	</a>
          	<ul class="sidenav-second-level collapse" id="manage">
            	<li>
              		<a href="/DizzyCafe/backstage/forum.jsp">公告管理</a>
          		</li>
            	<li>
              		<a href="/DizzyCafe/backstage/report.jsp">檢舉管理</a>
           		</li>
        	</ul>
        </li>
        
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Charts">
<%--           <a class="nav-link" href="${pageContext.request.contextPath }/backstage/courseManage.jsp"> --%>
<!--             <i class="fa fa-fw fa-book"></i> -->
<!--             <span class="nav-link-text">課程管理</span> -->
<!--           </a> -->
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#course" data-parent="#exampleAccordion">
            <i class="fa fa-fw fa-book"></i>
            <span class="nav-link-text">課程管理</span>
          </a>
          <ul class="sidenav-second-level collapse" id="course">
            <li>
              <a href="${pageContext.request.contextPath }/backstage/courseManage.jsp">課程清單</a>
            </li>
            <li>
              <a href="${pageContext.request.contextPath }/backstage/courseCalendar.jsp">行事曆</a>
            </li>
            </ul>
        </li>
      </ul>
      <ul class="navbar-nav sidenav-toggler">
        <li class="nav-item">
          <a class="nav-link text-center" id="sidenavToggler">
            <i class="fa fa-fw fa-angle-left"></i>
          </a>
        </li>
      </ul>
      <ul class="navbar-nav ml-auto">
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath }/backstage/logout.controller">
            <i class="fa fa-fw fa-sign-out"></i>Logout</a>
        </li>
      </ul>
    </div>
  </nav>
  
  