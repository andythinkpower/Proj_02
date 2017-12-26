<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous">
</head>
<style>
body {
	font-family: Microsoft JhengHei;
	background-color:	#F2E6E6;
}
</style>
<body>
	<jsp:include page="../commons/header.jsp"></jsp:include>

	<section>
	<div class="container p-5">
		<div class="row">
			<div class="col">
				<div class="card">
					<div class="card-header" style="background-color:	#B3D9D9">
						<h4>註冊</h4>
					</div>
					<div class="card-body">
						<form action="<c:url value='/register.controller' />"
							method="post">
							<div class="form-group">
								<label for="username">帳號：</label> <input type="text" id="email"
									placeholder="請輸入E-mail" class="" name="memberemail"
									value="${param.memberemail}"> <span>${errors.erremail}</span>
							</div>
							<div class="form-group">
								<label for="password">密碼：</label> <input type="password"
									id="password" placeholder="請輸入密碼" class=""
									name="memberpassword" value="${param.memberpassword}">
								<span>${errors.errpsw}</span>
							</div>
<!-- 							<div class="form-group"> -->
<!-- 								<a href="">用Facebook登入</a> <a href="">用Google登入</a> -->
<!-- 							</div> -->
<!-- 							<input class="btn btn-primary" type="submit" value="送出" /> -->

							<!-- start here -->
							<input type="button" class="btn btn-primary" value="註冊"
								id="buttonPost" data-toggle="modal" data-target="#myModal" />
							<div class="modal" id="myModal">
								<div class="modal-dialog">
									<div class="modal-content">
										<div id="show" class="modal-header">											
											<button class="close" data-dismiss="modal">&times;</button>
										</div>
										<div class="modal-body">Welcome</div>
										<div class="modal-footer">
<!-- 											<button class="btn btn-secondary" data-dismiss="modal">關閉視窗</button> -->
											<button class="btn btn-warning"><a href="${pageContext.request.contextPath}/index.jsp">回到首頁</a></button>
										</div>
									</div>
								</div>
							</div>

							<!-- end here -->

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
	
	<script>
// 	$('#buttonPost').click(function() {
// 		//練習二使用post()
// 		//1. 呼叫FirstServlet
// 		//2. 傳 name=Mary及age=的25資料給Parameter.jsp
// 		//3. 將Server端回傳的結果加上h2的標籤,顯示在show的div中

// 		$.post("FirstServlet",{'name':'Jack','age':25},function(data){
// 			$("#show").html("<h2>"+data+"</h2>");
// 		})
// 	});

		$('#buttonPost').click(function(){
			$.post("${pageContext.request.contextPath}/_01_member/register.controller",
					{"memberemail": $('#email').val(), "memberpassword": $('#password').val()},function(bean){
						if(bean==null){
							$('#show').html("<h5 class='modal-title'>註冊失敗</h5>");
							console.log("註冊失敗");
						}else{
							$('#show').html("<h5 class='modal-title'>註冊成功</h5>");
							console.log("註冊成功");
						}
					})			
		});

	</script>

	<jsp:include page="../commons/footer.jsp"></jsp:include>
</body>
</html>