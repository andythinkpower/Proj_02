<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous">
</head>
<body>
<jsp:include page="../commons/header.jsp"></jsp:include>
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = 'https://connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v2.11&appId=1964367790442563';
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<script>

FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
});


{
    status: 'connected',
    authResponse: {
        accessToken: '...',
        expiresIn:'...',
        signedRequest:'...',
        userID:'...'
    }
}


function checkLoginState() {
  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });
}


  window.fbAsyncInit = function() {
    FB.init({
      appId      : '{1964367790442563}',
      cookie     : true,
      xfbml      : true,
      version    : '{v2.11}'
    });
      
    FB.AppEvents.logPageView();   
      
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "https://connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
</script>

<form action="<c:url value='/login.controller' />" method="post">
      <h3>Login</h3>
       <div class="form-group">
         <label for="username">帳號：</label>
         <input type="text" id="email" placeholder="請輸入E-mail"
         class="" name="memberemail" value="${param.memberemail}">
         <span>${errors.erremail}</span>
       </div>
       <div class="form-group">
         <label for="password">密碼：</label>
         <input type="password" id="password" placeholder="請輸入密碼"
         class="" name="memberpassword" value="${param.memberpassword}">
         <span>${errors.errpsw}</span>
       </div>
       <div class="form-group">
<div class="fb-login-button" data-max-rows="1" data-size="medium" data-button-type="login_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="false"></div>
         <a href="">Google</a>
       </div>
       <div class="form-group">
         <a href="">忘記密碼？</a>
         <a href="">建立新會員</a>
       </div>
       <input class="btn btn-primary" type="submit" value="登入" />
     </form>
<jsp:include page="../commons/footer.jsp"></jsp:include>
</body>
</html>