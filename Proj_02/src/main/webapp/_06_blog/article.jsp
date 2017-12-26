<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文章</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
    <script src="../js/cookie.js"></script>

    <style>
		body {
			font-family: Microsoft JhengHei;
/* 			background-color:	#F2E6E6; */
			background-image:url('${pageContext.request.contextPath}/img/OGA1IU0.jpg');
			background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            background-size: cover;
		}
    </style>
</head>
<body>
<jsp:include page="/commons/header.jsp"></jsp:include>
    <section>
        <div class="container p-5">
            <div class="row">
                <div class="col">
                    <div class="card">
                        <div id="articlename" class="card-header" style="background-color:	#B8B8DC">
                            <h4>${article.articlename}</h4>
                            <p id="nums" class="float-right">瀏覽數：${article.viewnum} / 按讚數：${article.likenum}</p>
                        </div>
                        <div class="card-body">
                            <form>
                                <div class="form-group float-right" style="border:solid 1px groove">
                                    <img style="width:200px;height:200px"/><!--上傳後的照片顯示在這裡-->
                                </div>
                                <div class="form-group">
                                    <label for="title">新增時間：</label>
                                    <input id="posttime" type="text" readonly class="form-control-plaintext" value="${article.posttime}"/>
                                </div>
                                <div class="form-group">
                                    <label for="title">類型：</label>
                                    <input id="articletype" type="text" readonly class="form-control-plaintext" value="${article.articletype}" />
                                </div>
                                <div class="form-group">
                                    <label for="file">封面照片：</label>
                                    <input type="file">
                                </div>
                                <div class="form-group">
                                    <label for="body">內容：</label><br />
                                    <input id="articlecontent" class="form-control-plaintext" style="width:100%" readonly name="content">${article.articlecontent}</textarea>
                                </div>
                                <div>
                                    <label for="body">隱私：</label>
                                    <input readonly class="form-control-plaintext" type="text" id="pravicy" value="${article.pravicy}"/> 
                                    <!--<input type="radio" name="setting" id="setting" /><label for="setting">公開</label>
                                    <input type="radio" name="setting" id="setting" /><label for="setting">私人</label>-->
                                </div>
                                <div>
                                    <a href="${pageContext.request.contextPath}/_06_blog/dashboard.jsp" class="btn btn-warning">回文章類表</a>
                                    <!--<input type="submit" class="btn btn-primary" value="回文章類表" />-->
                                </div>
                            </form><!-- form end here-->
                        </div><!-- card-body end here-->
                    </div><!-- card end here-->
                </div><!-- col end here-->
            </div><!-- row end here-->
        </div><!-- container end here-->
    </section>
    
    <script src="../js/jquery-1.12.3.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
            integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
            integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
            crossorigin="anonymous"></script>    
    
<!--     <script>
    $(function(){
    	var memberemail=Cookies.get('user');
    	console.log(memberemail);
    	$.get("article.controller",{"memberemail": memberemail, "articleid":articleid},function(bean){
    		console.log(bean);
    		
    		$('#articlename').attr("value",bean.articlename) //標題
    		
    		//待處理
    		var nums= $('<p></p>').html('瀏覽數：${viewnum} / 按讚數：${likenum}')
    		$('#nums').attr("value",nums)
    		
    		$('#posttime').attr("value",bean.posttime) //時間    		
    		$('#articletype').attr("value",bean.articletype) //類型
    		$('#articlecontent').attr("value",bean.articlecontent) //內容
    		$('#pravicy').attr("value",bean.pravicy) //隱私
    	},"jason")    	
    });	
    </script> -->
    
<jsp:include page="/commons/footer.jsp"></jsp:include>    
</body>
</html>