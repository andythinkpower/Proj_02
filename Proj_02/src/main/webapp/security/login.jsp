<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登入</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>

    <style>
        body {
			font-family: Microsoft JhengHei;
			background-image:url('${pageContext.request.contextPath}/img/997.jpg');
			background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            background-size: cover;
		}
    </style>
</head>
<body>
<jsp:include page="../commons/header.jsp"></jsp:include>
<!-- <div id="fb-root"></div> -->
<script>

var fbemail;
var checkfb;


$(function(){
	
	$('#fbbutton').on('click',function(){
		press();
	})

window.fbAsyncInit = function() {
  FB.init({
    appId      : '1964367790442563',
    xfbml      : true,
    version    : 'v2.11'
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


// This is called with the results from from FB.getLoginStatus().
function statusChangeCallback(response) {
  console.log('statusChangeCallback');
  console.log(response);
  // The response object is returned with a status field that lets the
  // app know the current login status of the person.
  // Full docs on the response object can be found in the documentation
  // for FB.getLoginStatus().
  if (response.status === 'connected') {
    // Logged into your app and Facebook.
    testAPI();
  } else {
    // The person is not logged into your app or we are unable to tell.
    document.getElementById('status').innerHTML = 'Please log ' +
      'into this app.';
  }
}



// Here we run a very simple test of the Graph API after login is
// successful.  See statusChangeCallback() for when this call is made.
function testAPI() {
  console.log('Welcome!  Fetching your information.... ');
  FB.api('/me', {fields:'email,name,id'}, function(response) {
	  console.log(2);
	console.log(response);
	fbemail=response.email;
	checkfb="yes";
    console.log('Successful login for: ' + response.name);
    document.getElementById('status').innerHTML =
      'Thanks for logging in, ' + response.name + ' ! ' + response.email + '!';
  });
}

function press(){
	FB.login(function(response) {
		  console.log('statusChangeCallback');
		  console.log(1);
		  console.log(response);
		  // The response object is returned with a status field that lets the
		  // app know the current login status of the person.
		  // Full docs on the response object can be found in the documentation
		  // for FB.getLoginStatus().
		  if (response.status === 'connected') {
		    // Logged into your app and Facebook.
			  testAPI();
		    
		  } else {
		    // The person is not logged into this app or we are unable to tell. 
			  document.getElementById('status').innerHTML = 'Please log ' +
			    'into this app.';
		  }
		}, {scope: 'public_profile, email'});
}

})

</script>

<fb:login-button 
  scope="public_profile,email"
  onlogin="checkLoginState();"
  onclick="press()">  
</fb:login-button>

<div id="status">
333
</div>

<section>
        <div class="container p-5">
            <div class="row">
                <div class="col">
                    <div class="card">
                        <div class="card-header" style="background-color:	#97CBFF">
                            <h4>登入</h4>
                        </div>
                        <div class="card-body">
                            <form action="<c:url value='/login.controller' />" method="post">
                                <div class="form-group">
                                    <label for="username">帳號：</label>
                                    <input type="text" id="email" placeholder="請輸入E-mail" name="memberemail"
                                    	value="${errors.account}">
                                    <span>${errors.erremail}</span>
                                </div>
                                <div class="form-group">
                                    <label for="password">密碼：</label>
                                    <input type="password" id="password" placeholder="請輸入密碼" name="memberpassword">
                                    <span>${errors.errpsw}</span>
                                </div>
                                <div class="checkbox">
                                	<input name="rememberme" type="checkbox" 
                                	<c:if test='${sessionScope.rememberme==true}'>checked='checked'</c:if> value="true"> 記住密碼
                                </div>
                                <br>
                                <div class="form-group">
                                <input type="button" class="btn" id="fbbutton" value="FB">
<!-- 按鈕上的 onlogin 屬性是用於設定檢查登入狀態的 JavaScript 回呼，以瞭解用戶是否已經成功登入： -->
<!-- <fb:login-button  -->
<!--   scope="public_profile,email" -->
<!--   onlogin="checkLoginState();"> -->
<!-- </fb:login-button> -->
<!-- <div class="fb-login-button" data-max-rows="1" data-size="medium" data-button-type="login_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="false"></div> -->
                                </div>
<div id="status">
</div>
                                <div class="form-group">
                                    <a href="">忘記密碼？</a>
                                    <a href="${pageContext.request.contextPath}/_01_member/register.jsp">建立新會員</a>
                                </div>
                                <input class="btn btn-primary" type="submit" value="登入" />
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    


<jsp:include page="../commons/footer.jsp"></jsp:include>
</body>
</html>