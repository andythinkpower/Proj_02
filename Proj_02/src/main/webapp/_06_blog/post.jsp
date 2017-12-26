<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增文章</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
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
    </style>
    
  <script>
   function processData(){
   // getting data
   var data = CKEDITOR.instances.content.getData()
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
                            <form name="form" action="<c:url value='/blog.controller' />" method="post">
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
                                <div class="form-group">
                                    <label for="file">封面照片</label>
                                    <img /><!--上傳後的照片顯示在這裡-->
                                    <input type="file" class="form-control-file" />
                                    <small class="form-text text-muted">Max Size QQ</small>
                                </div>
                                <div class="form-group">
                                    <label for="body">文章內容</label>
                                    <textarea class="form-control" name="content" id="content" ></textarea>
<script>
CKEDITOR.replace( 'content', {});
</script>
                                </div>
                                <div>
                                    <input type="radio" name="pravicy" id="setting1" value="on"/><label for="setting1">公開</label>
                                    <input type="radio" name="pravicy" id="setting2" value="off"/><label for="setting2">私人</label>
<!--                 	<select id="pravicy" name="pravicy" > 
                    		<option id="pravicyon" value="on">公開</option>
                        	<option id="pravicyoff" value="off">私人</option>
                    	</select> -->
                                </div>
                                <div>
<!--                                     <input type="submit" class="btn btn-primary" value="送出"/> -->
<%--                                     <span>${message.scuess}</span> --%>
                                    
<!-- start here -->
							<input type="button" class="btn btn-sm btn-secondary" value="送出" onclick = 'processData()'
								id="buttonPost" data-toggle="modal" data-target="#myModal" />
							<div class="modal" id="myModal">
								<div class="modal-dialog">
									<div class="modal-content">
										<div id="header" class="modal-header">
<!-- 											<h5 class='modal-title'>新增成功</h5>										 -->
											<button class="close" data-dismiss="modal">&times;</button>
										</div>
										<div id="body" class="modal-body"></div>
										<div class="modal-footer">
<!-- 											<button class="btn btn-secondary" data-dismiss="modal">關閉視窗</button> -->
											<button class="btn btn-warning"><a href="${pageContext.request.contextPath}/_06_blog/dashboard.jsp">回到部落格首頁</a></button>
										</div>
									</div>
								</div>
							</div>

<!-- end here -->
                                    
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
    	

			$('#buttonPost').click(function(){
				var data = CKEDITOR.instances.content.getData()
				$.post("post.controller",
						{"memberemail": memberemail, 
						 "articlename": $('#articlename').val(), 
						 "articletype": $('#articletype').val(),
						 "editor": data, 
						 "pravicy": $("input[name=pravicy]:checked").val()},function(bean){
						console.log($("input[name=pravicy]:checked").val())
						if(bean==null){
							$('#header').html("<h5 class='modal-title'>新增失敗</h5>");
							$('#body').html("QQ");
							console.log("新增失敗");
						}else{
							$('#header').html("<h5 class='modal-title'>新增成功</h5>");
							$('#body').html("太棒了");
							console.log("新增成功");
						}
					})			
			});
		
    	});

	</script>
<jsp:include page="/commons/footer.jsp"></jsp:include>
</body>
</html>