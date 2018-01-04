
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="_03_backStage.model.*"%>
<%
      EventVO eventVO = (EventVO) request.getAttribute("eventVO");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8/BIG5">
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- jQuery-ui -->
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- jQuery-ui CSS -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<title>活動新增</title>
<link rel="shortcut icon" href="../img/favicon.ico.png"  type="image/x-icon"/>

<!-- <script src="js/cmxforms.js" type="text/javascript"></script> -->


<style>
#commentForm {
		width: 500px;
	}
	#commentForm label {
		width: 250px;
	}
	#commentForm label.error, #commentForm input.submit {
		margin-left: 253px;
	}
	#signupForm {
		width: 670px;
		margin-left: 5px;
	}
	#signupForm label.error {
		margin-left: 10px;
		width: auto;
		display: inline;
	}
	#newsletter_topics label.error {
		display: none;
		margin-left: 103px;
	}
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

.file {
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

.file:hover {
	background: #AADFFD;
 	border-color: #78C3F3;
 	color: #004974;
 	text-decoration: none;
}

.file input {
 	position: absolute;
 	font-size: 100px;
 	right: 0;
 	top: 0;
 	opacity: 0;
}

.TrLeft{
	width:300px;
}

table{
	width:400px;
	background-color:#CEF6F5;
	margin-left:60px;
/* 	margin-right:auto; */
	color:black;
	font-family:Microsoft JhengHei;
	border:3px black solid;
 	font-size: 15px;
 	text-align: left;
}

.wire{
	padding: 8px;
	text-align: left;
	border-bottom: 2px solid #D8CEF6;
}

.sexyborder{
	width:	555px;
	border: 1px solid #0066cc;
	padding: 5px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}

#aaa #bbb {
  display: table-cell;
  vertical-align: middle;
}
#aaa #bbb .brand-heading {
  font-size: 40px;
}
#aaa #bbb .intro-text {
  font-size: 18px;
}
#aaa #bbb p {  
    margin: 5px;
    text-align: left;
    color:black;
}
#aaa #bbb .error {  
   color:red;
}
#aaa #bbb .intro-body {  
   margin-left: auto;
   margin-right: auto;
}
@media (min-width: 768px) {
  #aaa {
    height: 100%;
    padding: 0;
  }
  #aaa #bbb .brand-heading {
    font-size: 100px;
  }
  #aaa #bbb .intro-text {
    font-size: 26px;
  }
}

</style>
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

 		<div class="intro-body" >         
 				<table border='1' cellpadding='3' cellspacing='0' width='250'>
		<tr height='5'>
			<td align="center" valign="middle"><h3>活動新增</h3></td>
	</table>
	<%-- 錯誤表列--%>
	
	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/book/book.do"	name="form1" enctype="multipart/form-data"  id="signupForm">

		<fieldset>
<!-- 			<legend>Validating a complete form</legend> -->
			<p>
				<label for="EventID">活動編號<font color=red><b>*</b></font></label>
				<input id="EventID" name="EventID" type="text" >
			</p>
			<p>
				<label for="EventName">活動名稱<font color=red><b>*</b></font></label>
				<input id="EventName" name="EventName" type="text" >

			</p>
			<p>
				<label for="Fee">票價<font color=red><b>*</b></font></label>
				<input id="Fee" name="Fee" type="text">

			</p>
			<p>
				<label for="IsCharge">是否免費<font color=red><b>*</b></font></label>
				<input id="IsCharge" name="IsCharge" type="text">
 			</p> 
			<p>
				<label for="DtStart">活動開始&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>
				<input id="DtStart" name="DtStart" type="date">
			</p>
			<p>
				<label for="DurationEnd">活動結束&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>
				<input id="DurationEnd" name="DurationEnd" type="date">
			</p>
			<p>
				<label for="InsertTime">更新時間&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>
				<input id="InsertTime" name="InsertTime" type="date">
			</p>
			<p style="display:none">
				<label for="CityID">城市名&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>
				<input id="CityID" name="CityID" type="text" value="臺北市">
			</p>
			<p>
				<label for="AreaID">地區&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>
				<input id="AreaID" name="AreaID" type="text">
			</p>
			<p>
				<label for="Address">地址&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>
				<input id="Address" name="Address" type="text">
			</p>
			<p>
				<label for="ShowGroupName">演出單位&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>
				<input id="ShowGroupName" name="ShowGroupName" type="text">
			</p>
			<p>
				<label for="EventTypeID">活動類型&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>
				<input id="EventTypeID" name="EventTypeID" type="text">

			</p>
			<p>
				<label for="VContent">活動內容</label>
				<textarea id="VContent" name="VContent" cols="40" rows="5" style="resize:none;"></textarea>
			</p>
			<p>
			<label for="ImageFile">選擇上傳圖片<font color=red><b>*</b></font></label>
			<img name="blogphoto" width="250" id="img" src="${pageContext.request.contextPath}/img/default.jpg" />
			<input type="file" id="forImg" name="01" value="/uploadFile/123.jpg"/>
			<input type="text" id="forImg" name="ImageFile" value="${pageContext.request.contextPath}/img/123.jpg" style="display: none;"/>
			</p>
			<p>
				<input type="hidden" name="action" value="insert" > <input
				type="submit" value="送出新增" id="submit" >		
			</p>
		</fieldset>
		
	</FORM>
        </div>
	<%-- 	<%@ include file="page2.file" %>				 --%>
</body>
<!-- <script src="../js/jquery.js"></script> -->
<!-- <script src="../js/jquery.validate.js"></script> -->
<script>
$('#submit').click(function() {
				$('#forImg').val('/uploadFile/123.jpg');
			  $( "#signupForm" ).submit();
			});

$().ready(function() {
	// validate the comment form when it is submitted
	$("#commentForm").validate();

	// validate signup form on keyup and submit
	$("#signupForm").validate({
		rules: {
			EventName: "required",
			Fee: {
				required: true,
				number: true
			},
			IsCharge:{
				required: true,
				number: true
			},
// 			ProductListingBook_Quantity: {
// 				required: true,
// 				digits: true
// 			},
			
		},
		messages: {
			EventName: "不可空白",
			Fee: {
				required: "不可空白",
				number: "請輸入數字1~9,可使用小數點"
			},
			IsCharge: {
				required: "不可空白",
				number: "請輸入數字1~9,可使用小數點"
			},
// 			ProductListingBook_Quantity: {
// 				required: "不可空白",
// 				digits: "請輸入數字1~9,不可使用小數點"
// 			},
			ImageFile:{
				required: "未選擇圖片"
			},
		}
	});
});
</script>
 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js" integrity="sha384-a5N7Y/aK3qNeh15eJKGWxsqtnX/wWdSZSKp+81YjTmS15nvnvxKHuzaWwXHDli+4" crossorigin="anonymous"></script>
</html>