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
	<script>
		window.fbAsyncInit = function() {
			FB.init({
				appId : '1952637041657654',
				autoLogAppEvents : true,
				xfbml : true,
				version : 'v2.11'
			});

			FB
					.getLoginStatus(function(response) {

						if (response.status === 'connected') {
							document.getElementById("status").innerHTML = "we are connected !";
							document.getElementById('login').style.visibility = 'hidden';
						} else if (response.status === 'not_authorized') {
							document.getElementById("status").innerHTML = "we fail";
						} else {
							document.getElementById("status").innerHTML = "you are not login facebook";
						}
					})
		};

		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id)) {
				return;
			}
			js = d.createElement(s);
			js.id = id;
			js.src = "https://connect.facebook.net/en_US/sdk.js";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));

		function login() {
			FB.login(function(response) {
				console.log(response)
						if (response.status === 'connected') {
							document.getElementById("status").innerHTML = "we are connected !";
							document.getElementById('login').style.visibility = 'hidden';
						} else if (response.status === 'not_authorized') {
							document.getElementById("status").innerHTML = "we fail";
						} else {
							document.getElementById("status").innerHTML = "you are not login facebook";
						}
					}, {scope:'public_profile,email'});
		}
		
		
		function getInfo() {
			FB.api('/me', 'GET', {fields: 'name,email'}, function(response) {
				console.log(response)
				document.getElementById('status').innerHTML = "email "+response.email+"name "+response.name;
			});
		}
		
	</script>


	<div id="status"></div>
	<button onclick="getInfo()">Get Info</button>
	<button onclick="login()" id='login'>Login</button>

	<h1>測試顯示頁面</h1>


	<script>
		// 		$(function(){
		// 			$.getJSON('${pageContext.request.contextPath}/show.controller'),function(data){
		// 				console.log(data);
		// 			}
		// 			console.log("fin");
		// 		})

		$(function() {
			$.getJSON('${pageContext.request.contextPath}/show.controller',
					function(data) {
						$.each(data, function(i, v) {
							console.log("value :" + v.actTitle);

						})

					});

			// 				$.getJSON('${pageContext.request.contextPath}/show.controller',function(data){
			// 				console.log(data);
			// 				})

		})
	</script>
</body>
</html>