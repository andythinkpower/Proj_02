<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>

<title>顯示單獨頁面</title>
<style>
 body{
		background-color:		#F2E6E6;
	}

#section {
	margin: 5%;
	width: 30%;
}

html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

#map {
	height: 50%;
	float: right;
	width: 50%;
	height: 50%;
}

#directions-panel {
	margin-top: 10px;
	background-color: #FFEE77;
	padding: 10px;
}
</style>
</head>
<body>
<jsp:include page="../commons/header.jsp"/>
	<div id="map"></div>

<!-- 這邊要全部改成表格  -->
<form action="ActivityController.do" method="post">
	<input type="text" style="display:none" name="doWhat" value="update">
	<div id="section">
		<div style="border: 2px solid red;">
			<p>這邊要顯示單一行程 總覽</p>
			
			<input type="hidden"  name="email" value="${soloBean.email }">
			<input type="hidden"  name="activityID" value="${soloBean.activityID }">
		標題:<input type="text" name="actTitle" value="${soloBean.actTitle }"><br>
		起始時間:<input type="text" name="actStartDate" value="${soloBean.actStartDate }"><br>
		地區:<input type="text" name="actRegion" value="${soloBean.actRegion }"><br>
		<div>
			照片:<img src="${pageContext.request.contextPath}${soloBean.photoPath}" style="width:300px"/>
		</div>
		簡介:<input type="text" name="introduction" value="${soloBean.introduction }"><br>			
		</div>

		<p>這邊要顯示單一行程 所有細節</p>
		<div style="border: 2px solid blue;">
			<div>測試文字</div>
			<c:forEach var="detail" items="${soloDetail}">
			<div>第${detail.dates }天</div>
			<input type="text" style="display:none" name="actDetail" value="${detail.actDetail }">
			<input type="text" style="display:none" name="dates" value="${detail.dates }">
		停留時間:<input type="text" name="times" value="${detail.times }"><br>
		活動類型:<input type="text" name="kinds" value="${detail.kinds }"><br>
		活動名稱:<input type="text" name="note" value="${detail.note }"><br>
		預算:<input type="text" name="budget" value="${detail.budget }"><br>			
				<hr>
			</c:forEach>
		</div>
	</div>
	<input type="submit" value="儲存">
</form>

	
		
<jsp:include page="../commons/footer.jsp"/>
</body>
</html>