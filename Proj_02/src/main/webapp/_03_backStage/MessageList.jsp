<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="_03_backStage.model.*"%>
<jsp:useBean id="messageBoardServiceSvc" class="_03_backStage.model.BlogsBackService"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8/BIG5">
<title>部落格管理</title>
<link rel="shortcut icon" href="../img/favicon.ico.png"  type="image/x-icon"/>
</head>


<body>
	<br>
	<br>
	<br>
	<br>
	<br>
<header class="intro">
        <div class="intro-body">         
 					<%-- 錯誤列表 --%>
	<c:if test="${not empty errorMsgs}">
		<font color='red'>請修正下列錯誤:
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<il>${message}</il>
				</c:forEach>
			</ul>
		</font>
	</c:if>

	<table border='1' bordercolor='#CCCCFF' width='800' id="myTable" class="tablesorter">
	<thead>
		<tr>
			<th>編號</th>
			<th>會員E-Mail</th>
			<th>部落格圖片</th>
			<th width="35%">部落格內容</th>
			<th>留言時間</th>
			<th width="10%">觀看數</th>
			<th width="10%">檢舉數</th>
			<th width="10%">狀態(顯示/隱藏)</th>
			<th></th>		
		</tr>
		</thead>
		<tbody>
		<c:forEach var="blogsServiceVO" items="${messageBoardServiceSvc.all}">
			<tr aligh='center' valigh='middle'>
				<td>${blogsServiceVO.articleId}</td> 				
				<td>${blogsServiceVO.memberEmail}</td> 
				<td>
                   <img height="80" width="70" src="${pageContext.servletContext.contextPath}/_03_backStage/controller/MsgGetImage?articleId=${blogsServiceVO.articleId}" />
				</td>
				<td>${blogsServiceVO.articleContent}</td> 
				<td>${blogsServiceVO.postTime}</td> 
				<td>${blogsServiceVO.viewNum}</td>
				<td>${blogsServiceVO.likeNum}</td>
				<td>
							<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/msg/msg.do">
							<input type="submit" value="刪除">
							<input type="hidden" name="ArticleId" value="${blogsbackVO.articleId}">
							<input type="hidden" name="action" value="delete"></FORM>			
						</td>	
<%-- 				<c:if test="${blogsServiceVO.articleType == 0}"> --%>
<!-- 				   <td><font>顯示</font></td> -->
<!-- 				   <td> -->
<%-- 							<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/msg/msg.do" enctype="multipart/form-data" > --%>
<!-- 							<input type="submit" value="隱藏"> -->
<%-- 							<input type="hidden" name="ArticleId" value="${blogsServiceVO.articleId}"> --%>
<!-- 							<input type="hidden" name="action" value="display"></FORM>			 -->
<!-- 						</td> -->
<%-- 				</c:if> --%>
<%-- 				<c:if test="${blogsServiceVO.articleType == 1}"> --%>
<!-- 				   <td><font color='red'>隱藏</font></td> -->
<!--  						<td> -->
<%-- 							<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/msg/msg.do" enctype="multipart/form-data" > --%>
<!-- 							<input type="submit" value="顯示"> -->
<%-- 							<input type="hidden" name="ArticleId" value="${blogsServiceVO.articleId}"> --%>
<!-- 							<input type="hidden" name="action" value="hide"></FORM>			 -->
<!-- 						</td> -->
<%-- 				</c:if> --%>
			</tr>
		</c:forEach>
		</tbody>
	</table>
        </div>
    </header>
	<%-- 	<%@ include file="page2.file" %>				 --%>
</body>
<script type="text/javascript">
$(function () {

    $("#myTable").tablesorter({widgets: ['zebra']});
    
});
</script>
<script type="text/javascript" src="../js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="../js/jquery.tablesorter.js"></script> 
</html>