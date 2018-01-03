<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="_03_backStage.model.*"%>
<jsp:useBean id="productListingBookSvc" class="_03_backStage.model.EventService"></jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8/BIG5">
<title>活動表單</title>
<link rel="shortcut icon" href="../img/favicon.ico.png"  type="image/x-icon"/>

<script type="text/javascript" src="../js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="../js/jquery.tablesorter.js"></script> 
</head>

 <style> 
.peoplePic {
	background: #1e90ff;
	-webkit-clip-path: circle(50% at 50% 50%);
	clip-path: circle(50% at 50% 50%);
	height: 40px;
	width: 40px;
}

input[type="submit"] {
	position: relative;
	display: inline-block;
 	background: #D0EEFF;
 	border: 1px solid #99D3F5;
 	border-radius: 4px;
 	padding: 4px 12px;
 	overflow: hidden;
 	color: #1E88C7;
 	text-decoration: none;
 	text-indent: 0;
 	line-height: 20px;
}

/* .file { */
/* 	position: relative; */
/* 	display: inline-block; */
/* /*  	background: #D0EEFF; */ */
/*  	border: 1px solid #99D3F5; */
/*  	border-radius: 4px; */
/*  	padding: 4px 12px; */
/*  	overflow: hidden; */
/*  	color: #1E88C7; */
/*  	text-decoration: none; */
/*  	text-indent: 0; */
/*  	line-height: 20px; */
/* } */

/* .file:hover { */
/* 	background: #AADFFD; */
/*  	border-color: #78C3F3; */
/*  	color: #004974; */
/*  	text-decoration: none; */
/* } */

/* .file input { */
/*  	position: absolute; */
/*  	font-size: 100px; */
/*  	right: 0; */
/*  	top: 0; */
/*  	opacity: 0; */
/* } */

/* .TrLeft{ */
/* 	width:300px; */
/* } */

/*  table{  */
/*  	width:1650px;  */
/* 	background-color:#CEF6F5;  */
/*   	margin-left:50px;   */
/*  	color:black;  */
/*  	font-family:Microsoft JhengHei;  */
/*  	border:3px black solid;  */
/*   	font-size: 16px;  */
/*  }  */
/* table.tablesorter { */
/* font-family:arial; */
/* 	background-color: #CDCDCD; */
/* 	margin:10px 0pt 15px; */
/* 	font-size: 13pt; */
/* 	width: 100%; */
/* 	text-align: left; */
/* } */
/* table.tablesorter thead tr th, table.tablesorter tfoot tr th { */
/*   	background-color: #F7D3F3;   */
/* 	border: 1px solid #FFF; */
/* 	font-size: 13pt; */
/* 	padding: 4px; */
/* 	color:black; */
/* } */
/* table.tablesorter thead tr .header { */
/* 	background-image: url(../img/bg.gif); */
/* 	background-repeat: no-repeat; */
/* 	background-position: center right; */
/* 	cursor: pointer; */
/* } */
/* table.tablesorter tbody td { */
/* 	color: #3D3D3D; */
/* 	padding: 4px; */
/* 	background-color: #FFF; */
/* 	vertical-align: top; */
/* } */
/* table.tablesorter tbody tr.odd td { */
/* 	background-color:#F4F0F0; */
/* } */
/* table.tablesorter thead tr .headerSortUp { */
/* 	background-image: url(../img/asc.gif); */
/* } */
/* table.tablesorter thead tr .headerSortDown { */
/* 	background-image: url(../img/desc.gif); */
/* } */
/* table.tablesorter thead tr .headerSortDown, table.tablesorter thead tr .headerSortUp { */
/* background-color: #9BC5FD; */
/* } */


/* .wire{ */
/* 	padding: 8px; */
/* 	text-align: left; */
/* 	border-bottom: 2px solid #D8CEF6; */
/* } */

/* .sexyborder{ */
/* 	width:	555px; */
/* 	border: 1px solid #0066cc; */
/* 	padding: 5px; */
/* 	-webkit-border-radius: 5px; */
/* 	-moz-border-radius: 5px; */
/* 	border-radius: 5px; */
/* } */

<!-- </style>  -->

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


	<br>
<header class="intro">
        <div class="intro-body">         
	<c:if test="${not empty errorMsgs}">
		<font color='red'>請修正下列錯誤:
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<il>${message}</il>
				</c:forEach>
			</ul>
		</font>
	</c:if>

	<table border='1' bordercolor='#CCCCFF' width='100%' id="myTable" class="tablesorter">
	<thead>
		<tr>
			<th>活動編號</th>
			<th>活動圖片</th>
			<th>活動名稱</th>
			<th width='8%'>活動票價</th>
			<th>是否免費</th>
			<th>活動開始日期</th>
			<th>活動結束日期</th>
			<th>演出單位</th>
			<th>活動類型</th>
			<th>檢舉數</th>
			<th width='5%'>活動內容</th>
			<th></th>
			<th></th>
		</tr>
		</thead>
<%-- 		<%@ include file="page1.file"%> --%>
	<tbody>
		<c:forEach var="eventVO" items="${productListingBookSvc.all}">
			<tr align='center' >
				<td align="center" >${eventVO.eventID}</td> 				
				<td>
				<c:if test="${eventVO.imageFile == 'null'}">
					<img height="150" width="150" src="../img/taipei_culture.png"/>
                </c:if> 
                <c:if test="${eventVO.imageFile != 'null'}">
					<img height="150" width="150" src="${eventVO.imageFile}" onerror="javascript:this.src='../img/taipei_culture.png'"/>
                </c:if> 
                   
				<td>${eventVO.eventName}</td> 
				<td>
				<c:if test="${eventVO.fee == 'null'}">
					${eventVO.isCharge}
                </c:if> 
                <c:if test="${eventVO.fee != 'null'}">
					${eventVO.fee}
                </c:if> 
                </td>
				<td>${eventVO.isCharge}</td> 
				<td>${eventVO.dtStart}</td> 
				<td>${eventVO.durationEnd}</td> 
				<td>${eventVO.showGroupName}</td> 
				<td>${eventVO.eventTypeID}</td>
				<td>${eventVO.isBlock}</td>
				<td align="left">${eventVO.VContent}</td> 
 						<td>
							<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/book/book.do">
							<input type="submit" value="修改">
							<input type="hidden" name="EventID" value="${eventVO.eventID}">
							<input type="hidden" name="action" value="getOne_For_Update"></FORM>			
						</td>
						<td>
							<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/book/book.do">
							<input type="submit" value="隱藏">
							<input type="hidden" name="EventID" value="${eventVO.eventID}">
							<input type="hidden" name="action" value="delete"></FORM>			
						</td>	
			</tr>
		</c:forEach>
		</tbody>
	</table>
        </div>
    </header>
</body>
<script type="text/javascript">
$(function () {

	$("table").tablesorter({
		headers : {
			1 : {sorter : false},
			9 : {sorter : false},
			10 : {sorter : false},
			11 : {sorter : false},
			
		}
	});
    
});
</script>
   <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js" integrity="sha384-a5N7Y/aK3qNeh15eJKGWxsqtnX/wWdSZSKp+81YjTmS15nvnvxKHuzaWwXHDli+4" crossorigin="anonymous"></script>

<script type="text/javascript" src="../js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="../js/jquery.tablesorter.js"></script> 
</html>