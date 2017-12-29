<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--      <img  src="../img/default.jpg" style="width:150px;"/> -->
    <nav class="navbar navbar-expand-sm navbar-light p-4" style="background-color:	#EBD6D6;">
        <div class="container">
            <a href="${pageContext.request.contextPath}/index.jsp" class="navbar-brand">
                <img src="${pageContext.request.contextPath}/img/taipei-logo.jpg" width="30" height="30" class="d-inline-block align-top" />
                TaipeiTalk
            </a>
            <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <!--search bar start here-->
                <form class="form-inline ml-auto">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-danger my-2 my-sm-0" type="submit">Search</button>
                </form>
                <!--list start here-->
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item px-2">

                        <a href="${pageContext.request.contextPath}/_04_EventPage/eventSearch.jsp" class="nav-link">活動篩選</a>

                    </li>
                    <li class="nav-item px-2">
                        <a href="/Proj_02/_05_web/map.html" class="nav-link">Event Map</a>
                    </li>
                    <li class="nav-item px-2">
                        <a href="${pageContext.request.contextPath}/_06_blog/blog.jsp" class="nav-link">活動誌</a>
                    </li>
                    <!--會員下拉式選單-->
                    <li class="nav-item dropdown mr-3">
                        <a href="${pageContext.request.contextPath}/index.jsp" class="nav-link drop-toggle" data-toggle="dropdown">會員中心</a>
                        <div class="dropdown-menu">
                            <a href="${pageContext.request.contextPath}/_05_web/Calendar.html" class="dropdown-item">行事曆</a>
                            <a href="${pageContext.request.contextPath}/_02_activity/display.jsp" class="dropdown-item">行程安排</a>
                            <a href="${pageContext.request.contextPath}/_02_favorite/fav_display.jsp" class="dropdown-item">活動收藏</a>
                            <a href="${pageContext.request.contextPath}/_06_blog/dashboard.jsp" class="dropdown-item">部落格</a>
                        </div>
                    </li><!--會員下拉式選單end here-->
                    <li class="nav-item dropdown mr-3">
                        <a href="" class="nav-link drop-toggle" data-toggle="dropdown">
                        	<img src='${pageContext.request.contextPath}${member.memberphoto}' width='30px'/>${member.membernickname}</a>
                        <div class="dropdown-menu">
                        <a href="${pageContext.request.contextPath}/_01_member/member.jsp" class="dropdown-item">會員資料修改</a>
                        <a href="${pageContext.request.contextPath}/security/login_out.jsp" class="dropdown-item">登出</a>
                        </div>
                    </li>
                </ul><!--ul3 end here-->
            </div><!--collapse end here-->
        </div><!--container end here-->
    </nav><!--navbar end here-->
    
