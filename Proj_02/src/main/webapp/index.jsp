<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
	integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
	integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
	crossorigin="anonymous"></script>
<title>台北通首頁</title>

<style>
        body {
            font-family: Microsoft JhengHei;
/* 			background-color:	#F2E6E6; */
			background-image:url('${pageContext.request.contextPath}/img/event_background.jpg');
			background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            background-size: cover;
        }
        
       
        
</style>
</head>
<body>
	<c:set scope="session" value="${member}" var='mem' />
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
						<div style='display:none'>99916308</div>
							<img class="d-block img-fluid hot" id="img1" src="http://cultureexpress.taipei/Files/Event/LogoTemp/7cc106bb9e484cc3b8acd30da3bcfdf2.jpg"
								alt="First Slide" style="height: 400px; width: 800px">

						</div>
						<div class="carousel-item">
						<div style='display:none'>99916488</div>
							<img class="d-block img-fluid hot" id="img2" src="http://cultureexpress.taipei/Files/Event/LogoTemp/126ac848561e44988bdb376338c92fe5.jpg"
								alt="Second Slide" style="height: 400px; width: 800px">

						</div>
						<div class="carousel-item">
						<div style='display:none'>99916321</div>
							<img class="d-block img-fluid hot" id="img3" src="http://cultureexpress.taipei/Files/Event/LogoTemp/c0ae963354f14f20997fd852137bd9e7.jpg"
								alt="Third Slide" style="height: 400px; width: 800px">

						</div>
						<div class="carousel-item">
						<div style='display:none'>99916667</div>
							<img class="d-block img-fluid hot" id="img4" src="http://cultureexpress.taipei/Files/Event/LogoTemp/c244b29cc97040a3b113fd75aff83293.jpg"
								alt="Third Slide" style="height: 400px; width: 800px">

						</div>
						<div class="carousel-item">
						<div style='display:none'>99916042</div>
							<img class="d-block img-fluid hot" id="img5"
								src="http://cultureexpress.taipei/Files/Event/LogoTemp/a2213621f90c4d0e81a0d73b27a05873.jpg" alt="Third Slide"
								style="height: 400px; width: 800px">

						</div>
					</div>
					<!-- 上一頁 -->
					<a href=".haha" class="carousel-control-prev bg-black"
						data-slide="prev"> <span class="carousel-control-prev-icon"></span>
					</a>
					<!-- 下一頁 -->
					<a href=".haha" class="carousel-control-next bg-black"
						data-slide="next"> <span class="carousel-control-next-icon"></span>
					</a>
				</div>
			</div>
		</div>
		
		<br><br><br>
		<br>
		<br>
		
	<div class="container mt-3">
		<h1>最新上架</h1>
		<ul class="nav nav-pills red mb-3" id="InsertTime" style="background-color:rgb(227, 215, 188)">
			<li class="nav-item classType"><a class="nav-link active" data-toggle="pill" href="#本周活動0">全部</a></li>
			<li class="nav-item classType"><a class="nav-link " data-toggle="pill" href="#本周活動1">休閒</a></li>
			<li class="nav-item classType"><a class="nav-link " data-toggle="pill" href="#本周活動2">展覽</a></li>
			<li class="nav-item classType"><a class="nav-link " data-toggle="pill" href="#本周活動3">音樂</a></li>
			<li class="nav-item classType"><a class="nav-link " data-toggle="pill" href="#本周活動4">表演</a></li>
			<li class="nav-item classType"><a class="nav-link " data-toggle="pill" href="#本周活動5">研習</a></li>
			<li class="nav-item classType"><a class="nav-link " data-toggle="pill" href="#本周活動6">親子</a></li>
			<li class="nav-item classType"><a class="nav-link " data-toggle="pill" href="#本周活動7">影視</a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane fade show active" id="InsertTime">
				<div class="card " style="background-color:rgb(227, 215, 188)">
					<div class="row">
						<div class="col m-2 pl-3">
							<p style="display:none;"></p><img id='InsertTime0' class="img" src="img/dog.jpg" style="width:450px;height:250px">
						</div> 
						<div class="col m-2">
							<div class="row">
								<div class="col"><p style="display:none;"></p><img id='InsertTime1' class="img" src="" style="width:200px;height:115px"></div>
								<div class="col"><p style="display:none;"></p><img id='InsertTime2' class="img" src="img/test.jpg" style="width:200px;height:115px"></div>
							</div>
							<div class="row mt-2 pt-2">
								<div class="col"><p style="display:none;"></p><img id='InsertTime3' class="img" src="img/test.jpg" style="width:200px;height:115px"></div>
								<div class="col"><p style="display:none;"></p><img id='InsertTime4' class="img" src="img/test.jpg" style="width:200px;height:115px"></div>
							</div>
						</div>					
					</div>
				</div>
			</div>	
		</div>
		
		<h1>熱門收藏</h1>
		<ul class="nav nav-pills red mb-3 " id='collectionCount' style="background-color:rgb(227, 215, 188)">
			<li class="nav-item classType"><a class="nav-link active" data-toggle="pill" href="#本周活動0">全部</a></li>
			<li class="nav-item classType"><a class="nav-link " data-toggle="pill" href="#本周活動1">休閒</a></li>
			<li class="nav-item classType"><a class="nav-link " data-toggle="pill" href="#本周活動2">展覽</a></li>
			<li class="nav-item classType"><a class="nav-link " data-toggle="pill" href="#本周活動3">音樂</a></li>
			<li class="nav-item classType"><a class="nav-link " data-toggle="pill" href="#本周活動4">表演</a></li>
			<li class="nav-item classType"><a class="nav-link " data-toggle="pill" href="#本周活動5">研習</a></li>
			<li class="nav-item classType"><a class="nav-link " data-toggle="pill" href="#本周活動6">親子</a></li>
			<li class="nav-item classType"><a class="nav-link " data-toggle="pill" href="#本周活動7">影視</a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane fade show active" >
				<div class="card " style="background-color:rgb(227, 215, 188)">
					<div class="row">
						<div class="col m-2 pl-3">
							<p style="display:none;"></p><img id='collectionCount0' class="img" src="img/dog.jpg" style="width:450px;height:250px">
						</div> 
						<div class="col m-2">
							<div class="row">
								<div class="col"><p style="display:none;"></p><img id='collectionCount1' class="img" src="" style="width:200px;height:115px"></div>
								<div class="col"><p style="display:none;"></p><img id='collectionCount2' class="img" src="img/test.jpg" style="width:200px;height:115px"></div>
							</div>
							<div class="row mt-2 pt-2">
								<div class="col"><p style="display:none;"></p><img id='collectionCount3' class="img" src="img/test.jpg" style="width:200px;height:115px"></div>
								<div class="col"><p style="display:none;"></p><img id='collectionCount4' class="img" src="img/test.jpg" style="width:200px;height:115px"></div>
							</div>
						</div>					
					</div>
				</div>
			</div>	
		</div>
		
		<h1>本周活動</h1>
		<ul class="nav nav-pills red mb-3 " id='thisweek' style="background-color:rgb(227, 215, 188)">
			<li class="nav-item classType"><a class="nav-link active" data-toggle="pill" href="#本周活動0">全部</a></li>
			<li class="nav-item classType"><a class="nav-link " data-toggle="pill" href="#本周活動1">休閒</a></li>
			<li class="nav-item classType"><a class="nav-link " data-toggle="pill" href="#本周活動2">展覽</a></li>
			<li class="nav-item classType"><a class="nav-link " data-toggle="pill" href="#本周活動3">音樂</a></li>
			<li class="nav-item classType"><a class="nav-link " data-toggle="pill" href="#本周活動4">表演</a></li>
			<li class="nav-item classType"><a class="nav-link " data-toggle="pill" href="#本周活動5">研習</a></li>
			<li class="nav-item classType"><a class="nav-link " data-toggle="pill" href="#本周活動6">親子</a></li>
			<li class="nav-item classType"><a class="nav-link " data-toggle="pill" href="#本周活動7">影視</a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane fade show active" >
				<div class="card " style="background-color:rgb(227, 215, 188)">
					<div class="row">
						<div class="col m-2 pl-3">
							<p style="display:none;"></p><img id='thisweek0' class="img" src="img/dog.jpg" style="width:450px;height:250px">
						</div> 
						<div class="col m-2">
							<div class="row">
								<div class="col"><p style="display:none;"></p><img id='thisweek1' class="img" src="" style="width:200px;height:115px"></div>
								<div class="col"><p style="display:none;"></p><img id='thisweek2' class="img" src="img/test.jpg" style="width:200px;height:115px"></div>
							</div>
							<div class="row mt-2 pt-2">
								<div class="col"><p style="display:none;"></p><img id='thisweek3' class="img" src="img/test.jpg" style="width:200px;height:115px"></div>
								<div class="col"><p style="display:none;"></p><img id='thisweek4' class="img" src="img/test.jpg" style="width:200px;height:115px"></div>
							</div>
						</div>					
					</div>
				</div>
			</div>	
		</div>
		
		<h1>熱門分享</h1>
		<ul class="nav nav-pills red mb-3 " id='shareCount' style="background-color:rgb(227, 215, 188)">
			<li class="nav-item classType"><a class="nav-link active" data-toggle="pill" href="#本周活動0">全部</a></li>
			<li class="nav-item classType"><a class="nav-link " data-toggle="pill" href="#本周活動1">休閒</a></li>
			<li class="nav-item classType"><a class="nav-link " data-toggle="pill" href="#本周活動2">展覽</a></li>
			<li class="nav-item classType"><a class="nav-link " data-toggle="pill" href="#本周活動3">音樂</a></li>
			<li class="nav-item classType"><a class="nav-link " data-toggle="pill" href="#本周活動4">表演</a></li>
			<li class="nav-item classType"><a class="nav-link " data-toggle="pill" href="#本周活動5">研習</a></li>
			<li class="nav-item classType"><a class="nav-link " data-toggle="pill" href="#本周活動6">親子</a></li>
			<li class="nav-item classType"><a class="nav-link " data-toggle="pill" href="#本周活動7">影視</a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane fade show active" >
				<div class="card " style="background-color:rgb(227, 215, 188)">
					<div class="row">
						<div class="col m-2 pl-3">
							<p style="display:none;"></p><img id='shareCount0' class="img" src="img/dog.jpg" style="width:450px;height:250px">
						</div> 
						<div class="col m-2">
							<div class="row">
								<div class="col"><p style="display:none;"></p><img id='shareCount1' class="img" src="" style="width:200px;height:115px"></div>
								<div class="col"><p style="display:none;"></p><img id='shareCount2' class="img" src="img/test.jpg" style="width:200px;height:115px"></div>
							</div>
							<div class="row mt-2 pt-2">
								<div class="col"><p style="display:none;"></p><img id='shareCount3' class="img" src="img/test.jpg" style="width:200px;height:115px"></div>
								<div class="col"><p style="display:none;"></p><img id='shareCount4' class="img" src="img/test.jpg" style="width:200px;height:115px"></div>
							</div>
						</div>					
					</div>
				</div>
			</div>	
		</div>
		
		
</div>	
	
		
		
		
		
	<div class="test"></div>

	<script>
		$(function() {
			
			$.getJSON('selectallevent.controller',function(data){
				console.log(data)
			})
			
			
			$(".classType").on('click',function(){
				//取得點選類型
				var type=$(this).text();
				var selectOrder=$(this).parent().attr("id");
				console.log(selectOrder);
				$.getJSON('selectevent.controller',{"types":type,"orders":selectOrder},function(data){
					console.log(data)
					$.each(data,function(i,v){
						console.log(v)
						  $("#"+selectOrder+i+"").attr("src", v.imageFile)
						
						
						//v.eventName;
					})
					
					//console.log(data);
				})
				
				
			})
			
			
			
			
			$("#tabs").tabs();
			$("#tabs2").tabs();

			$('.carousel').carousel({
				//3秒輪播
				interval : 3000,
				keyboard : true,
				//移過去時暫停
				pause : 'hover',
				wrap : true
			});
		});
	</script>



</div>

	<jsp:include page="/commons/footer.jsp"></jsp:include>

</body>
</html>