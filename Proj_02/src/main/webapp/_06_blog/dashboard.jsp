<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文章列表</title>
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
    <section id="posts">
        <div class="container p-5">
            <div class="row">
                <div class="col">
                    <div class="card">
                        <div class="card-header" style="background-color:	#B8B8DC">
                            <h4>文章列表</h4>
                            <a href="${pageContext.request.contextPath}/_06_blog/post.jsp" class="btn btn-warning">新增文章</a>
                        </div>
                        <table id="table" class="table table-striped">
                            <thead class="thead-inverse">
                                <tr>
                                    <th>#</th>
                                    <th>標題</th>
                                    <th>類型</th>
                                    <th>新增時間</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
<!--                                 <tr> -->
<!--                                     <td>#</td> -->
<%--                                     <td>${param.articlename}</td> --%>
<%--                                     <td>${param.articletype}</td> --%>
<%--                                     <td>${param.posttime}</td> --%>
<!--                                     <td><button id='more' class='btn btn-secondary'>>>更多</button></td> -->
<!--                                 </tr> -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- 這裡是隱藏資訊  -->
    <form id="transfer" action="article.controller" method="get">
    	<input type="hidden" id="articleid" name="articleid">
    </form>

    <script src="../js/jquery-1.12.3.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
            integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
            integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
            crossorigin="anonymous"></script>
    <script>
    $(function(){
    	var memberemail=Cookies.get('user');
    	console.log(memberemail);
    	$.get("show.controller",{"memberemail": memberemail},function(list){
			//這裡是印出show.controller所回傳的所有資料，也就是該會員所有的文章(是一個陣列，裡面有很多bean，每一個bean都是一篇文章)
    		console.log(list);
    	    if(list.length==0){
    	    	$('#table>tbody').html("<tr><td>#</td><td>您還沒有任何文章^_^</td><td></td><td></td><td></td></tr>")
    	    }
			//設定i是文章編號	
    	    var i=0;
    	    
    	    //這個each迴圈是將bean裡的很多篇文章一個一個取出(index是取出來bean的編號，anarticle是該筆資料(一篇文章)的所有內容)
			$.each(list,function(index,anarticle){
// 				//印出一篇文章的該一個值
				console.log('articleid:'+anarticle.articleid);
				//每叫出一篇文章編號就+1	
				i=i+1;
				
				var time=new Date(anarticle.posttime);				
				var year=time.getFullYear()+'/';
				var month=time.getMonth()+1+'/';
				var date=time.getDate()+' ';
				var hour=time.getHours()+':';
				var mins=time.getMinutes();
				var sec=time.getSeconds();
				var fin= year+month+date+hour+mins;
				console.log(fin);				
				
				var articleid= $('<td></td>').text(i);
				var articlename= $('<td></td>').text(anarticle.articlename);
				var articletype= $('<td></td>').text(anarticle.articletype);
				var posttime= $('<td></td>').text(fin);
				var more= $('<td></td>').html("<button class='btn btn-secondary more'>更多</button>");
				var dbid= $('<td style="display:none"></td>').text(anarticle.articleid);
				var del= $('<td></td>').html("<button class='btn btn-danger delete'>刪除</button>");
				
				var row=$('<tr></tr>').append([articleid, articlename, articletype, posttime, more, dbid, del]);

				$('#table>tbody').append(row);
				
			})
    	},"json")
    	
    	$('tbody').on('click','.more',function(){
    		console.log('dbid:'+$(this).parent().next().text());
    		var dbid = $(this).parent().next().text();
    		$('#articleid').attr("value", $(this).parent().next().text());
    		$('#transfer').submit();
    	})
    	
    	$('tbody').on('click','.delete',function(){
    		console.log('dbid:'+$(this).parent().prev().text());
    		$.get("delete.controller",{"articleid":$(this).parent().prev().text()},function(Boolean){
						if(false){
							alert("刪除失敗");
							location.reload();
						}else{
							alert("刪除成功");
							location.reload();
						}
					})
    	})
    	
    });    

    </script>       


    
<jsp:include page="/commons/footer.jsp"></jsp:include>
</body>
</html>