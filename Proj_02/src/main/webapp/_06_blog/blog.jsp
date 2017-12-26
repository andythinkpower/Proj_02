<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
    <style>
        body {
			font-family: Microsoft JhengHei;
			background-color:	#F2E6E6;
		}
    </style>
</head>
<body>
<jsp:include page="/commons/header.jsp"></jsp:include>
    <section id="section">
        <div class="container-fluid p-5">
            <div class="row">
                <div class="col">
                    <div class="card">
                        <div class="card-header" style="background-color: #97CBFF">
                            <h4>活動誌</h4>
                        </div>
                        <div class="card-body">

                            <div class="row">
                                <div class="col">
                                    <div class="card" style="width: 20rem">
                                        <img class="card-img-top" src="" alt="card image cap" />
                                        <div class="card-body">
                                            <h4 class="card-title">title</h4>
                                            <p class="card-text"></p>
                                            <a href="" class="btn btn-primary">read more</a>
                                        </div>
                                    </div>
                                </div>
                                
<!--                                 <div class="col"> -->
<!--                                     <div class="card" style="width: 20rem"> -->
<!--                                         <img class="card-img-top" src="../10.jpg" alt="card image cap" /> -->
<!--                                         <div class="card-body"> -->
<!--                                             <h4 class="card-title">title</h4> -->
<!--                                             <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p> -->
<!--                                             <a href="" class="btn btn-primary">more</a> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div class="col"> -->
<!--                                     <div class="card" style="width: 20rem"> -->
<!--                                         <img class="card-img-top" src="../10.jpg" alt="card image cap" /> -->
<!--                                         <div class="card-body"> -->
<!--                                             <h4 class="card-title">title</h4> -->
<!--                                             <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p> -->
<!--                                             <a href="" class="btn btn-primary">more</a> -->
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
    <script src="../js/jquery-1.12.3.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>

<script type="text/javascript">
	
	$(function(){
		$.get("blog.controller",function(list){
			console.log(list)
    	    if(list.length==0){
    	    	$('#table>tbody').html("<tr><td>#</td><td>您還沒有任何文章^_^</td><td></td><td></td><td></td></tr>")
    	    }
			$.each(list,function(index,anarticle){
				
				console.log('articleid:'+anarticle.articleid);
				
				var card=$('<div class="row"></div>').html('<div class="col"><div class="card" style="width: 20rem">'+
						'<img class="card-img-top" src="" alt="card image cap" /><div class="card-body">'+
						'<h4 class="card-title">'+anarticle.articlename+'</h4><p class="card-text"></p></div></div>');
				
				$('#card-body').append(card);
				
			})
			
		},"json")
	});

</script>

<jsp:include page="/commons/footer.jsp"></jsp:include>
</body>
</html>