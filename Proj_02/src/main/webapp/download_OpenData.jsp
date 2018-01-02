<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>一鍵安裝</h1>
	<form action="download.do">
	選擇要做甚麼:<select name="kind">
	<option value='haha'>甚麼都不做</option>
	<option value='data'>下載JSON到資料庫</option>
	<option value='find'>定位座標</option>
			</select><br>
	URL(檔案路徑ex:C:\\Users\\fly2\\Downloads\\apiAccess2.json):<input type="text" name='url'><br>
	<input type="submit" value="下載資料"><br>
	</form>
	
</body>
</html>