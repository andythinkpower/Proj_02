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

<script>
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

  // This function is called when someone finishes with the Login
  // Button.  See the onlogin handler attached to it in the sample
  // code below.
  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }

  window.fbAsyncInit = function() {
  FB.init({
    appId      : '{1952637041657654}',
    cookie     : true,  // enable cookies to allow the server to access 
                        // the session
    xfbml      : true,  // parse social plugins on this page
    version    : 'v2.11' // use graph api version 2.8
  });

  // Now that we've initialized the JavaScript SDK, we call 
  // FB.getLoginStatus().  This function gets the state of the
  // person visiting this page and can return one of three states to
  // the callback you provide.  They can be:
  //
  // 1. Logged into your app ('connected')
  // 2. Logged into Facebook, but not your app ('not_authorized')
  // 3. Not logged into Facebook and can't tell if they are logged into
  //    your app or not.
  //
  // These three cases are handled in the callback function.

  FB.getLoginStatus(function(response) {
	  
    statusChangeCallback(response);
  });

  };

  // Load the SDK asynchronously
(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = 'https://connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v2.11&appId=1952637041657654';
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

  // Here we run a very simple test of the Graph API after login is
  // successful.  See statusChangeCallback() for when this call is made.
  function testAPI() {
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me', {fields:'email,name,id'}, function(response) {
      console.log('Successful login for: ' + response.name);
      document.getElementById('status').innerHTML =
        'Thanks for logging in, ' + response.name + '! ' + response.email + '!';
      
		$.post("${pageContext.request.contextPath}/_01_member/register.controller",
				{"memberemail": response.email},function(x){
					console.log(x);
					if(x==false){
						  $.get("${pageContext.request.contextPath}/_01_member/fblogin.controller",
									{"memberemail": response.email})						
							$('#status').html("<h5 class='modal-title'>登入成功</h5>");
							console.log("登入成功");
							
						//	

					}else{
						$('#status').html("<h5 class='modal-title'>註冊成功</h5>");
						console.log("註冊成功");
					}
				},"json")
				console.log("turn index")
//       
    });
  }
  
 
	  
	
	    

  

  
  
  
</script>





<script>

	
	  


</script>


<div id="fb-root"></div>

<div class="fb-login-button" onlogin="test()" data-max-rows="1" data-size="large" data-button-type="continue_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="false"></div>



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
<div class="fb-login-button" data-max-rows="1" data-size="medium" data-button-type="login_with" 
data-show-faces="false" data-auto-logout-link="true" data-use-continue-as="false"></div>
<!-- onlogin="refresh()" -->
<!--                                 <input type="button" class="btn" id="fbbutton" value="FB"> -->
								<div id="status">
								</div>
                                </div>

                                <div class="form-group">
                                    <a href="#" data-toggle="modal" data-target="#myModal">忘記密碼？</a>
                                    
<!-- start here -->
<!-- 							<input type="button" class="btn btn-primary" value="註冊" onclick="checkValid()" -->
<!-- 								id="buttonPost" data-toggle="modal" data-target="#myModal" /> <span id="idsp3"></span> -->
							<div class="modal" id="myModal">
								<div class="modal-dialog">
									<div class="modal-content">
										<div id="show" class="modal-header">
											<h5 class='modal-title'>請輸入帳號</h5>											
											<button class="close" data-dismiss="modal">&times;</button>
										</div>
                                        	<div class="modal-body">                                                            
                                            	<div class="form-group">
                                                	<label>帳號：</label>
                                                	<input id="forgotemail" type="text" class="form-control" />
                                                	<span id="forgotemailsent"></span>
                                            	</div>                                                            
                                        	</div>
										<div class="modal-footer">
											<input type="buttion" class="btn btn-secondary" id="forgot" value="發送新密碼">
<!-- 											<button class="btn btn-secondary" id="forgot">發送新密碼</button> -->
										</div>
									</div>
								</div>
							</div>

<!-- end here -->
                                    
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
    
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
<!--     <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
            integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
            integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
            crossorigin="anonymous"></script>
            
    <script>
    
	$('#forgot').click(function(){
		console.log($('#forgotemail').val());
		$.post("${pageContext.request.contextPath}/_01_member/password.controller", 
				{"memberemail": $('#forgotemail').val()},function(x){
					console.log(x);
					if(x==false){
						$('#forgotemailsent').html("<h5 class='modal-title'>新密碼發送失敗</h5><br><p>您輸入的帳號有誤</p>");						
						console.log("error");
					}else{
						$('#forgotemailsent').html("<h3>新密碼已發送至信箱</h3><br><p>請至信箱收信</p>");
						console.log("sucess");
					}
				},"json")			
	});
    
    </script>        

<jsp:include page="../commons/footer.jsp"></jsp:include>
</body>
</html>