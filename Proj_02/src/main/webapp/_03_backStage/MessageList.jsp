<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="_03_backStage.model.*"%>
<jsp:useBean id="messageBoardServiceSvc" class="_03_backStage.model.BlogsBackService"></jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8/BIG5">
<title>部落格管理</title>
<!-- <link rel="shortcut icon" href="../img/favicon.ico.png"  type="image/x-icon"/> -->
</head>


<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">管理後台</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="BackStage.jsp">後台首頁 <span class="sr-only">(current)</span></a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        活動管理
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="BookList.jsp">活動表單</a>
                        <a class="dropdown-item" href="BookAdd.jsp">新增活動</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="MessageList.jsp">部落格管理</a>
                </li>
            </ul>
        </div>
    </nav>
<!-- <header class="intro"> -->
<!--         <div class="intro-body">          -->
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

	<table border='1' bordercolor='#CCCCFF' >
	<thead>
 
		<tr>
			<th>編號</th>
			<th>會員E-Mail</th>
			<th>部落格圖片</th>
			<th>部落格內容</th>
			<th width="8%">留言時間</th>
			<th width="8%">部落格類型</th>
			<th>觀看數</th>
			<th>檢舉數</th>
			<th width="10%"></th>
					
		</tr>
		</thead>
		<tbody>
		<c:forEach var="blogsServiceVO" items="${messageBoardServiceSvc.all}">
			<tr aligh='center' valigh='middle'>
				<td>${blogsServiceVO.articleId}</td> 				
				<td>${blogsServiceVO.memberEmail}</td> 
				<td>
                 <img height="500" width="500" src="${pageContext.request.contextPath}${blogsServiceVO.blogPhoto}"/>
				</td>                        
				<td>${blogsServiceVO.articleContent}</td> 
				<td>${blogsServiceVO.postTime}</td>
				<td>${blogsServiceVO.articleType}</td> 
				<td>${blogsServiceVO.viewNum}</td>
				<td>${blogsServiceVO.likeNum}</td>
				<td style='text-align:center'>
							<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/msg/msg.do">
							<input type="submit" value="隱藏">
							<input type="hidden" name="ArticleId" value="${blogsServiceVO.articleId}">
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
        
<!--     </header> -->
	<%-- 	<%@ include file="page2.file" %>				 --%>
</body>
<script type="text/javascript">
$(function () {

    $("#myTable").tablesorter({widgets: ['zebra']});
    
});
</script>
<script type="text/javascript" src="../js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="../js/jquery.tablesorter.js"></script> 
 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js" integrity="sha384-a5N7Y/aK3qNeh15eJKGWxsqtnX/wWdSZSKp+81YjTmS15nvnvxKHuzaWwXHDli+4" crossorigin="anonymous"></script>
</html>