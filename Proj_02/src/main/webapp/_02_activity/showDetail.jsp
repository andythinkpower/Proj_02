<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

 <style>
        div{
            padding-top:10px;
            font-size:1.3em;
            width:50%;
        }
        .big{
                border:2px solid red;
                 margin-top:20px;
        }
        
    </style>
</head>
<body>
<!-- 	<h1>顯示細節</h1> -->
<%-- 	<c:forEach var="result" items="${detail}"> --%>
<!-- 	<div> -->
<%-- 	<h1>${result.note } </h1> --%>
<%-- <%-- 	<input type="hidden" value="${result.actDetail }"> --%> --%>
<%-- <%-- 	<h2>活動內容:${result.note}</h2><span>停留時間:${result.times}<br></span> --%> --%>
<%-- <%-- 	<span>類型:${result.kinds}</span> --%> --%>
<!-- 	</div>	 -->
<%-- 	</c:forEach> --%>
	
	
	<c:forEach var="act" items="${Allact}">
<%-- 	<c:url value="/activity/temp.do" var="path" scope="page"> --%>
<%-- 			<c:param name="activityID" value="${act[0]}"></c:param> --%>
<%-- 			<c:param name="actStartDate" value="${act[1]}"></c:param> --%>
<%-- 			<c:param name="actRegion" value="${act[2]}"></c:param> --%>
<%-- 			<c:param name="actTitle" value="${act[3]}"></c:param> --%>
<%-- 			<c:param name="introduction" value="${act[4]}"></c:param> --%>
<%-- 			<c:param name="privacy" value="${act[5]}"></c:param> --%>
<%-- 			<c:param name="clickNumber" value="${act[6]}"></c:param> --%>
<%-- 			<c:param name="memberID" value="${act[7]}"></c:param> --%>
<%-- 		</c:url> --%>
	<div class="big">行程名稱${act.actTitle }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;點閱率:${act.clickNumber}
	<input type="hidden" name="activityID" value="${act.activityID }">
	
	<div >行程時間:${act.actStartDate}</div>
	<span>地區:${act.actRegion}<br></span>
	<p>活動簡介:${act.introduction}</p>
	<!-- 編輯要跳往活動細節頁面 -->
	<div>
	<a href="${path }">編輯</a>
	</div>
	</div>	
	</c:forEach>
	
	
	
	
	
	
	
	
</body>
</html>