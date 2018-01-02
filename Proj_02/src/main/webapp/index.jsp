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
	<div class="test"></div>

	<script>
		$(function() {
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

hgfhgf

	<script>
	$.ajaxSettings.async = false;
        $(function () {
        	
        	$("body").on('click','.hot',function(){
        		var pk=$(this).prev().text();
        		window.location.href = '<c:url value="/_04_EventPage/eventSelf.jsp?eventID=' + pk +'"/>' ;
        	})
        	
          
             var selectDate = "where dateadd ( week , datediff( week , '' , getdate() ) , 6 ) >= dtStart  and";
             var selectDate2='where';
             var selectOrder="datediff ( day , getdate() , DurationEnd )"
             var selectOrder2='collectionCount desc';
             var selectOrder3="InsertTime desc";
             var selectOrder4="shareCount desc";
             
             var selectArea = "正同埔松安萬信士北內南文";
             var page = 1;
             var type = ["休閒展覽音樂表演研習親子影視", "休閒", "展覽", "音樂", "表演", "研習", "親子", "影視"]
             
             tempfile=[];
             tempID=[];
             temp=[];
             dynamicCard('本周活動',selectDate,selectOrder);
             
            dynamicCard('熱門收藏',selectDate2,selectOrder2);
             
            dynamicCard('最新刊登',selectDate2,selectOrder3);
           
            dynamicCard('熱門分享',selectDate2,selectOrder4);
             
             function dynamicCard(id_name,Date,Order){
            	 var ul = $('<ul class="nav nav-pills red mb-3">');
                 var tab_content = $("<div class='tab-content'>");
                 var container = $("<div class='container mt-3'>"); 
                 date_count = -1;
             $.each(type, function (index, value) {
            	 tempID=[];
            	 tempfile=[];
            	 temp=[];
                 date_count++;
                 if (index == 0) {
                	 $(".test").append("<h2 class='text-center mt-2'>"+id_name+"</h2>");
                     ul.append('<li class="nav-item"><a class="nav-link active" data-toggle="pill" href="#'+id_name + date_count + '" >全部</a></li>');               
                 } else {
                     ul.append('<li class="nav-item"><a class="nav-link " data-toggle="pill" href="#'+ id_name+ date_count + '">' + value + '</a></li>');            
                 }
                 if (index == 0) {
                     tab_content.append($('<div class="tab-pane fade show active" id="'+id_name + date_count + '" ><div class="card bg-info"><div class="row">' +
                  '<div class="col m-2 pl-3"><p style="display:none;"></p><img class="img" src="img/dog.jpg" style="width:450px;height:250px" /></div> <div class="col m-2"><div class="row">' +
                  '<div class="col"><p style="display:none;"></p><img class="img" src="" style="width:200px;height:115px" /></div><div class="col"><p style="display:none;"></p><img class="img" src="img/test.jpg" style="width:200px;height:115px" />' +
                  '</div></div><div class="row mt-2 pt-2"><div class="col"><p style="display:none;"></p><img class="img" src="img/test.jpg" style="width:200px;height:115px" /></div><div class="col">' +
                  '<p style="display:none;"></p><img class="img" src="img/test.jpg" style="width:200px;height:115px" /></div></div></div></div></div></div>'));
                 } else {
                     tab_content.append($('<div class="tab-pane fade show" id="'+id_name + date_count + '" ><div class="card bg-info"><div class="row">' +
                 '<div class="col m-2 pl-3"><p style="display:none;"></p><img class="img" src="img/dog.jpg" style="width:450px;height:250px" /></div> <div class="col m-2"><div class="row">' +
                 '<div class="col"><p style="display:none;"></p><img class="img" src="img/test.jpg" style="width:200px;height:115px" /></div><div class="col"><p style="display:none;"></p><img class="img" src="img/test.jpg" style="width:200px;height:115px" />' +
                 '</div></div><div class="row mt-2 pt-2"><div class="col"><p style="display:none;"></p><img class="img" src="img/test.jpg" style="width:200px;height:115px" /></div><div class="col">' +
                 '<p style="display:none;"></p><img class="img" src="img/test.jpg" style="width:200px;height:115px" /></div></div></div></div></div></div>'));
                 }
                 doSearch(Date, selectArea, value, Order, page);
            
                 
                 temp.push(tempfile);
                 temp.push(tempID);
                 //console.log(temp);
                 container.append(ul);
                 container.append(tab_content);
                
                 $(".test").append(container); 
                 
                  //放圖片             
                 $.each(temp,function(ind,val){
                	 $.each(val,function(i,v){
                		 if(ind==0){
                			 if(i==0){
                				 //console.log("#"+id_name+index);
                        		 $("#"+id_name+index).find(".pl-3 img").attr("src",v);	 
                        	 }else if(i==1){
                        		$("#"+id_name+index).find(".row .col .row:first-child .col:first-child img").attr("src",v);	
                        	 }else if(i==2){
                        		 $("#"+id_name+index).find(".row .col .row:first-child .col:nth-child(2) img").attr("src",v);	
                        	 }else if(i==3){
                        		 $("#"+id_name+index).find(".row .col .row:nth-child(2) .col:first-child img").attr("src",v);
                        	 }else if(i==4){
                        		 $("#"+id_name+index).find(".row .col .row:nth-child(2) .col:nth-child(2) img").attr("src",v);
                        	 }
                		 }else{
                			 if(i==0){
                        		 $("#"+id_name+index).find(".pl-3 p").text(v);	 
                        	 }else if(i==1){
                        		$("#"+id_name+index).find(".row .col .row:first-child .col:first-child p").text(v);	
                        	 }else if(i==2){
                        		 $("#"+id_name+index).find(".row .col .row:first-child .col:nth-child(2) p").text(v);
                        	 }else if(i==3){
                        		 $("#"+id_name+index).find(".row .col .row:nth-child(2) .col:first-child p").text(v);
                        	 }else if(i==4){
                        		 $("#"+id_name+index).find(".row .col .row:nth-child(2) .col:nth-child(2) p").text(v);
                        	 }
                		 }
                	 })
                 })
  				
             })
        }
             
             
             
           //綁定事件 應該可以用迴圈合併
             $("body").on('click','.img',function(){
            		var pk=$(this).prev().text();
            		//console.log(pk);
            		window.location.href = '<c:url value="/_04_EventPage/eventSelf.jsp?eventID='+pk+'"/>' ;
             })
              
             
          
            
            
           
		
        function doSearch(newDate, newAreas, newTypes,newOrder, page) {
            var count = 0;
            $.getJSON('${pageContext.request.contextPath}/_04_EventPage/searchEvent.controller',{
				  'newDate': newDate,
				  'newAreas': newAreas,
			      'newTypes': newTypes,
			      'newOrder':newOrder, 
				  'pageNumber': page
			}, function (data) {
							    $.each(data, function (i, v) {
							        if (count < 5 &&v.imageFile.length > 5) {
							            count++;						            
							            	tempfile.push(v.imageFile);		
							            	 tempID.push(v.eventID);
							        }
							    })
							}); // JSON END	
        }; // --- controller撈資料 END ---
        
        });
    </script>







</div>

	<jsp:include page="/commons/footer.jsp"></jsp:include>

</body>
</html>