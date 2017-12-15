<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>會員頁面</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
		<h1>成功登入</h1>
		<h2>主Key${user_member.memberID }</h2>
		<h2>帳號:${user_member.account }</h2>
		<h2>密碼:${user_member.psd }</h2>
		
		<div><button id="activity">行程</button></div>
		
		<form action="ActivityController.do" id="disable">
			<input type="text" name="doWhat" value="showAct" style="display:none;">
		</form>
		
		<script>
			$('#activity').on('click',function(){
				$('#disable').submit();
			});
		</script>
		
</body>
</html>