<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<title>收藏顯示頁面</title>
<style type="text/css">
	body {
			font-family: Microsoft JhengHei;
/* 			background-color:	#F2E6E6; */
			background-image:url('${pageContext.request.contextPath}/img/101-3.jpg');
			background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            background-size: cover;
            height: 100%;
			margin: 0;

		}
div[name="event"]{
 width:350px;
 height:320px;
 border:1px solid #BEBEBE;
 float:left;
}	
#allevent{
margin:0 10%;
min-height:100%;;
padding:0 45px;
margin-bottom: -190px;

}

div[name="eventname"]{

}
div[name="eventimg"]{
width:350;
height:250;

}

#footer {
    /* 設定footer的高度 */
     box-sizing: border-box;
    /* 設定footer絕對位置在底部 */
     float:right;
     bottom:0;
    /* 展開footer寬度 */
    width: 100%;
   
   
}
.push {

}

img[name="eventimg"]{
width:350px;
height:250px;
}
h6{
color: blue;
}

</style>


</head>
<body background="">
<div id='header' class='navbar-fixed-top'>
	<c:set var='mem' value="${member }" ></c:set>
	<c:choose>
		<c:when test="${not empty mem }">
			<jsp:include page="../commons/header_login.jsp"/>
		</c:when>
		<c:otherwise>
			<jsp:include page="../commons/header.jsp"/>
		</c:otherwise>
	</c:choose>
	</div>
	<p id="member" style="display: none;" >${member.memberemail }</p>
<div id='allevent'></div>
<div class="push"></div>
<div id='footer' >
<jsp:include page="../commons/footer.jsp"/></div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>

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
				var button='<button type="button"  name="del_favorite" eventid='+id+'  class="btn btn-danger">取消</button>';
				var event=$('<div class="pt-3 px-2"  name="event" title="'+event01.eventName+'">').html('<div name="eventname">'+button+'<h6><b>'+title+
                										'</b></h6></div><div name="eventimg"><a href="'+link+
                										'"><img name="eventimg" src="'+img+'"/></a></div>'+
                				                        '</div>')
				$('#allevent').append(event)
				});
				$('button[name="del_favorite"]').click(function () {
	    		 	var eventID =$(this).attr("eventid");
	    		 	$.post('disFavorite.controller',{'eventid':eventID,'email':email},function(data){
	    		 		window.location.reload()
	    			 });
	    		 	
	       		 });
			});
			}
			
			});
		
	</script>

</body>
</html>