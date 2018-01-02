<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
	integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
	integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
	crossorigin="anonymous"></script>

<title>收藏顯示頁面</title>
<style type="text/css">
body {
	font-family: Microsoft JhengHei;
	/* 			background-color:	#F2E6E6; */
	background-image:
		url('${pageContext.request.contextPath}/img/101-3.jpg');
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-position: center;
	background-size: cover;
	height: 100%;
	margin: 0;
}

</style>


</head>
<body background="">
	<div id='header' class='navbar-fixed-top'>
		<c:set var='mem' value="${member }"></c:set>
		<c:choose>
			<c:when test="${not empty mem }">
				<jsp:include page="../commons/header_login.jsp" />
			</c:when>
			<c:otherwise>
				<jsp:include page="../commons/header.jsp" />
			</c:otherwise>
		</c:choose>
	</div>
	<p id="member" style="display: none;">${member.memberemail }</p>

	<div id="wholePage"></div>

	<div id='allevent'></div>
	<div class="push"></div>
	<div id='footer'>
		<jsp:include page="../commons/footer.jsp" /></div>

	<script>
		$(function(){
			var email =$("#member").text();
			loadevent();
			function loadevent(){
				$.getJSON('getallFavoritesevent02.controller', {'email':email }, function (data) {
				$.each(data, function (i, event01) {
				//console.log(event01)
				var title = (event01.eventName.length>12)?(event01.eventName.substring(0,13)+"..."):event01.eventName;
				var id=event01.eventID; 
				var img=(event01.imageFile.length>5)?event01.imageFile:'../img/taipei_culture.png';
				var link="../_04_EventPage/eventSelf.jsp?eventID="+id;
				
				var act=$("<div class='col-4'>").html("<div class='card  target' style='width:300px;border:1px solid #BEBEBE;'><div class='actID' style='display:none;'>"+
             			+id+"</div><img class='card-img-top show' src='"+img+"' alt='Card image' width='300' height='250'/>"+
             			"<div class='card-body' style='background-color:#F2E6E6'><h4 class='card-title'>"+title+"</h4><p class='card-text'>出發日期:</p>"+
             			"<div class='row float-xl-right px-2 '><button class='btn btn-danger delete'>刪除</button></div></div></div>");   			

     							if(i%3==0){
     								container_temp=$("<div class='container'></div>");
         							row_temp=$("<div class='row mt-3'></div>");
         							row_temp.append(act);
         							container_temp.append(row_temp);
         							container_temp.append("<br>");
         							$("#wholePage").append(container_temp);
     							}else{
     								row_temp.append(act);
     							}
				});
				});
			}
		});
		
	</script>

</body>
</html>