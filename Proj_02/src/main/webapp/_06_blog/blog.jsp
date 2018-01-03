<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
    <style>
        body {
			font-family: Microsoft JhengHei;
			background-image:url('${pageContext.request.contextPath}/img/OGA1IU0.jpg');
			background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            background-size: cover;
		}
    </style>
</head>
<body>
<c:set scope="session" value="${member}" var='mem'/>
<c:choose>
	<c:when test="${not empty mem }">
		<jsp:include page="/commons/header_login.jsp"></jsp:include>
	</c:when>
	<c:otherwise>
		<jsp:include page="/commons/header.jsp"></jsp:include>
	</c:otherwise>
</c:choose>
    <section id="section">
        <div class="container p-5">
            <div class="row">
                <div class="col">
                    <div class="card">
                        <div class="card-header" style="background-color: #97CBFF">
                            <h3>活動誌</h3><h5>#熱門文章</h5>
                        </div>
                        <div class="card-body">

                            <div id="body" class="card-columns">
<!--                                 <div class="col"> -->
<!--                                     <div class="card" style="width: 20rem"> -->
<!--                                         <img class="card-img-top" src="" alt="card image cap" /> -->
<!--                                         <div class="card-body"> -->
<!--                                             <h4 class="card-title">title</h4> -->
<!--                                             <p class="card-text" style="display:none"></p> -->
<!--                                             <a class="btn btn-primary more">read more</a> -->

<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->                          

                            </div> 
                            
                        </div><!-- card-body end here-->
                    </div><!-- card end here-->
                </div><!-- col end here-->
            </div><!-- row end here-->
        </div><!-- container end here-->
    </section>
    
        <!-- 這裡是隱藏資訊  -->
    <form id="transfer" action="article.controller" method="get">
    	<input type="hidden" id="articleid" name="articleid">
    </form>
    
    <script src="../js/jquery-1.12.3.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>

<script type="text/javascript">
	
	$(function(){
		$.get("blog.controller",function(list){
			console.log(list)
    	    if(list.length==0){
    	    	$('#body').html("<h3>目前還沒有任何文章^_^</h3>")
    	    }
			var i=0;
			$.each(list,function(index,anarticle){
				
				console.log('articleid:'+anarticle.articleid);
				i=i+1;
				var card=$('<div class="card p-2" style="width: 20rem">').html('<img class="card-img-top" src="${pageContext.request.contextPath}'+anarticle.blogphoto+'" alt="card image cap" />'+
						'<div class="card-body" style="background-color:#F2E6E6"><h4>#'+i+'</h4><h6 class="card-title">'+anarticle.articlename+'</h6>'+
						'<p class="card-text" style="display:none">'+anarticle.articleid+'</p><a class="btn btn-warning float-right more">閱讀更多</a>');
				 							
				$('#body').append(card);
				
		    	$('#body').on('click','.more',function(){
		    		console.log('dbid:'+$(this).prev().text());
		    		var dbid = $(this).prev().text();
		    		$('#articleid').attr("value", $(this).prev().text());
		    		$('#transfer').submit();
		    	})
				
			})
			
		},"json")
	});

</script>

<jsp:include page="/commons/footer.jsp"></jsp:include>
</body>
</html>