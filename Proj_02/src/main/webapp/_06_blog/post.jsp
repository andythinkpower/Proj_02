<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增文章</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="../js/cookie.js"></script>
<script src="../js/ckeditor/ckeditor.js"></script>    
    <style>
        body{
            font-family:Microsoft JhengHei;
/*             background-color:	#F2E6E6; */
			background-image:url('${pageContext.request.contextPath}/img/OGA1IU0.jpg');
			background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            background-size: cover;
        }
        .img{
			width:500px;
			height:200px;
			overflow:hidden;
		}
    </style>
    
  <script>
   function processData(){
   // getting data
   var data = CKEDITOR.instances.articlecontent.getData()
   console.log(data)
   }
 </script>
</head>
<body>
<jsp:include page="/commons/header.jsp"></jsp:include>
    <section>
        <div class="container p-5">
            <div class="row">
                <div class="col">
                    <div class="card">
                        <div class="card-header" style="background-color:	#B8B8DC">
                            <h4>新增文章</h4>
                        </div>
                        <div class="card-body">
                            <form name="form" enctype="Multipart/Form-Data" action="<c:url value='/post.controller' />" method="post">
                                <div class="form-group">
                                    <label for="title">文章標題</label>
                                    <input type="text" class="form-control" name="articlename" id="articlename" value="" />
                                </div>
                                <div class="form-group">
                                    <label for="title">文章類型</label>
                                    <select class="form-control" name="articletype" id="articletype">
                                        <option value="表演萬象">表演萬象</option>
                                        <option value="展覽廣場">展覽廣場</option>
                                        <option value="音樂現場">音樂現場</option>
                                        <option value="講座研習">講座研習</option>
                                        <option value="電影瞭望">電影瞭望</option>
                                        <option value="城市萬花筒">城市萬花筒</option>
                                        <option value="親子活動">親子活動</option>
                                        <option value="戶外行腳">戶外行腳</option>
                                    </select>
                                </div>
                                <div class="form-group img">
                                    <label for="uploadImage">封面照片<br>
                                    	<img name="blogphoto" width="250" id="img" src="${pageContext.request.contextPath}/img/default.jpg" />
                                    	<input type="file" style="display:none" accept="image/*" id="uploadImage" name="uploadImage"/>
                                    </label>
                                    <script>
                                            $("#uploadImage").change(function () {
                                                readImage(this);
                                            });
                                            function readImage(input) {
                                                if (input.files && input.files[0]) {
                                                    var FR = new FileReader();
                                                    FR.onload = function (e) {
                                                        //e.target.result = base64 format picture
                                                        $('#img').attr("src", e.target.result);
                                                    };
                                                    FR.readAsDataURL(input.files[0]);
                                                }
                                            }
                                        </script>
                                    <small class="form-text text-muted">Max Size QQ</small>
                                </div>
                                <div class="form-group">
                                    <label for="body">文章內容</label>
                                    <textarea class="form-control" name="articlecontent" id="articlecontent" ></textarea>
<script>
CKEDITOR.replace( 'articlecontent', {});
</script>
                                </div>
                                <div>
                                    <input type="radio" name="pravicy" id="setting1" value="公開"/><label for="setting1">公開</label>
                                    <input type="radio" name="pravicy" id="setting2" value="私人"/><label for="setting2">私人</label>
<!--                 	<select id="pravicy" name="pravicy" > 
                    		<option id="pravicyon" value="on">公開</option>
                        	<option id="pravicyoff" value="off">私人</option>
                    	</select> -->
                                </div>
                                <div>
                                    <input type="submit" class="btn btn-primary" value="送出"/>
                                    <span>${message.post}</span>
                                    
<!-- start here -->
<!-- 							<input type="button" class="btn btn-sm btn-secondary" value="送出" onclick = 'processData()' -->
<!-- 								id="buttonPost" data-toggle="modal" data-target="#myModal" /> -->
<!-- 							<div class="modal" id="myModal"> -->
<!-- 								<div class="modal-dialog"> -->
<!-- 									<div class="modal-content"> -->
<!-- 										<div id="header" class="modal-header"> -->
<!--											<h5 class='modal-title'>新增成功</h5>										 -->
<!-- 											<button class="close" data-dismiss="modal">&times;</button> -->
<!-- 										</div> -->
<!-- 										<div id="body" class="modal-body"></div> -->
<!-- 										<div class="modal-footer"> -->
<!-- 											<button class="btn btn-secondary" data-dismiss="modal">關閉視窗</button> -->
<%-- 											<button class="btn btn-warning"><a href="${pageContext.request.contextPath}/_06_blog/dashboard.jsp">回到部落格首頁</a></button> --%>
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->

<!-- end here -->
<!-- 這裡是隱藏接收memberemail回傳值的地方 -->
<input id="memberemail" type="text" style="display:none" name="memberemail">
                                    
                                </div>
                            </form><!-- form end here-->
                        </div><!-- card-body end here-->
                    </div><!-- card end here-->
                </div><!-- col end here-->
            </div><!-- row end here-->
        </div><!-- container end here-->
    </section>
    
    <script src="../js/jquery-1.12.3.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
    

    
    <script>
    
    	$(function(){
        	var memberemail=Cookies.get('user');
        	console.log(memberemail);
        	$('#memberemail').attr("value",memberemail);
    	

// 			$('#buttonPost').click(function(){
// 				var data = CKEDITOR.instances.content.getData()
// 				$.post("post.controller",
// 						{"memberemail": memberemail, 
// 						 "articlename": $('#articlename').val(), 
// 						 "articletype": $('#articletype').val(),
// 						 "uploadImage":$('#uploadImage').val(),
// 						 "editor": data, 
// 						 "pravicy": $("input[name=pravicy]:checked").val()},function(x){
// 						console.log($("input[name=pravicy]:checked").val())
// 						if(x==false){
// 							$('#header').html("<h5 class='modal-title'>新增失敗</h5>");
// 							$('#body').html("QQ");
// 							console.log("新增失敗");
// 						}else{
// 							$('#header').html("<h5 class='modal-title'>新增成功</h5>");
// 							$('#body').html("太棒了");
// 							console.log("新增成功");
// 						}
// 					})			
// 			});
		
    	});

	</script>
<jsp:include page="/commons/footer.jsp"></jsp:include>
</body>
</html>