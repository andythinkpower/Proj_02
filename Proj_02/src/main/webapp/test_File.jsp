<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="test.controller" enctype="multipart/form-data" method="post">
        <input type="text" name="something" />
        <select name="choose">
        	<option>insert</option>
        	<option>select</option>
        </select>
        <input type="file" name="input_file_name" />       
        <input type="submit" value="上傳" />
    </form>
</body>
</html>