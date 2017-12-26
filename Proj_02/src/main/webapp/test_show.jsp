<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<h1>測試顯示頁面</h1>


	<script>
		// 		$(function(){
		// 			$.getJSON('${pageContext.request.contextPath}/show.controller'),function(data){
		// 				console.log(data);
		// 			}
		// 			console.log("fin");
		// 		})

		
			$(function(){
				$.getJSON('${pageContext.request.contextPath}/show.controller',function(data){
					$.each(data,function(i,v){
						console.log("value :"+v.actTitle);
						
					})
					
				});
				

// 				$.getJSON('${pageContext.request.contextPath}/show.controller',function(data){
// 				console.log(data);
// 				})

			})
		
	</script>
</body>
</html>