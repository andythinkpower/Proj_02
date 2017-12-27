<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
	<title>台北通首頁</title>
	
	<style>
	body {
			font-family: Microsoft JhengHei;
/* 			background-color:	#F2E6E6; */
			background-image:url('${pageContext.request.contextPath}/img/OGA1IU0.jpg');
			background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            background-size: cover;
		}
	
</style>
</head>
<body>
<c:set scope="session" value="${member}" var='mem'/>
<c:choose>
	<c:when test="${not empty mem }">
		<jsp:include page="/commons/header_login.jsp"></jsp:include>
	</c:when>
	<c:otherwise>
		<jsp:include page="/commons/header.jsp"></jsp:include>
	</c:otherwise>
</c:choose>
 <div class="container mt-5">
                <div class="row">
                    <div class="col-sm-8 m-auto">
                        <div class="carousel slide mb-5 haha" data-ride="carousel">
                            <!-- 輪播牆 下面的位置-->
                            <ol class="carousel-indicators">
                                <li class="active" data-target=".haha" data-slide-to="0"></li>
                                <li data-target=".haha" data-slide-to="1"></li>
                                <li data-target=".haha" data-slide-to="2"></li>
                                <li data-target=".haha" data-slide-to="3"></li>
                                <li data-target=".haha" data-slide-to="4"></li>
                            </ol>
                            <div class="carousel-inner" role="listbox">
                                <!-- 輪播牆的各個項目 -->
                                <div class="carousel-item active">
                                    <img class="d-block img-fluid" src="img/test.jpg" alt="First Slide" style="height:400px;width:800px">
                                    <div class="carousel-caption d-none d-md-block">
                                        <h3>這邊放標題-1</h3>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <img class="d-block img-fluid" src="img/dog.jpg" alt="Second Slide" style="height:400px;width:800px">
                                    <div class="carousel-caption d-none d-md-block">
                                        <h3>這邊放標題-2</h3>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <img class="d-block img-fluid" src="img/nopic.jpg" alt="Third Slide" style="height:400px;width:800px">
                                    <div class="carousel-caption d-none d-md-block">
                                        <h3>這邊放標題-3</h3>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <img class="d-block img-fluid" src="img/default.jpg" alt="Third Slide" style="height:400px;width:800px">
                                    <div class="carousel-caption d-none d-md-block">
                                        <h3>這邊放標題-4</h3>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <img class="d-block img-fluid" src="img/taipei-logo.jpg" alt="Third Slide" style="height:400px;width:800px">
                                    <div class="carousel-caption d-none d-md-block">
                                        <h3>這邊放標題-5</h3>
                                    </div>
                                </div>
                            </div>
                            <!-- 上一頁 -->
                            <a href=".haha" class="carousel-control-prev bg-black" data-slide="prev">
                                <span class="carousel-control-prev-icon"></span>
                            </a>
                            <!-- 下一頁 -->
                            <a href=".haha" class="carousel-control-next bg-black" data-slide="next">
                                <span class="carousel-control-next-icon"></span>
                            </a>
                        </div>
            </div>
        </div>
    </div>
    <div class="container mt-4">
        <div id="tabs">
            <ul>
                <li><a href="#tabs-1">本周活動</a></li>
                <li><a href="#tabs-2">文藝</a></li>
                <li><a href="#tabs-3">表演</a></li>
            </ul>
            <div id="tabs-1">
                    <div id="ss" class="card bg-info" style="border:2px solid">
                        <div class="row">
                            <div class="col m-2">
                                <img src="${pageContext.request.contextPath}/img/test.jpg" style="width:450px;height:250px" />
                            </div>
                            <div class="col m-2">
                                <div class="row">
                                    <div class="col">
                                        <img src="img/test.jpg" style="width:200px;height:115px" />
                                    </div>
                                    <div class="col">
                                        <img src="img/test.jpg" style="width:200px;height:115px" />
                                    </div>
                                </div>
                                <div class="row mt-2 pt-2">
                                    <div class="col">
                                        <img src="img/test.jpg" style="width:200px;height:115px" />
                                    </div>
                                    <div class="col">
                                        <img src="img/test.jpg" style="width:200px;height:115px" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <!-- 間隔 -->
            </div>
            <div id="tabs-2">
                <div id="ss" class="card bg-info" style="border:2px solid">
                    <div class="row">
                        <div class="col m-2">
                            <img src="img/nopic.jpg" style="width:450px;height:250px" />
                        </div>
                        <div class="col m-2">
                            <div class="row">
                                <div class="col">
                                    <img src="img/test.jpg" style="width:200px;height:115px" />
                                </div>
                                <div class="col">
                                    <img src="img/test.jpg" style="width:200px;height:115px" />
                                </div>
                            </div>
                            <div class="row mt-2 pt-2">
                                <div class="col">
                                    <img src="img/test.jpg" style="width:200px;height:115px" />
                                </div>
                                <div class="col">
                                    <img src="img/test.jpg" style="width:200px;height:115px" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 間隔 -->
            </div>
            <div id="tabs-3">
                <div id="ss" class="card bg-info" style="border:2px solid">
                    <div class="row">
                        <div class="col m-2">
                            <img src="${pageContext.request.contextPath}/img/test.jpg" style="width:450px;height:250px" />
                        </div>
                        <div class="col m-2">
                            <div class="row">
                                <div class="col">
                                    <img src="${pageContext.request.contextPath }/img/default.jpg" style="width:200px;height:115px" />
                                </div>
                                <div class="col">
                                    <img src="img/test.jpg" style="width:200px;height:115px" />
                                </div>
                            </div>
                            <div class="row mt-2 pt-2">
                                <div class="col">
                                    <img src="img/test.jpg" style="width:200px;height:115px" />
                                </div>
                                <div class="col">
                                    <img src="img/test.jpg" style="width:200px;height:115px" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 間隔 -->
            </div>
        </div>
    </div>


    <!-- hahaha-->
    <div class="container mt-4">
        <div id="tabs2">
            <ul>
                <li><a href="#tabs-1">熱門收藏</a></li>
                <li><a href="#tabs-2">文藝</a></li>
                <li><a href="#tabs-3">表演</a></li>
            </ul>
            <div id="tabs-1">
                <div id="ss" class="card bg-info" style="border:2px solid">
                    <div class="row">
                        <div class="col m-2">
                            <img src="img/test.jpg" style="width:450px;height:250px" />
                        </div>
                        <div class="col m-2">
                            <div class="row">
                                <div class="col">
                                    <img src="img/test.jpg" style="width:200px;height:115px" />
                                </div>
                                <div class="col">
                                    <img src="img/test.jpg" style="width:200px;height:115px" />
                                </div>
                            </div>
                            <div class="row mt-2 pt-2">
                                <div class="col">
                                    <img src="img/test.jpg" style="width:200px;height:115px" />
                                </div>
                                <div class="col">
                                    <img src="img/test.jpg" style="width:200px;height:115px" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 間隔 -->
            </div>
            <div id="tabs-2">
                <div id="ss" class="card bg-info" style="border:2px solid">
                    <div class="row">
                        <div class="col m-2">
                            <img src="${pageContext.request.contextPath }/img/nopic.jpg" style="width:450px;height:250px" />
                        </div>
                        <div class="col m-2">
                            <div class="row">
                                <div class="col">
                                    <img src="img/test.jpg" style="width:200px;height:115px" />
                                </div>
                                <div class="col">
                                    <img src="img/test.jpg" style="width:200px;height:115px" />
                                </div>
                            </div>
                            <div class="row mt-2 pt-2">
                                <div class="col">
                                    <img src="img/test.jpg" style="width:200px;height:115px" />
                                </div>
                                <div class="col">
                                    <img src="img/test.jpg" style="width:200px;height:115px" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 間隔 -->
            </div>
            <div id="tabs-3">
                <div id="ss" class="card bg-info" style="border:2px solid">
                    <div class="row">
                        <div class="col m-2">
                            <img src="img/test.jpg" style="width:450px;height:250px" />
                        </div>
                        <div class="col m-2">
                            <div class="row">
                                <div class="col">
                                    <img src="img/default.jpg" style="width:200px;height:115px" />
                                </div>
                                <div class="col">
                                    <img src="img/test.jpg" style="width:200px;height:115px" />
                                </div>
                            </div>
                            <div class="row mt-2 pt-2">
                                <div class="col">
                                    <img src="img/test.jpg" style="width:200px;height:115px" />
                                </div>
                                <div class="col">
                                    <img src="img/test.jpg" style="width:200px;height:115px" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 間隔 -->
            </div>
        </div>
    </div>


<script>
$( function() {
    $("#tabs").tabs();
    $("#tabs2").tabs();

    $('.carousel').carousel({
        //3秒輪播
        interval: 3000,
        keyboard: true,
        //移過去時暫停
        pause: 'hover',
        wrap: true
    });
} );

</script>


    
<jsp:include page="/commons/footer.jsp"></jsp:include>
</body>
</html>