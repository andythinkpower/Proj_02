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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8/BIG5">
<title>活動修改</title>
<link rel="shortcut icon" href="../img/favicon.ico.png"  type="image/x-icon"/>

</head>

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

/*=======================有修改的部分(背景圖片)==========================*/

.intro {
  display: table;
  width: 100%;
  height: auto;
  padding: 100px 0;
  text-align: center;
  color: white;
  background: url(../img/eeee.jpg) no-repeat bottom center scroll;
  background-color: black;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  background-size: cover;
  -o-background-size: cover;
}


/*==========================================================*/
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

<body>
<%-- 	<jsp:include page="/fragment/top.jsp" /> --%>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
<header class="intro">    
 		<div class="intro-body"  >         
 				<table border='1' cellpadding='3' cellspacing='0' width='250'>
		<tr align='center' valign='middle' height='10'>
			<td><h3>活動修改</h3></td>
			<td></td>
	</table>
	
	<FORM METHOD="post" ACTION="book.do" name="form1" enctype="multipart/form-data" id="signupForm">
		<fieldset>
<!-- 			<legend>Validating a complete form</legend> -->
			<p>
				<label for="EventID">活動編號<font color=red><b>*</b></font>&nbsp&nbsp&nbsp&nbsp<%=eventVO.getEventID()%> </label>
				
			</p>
			<p>
				<label for="EventName">活動名稱<font color=red><b>*</b></font></label>
				<input id=EventName name="EventName" type="text" 
				value="<%=eventVO.getEventName()%>" >
			</p>
			<p>
				<label for="Fee">票價<font color=red><b>*</b></font></label>
				<input id="Fee" name="Fee" type="text"
				value="<%=eventVO.getFee()%>" >
			</p>
			<p>
				<label for="IsCharge">是否免費<font color=red><b>*</b></font></label>
				<input id="IsCharge" name="IsCharge" type="text"
				value="<%=eventVO.getIsCharge()%>" >
			</p>
			<p>
				<label for="DurationStart">活動開始時間<font color=red><b>*</b></font></label>
				<input id="DurationStart" name="DurationStart" type="text"
				value="<%=eventVO.getDurationStart()%>">
			</p>
			<p>
				<label for="DurationEnd">活動結束時間&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>
				<input id="DurationEnd" name="DurationEnd" type="date"
				value="<%=eventVO.getDurationEnd()%>">
			</p>
			<p>
				<label for="ShowGroupName">演出單位&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>
				<input id="ShowGroupName" name="ShowGroupName" type="text"
				value="<%=eventVO.getShowGroupName()%>">
			</p>
			<p>
				<label for="ContactName">活動連絡人&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</label>
				<input id="ContactName" name="ContactName" type="text"
				value="<%=eventVO.getContactName()%>" >
			</p>
			<p>
				<label for="BriefIntroduction">簡介</label>
				<textarea id="BriefIntroduction" name="BriefIntroduction" cols="40" rows="5" style="resize:none;"><%=eventVO.getBriefIntroduction()%></textarea>
			</p>
			<p>
			<img height="60" width="50" name="Old_Picture" src="${eventVO.imageFile}" />
			<label for="ImageFile">選擇上傳圖片</label>
			<input type="file" id="ImageFile" name=ImageFile class="required" accept="image/*">
			</p>
			<p>
				<input type="hidden" name="action" value="update"> 
			 <input type="hidden" name="EventID" value="<%=eventVO.getEventID()%>">
			 <input type="submit" value="送出修改" id="submit">	
			</p>
		</fieldset>
		<br> 
	</FORM>
        </div>
    </header>
	<%-- 	<%@ include file="page2.file" %>				 --%>
</body>
<script src="../js/jquery.js"></script>
<script src="../js/jquery.validate.js"></script>
<script>
// $.validator.setDefaults({
// 	submitHandler: function() {
// 		alert("submitted!");
// 		$('signupForm').submit();
// 		$( "#signupForm" ).submit(function( event ) {
// 			  alert( "Handler for .submit() called." );
// 			  event.preventDefault();
// 			});
// 		$( "#signupForm" ).click(function() {
// 			  $( "#signupForm" ).submit();
// 			});
// 	}
// });
$( "#submit" ).click(function() {
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
			EventCharge:{
				required: true,
				number: true
			},
// 			ProductListingBook_Quantity: {
// 				required: true,
// 				digits: true
// 			},
			ImageFile:{
				required: false
			},
			
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
</html>