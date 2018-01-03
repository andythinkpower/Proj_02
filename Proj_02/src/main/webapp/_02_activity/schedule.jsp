<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<style>
 body {
			font-family: Microsoft JhengHei;
/* 			background-color:	#F2E6E6; */
			background-image:url('${pageContext.request.contextPath}/img/05.jpg');
			background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            background-size: cover;
		}
 form{
 		background-color:white;
 }
 .img{
 overflow:hidden;
 	
 }
</style>
<script>
$(function () {
    //預設星期格式為yy-mm-dd
    $.datepicker.setDefaults({ dateFormat: "yy-mm-dd" });
    //設定日期範圍
    $("#date").datepicker({ minDate: 0, maxDate: "+5M +10D" });         
});	
</script>
<title>create_activity</title>
</head>
<body>
<jsp:include page="../commons/header_login.jsp"/>
    <div class="row">sss
        <div class="col"></div>
        <div class="col-5">
            <div class="container">
                <h1 class="text-center">建立行程-1</h1>
                <form id="activity" action="ActivityController.do" method="post" enctype="multipart/form-data" style="border:1px solid gray;border-radius:10px">
                    <div class="form-row pt-4">
                        <div class="col text-center pt-4">
                            <input type="hidden" name="doWhat" value="schedule">
                            <div class="form-group  pt-2">
                                <label for="Title">行程名稱:</label>
                                <input type="text" id="Title" name="actTitle" />
                            </div>
                            <div class="form-group pt-4">
                                <label for="Region">活動地區:</label>
                                <input type="text" id="Region" name="actRegion" />
                            </div>
                            <div class="form-group pt-4">
                                <label for="date">出發日期:</label>
                                <input type="text" name="actStartDate"  id="date" readonly> <br>
                            </div>			
                        </div>
                        <div class="col pr-5 img" >
                        <label for='file'>
                            <input type="file" id="file" name="file" accept="image/*" class="form-control-file" style='display:none'>
                                <img class="figure-img img-fluid rounded preview" src='../uploadFile/nopic.jpg' width='300' style='height:250px' >                       
                            </label>
                        </div>
                    </div>
                    <div class="form-group px-5">
                        <label for="exampleFormControlTextarea1">簡介:</label>

                        <textarea class="form-control" id="exampleFormControlTextarea1" name='introduction' rows="5"></textarea>

                    </div>
                    <div class="text-center pb-3">
                        <input id='sub' type="button" class="btn btn-primary px-5" value="下一步" />
                    </div>
                </form>
            </div>

        </div>
        <div class="col"></div>
    </div>
	
	
	<script>
	$(function (){
		//基本防呆  日期跟標題要輸入表單才能送出
		$("#sub").on('click',function(){
			var title=$("input[name=actTitle]").val();
			var actStartDate=$("input[name=actStartDate]").val();
			if(title.trim().length==0){
				alert("請輸入行程名稱");
			}else if(actStartDate.trim().length==0){
				alert("請輸入出發日期");
			}else{
				$("#activity").submit();
			}			
		})
		
		
		//當id=file 的欄位做"change"這個動作會觸發 preview(參數)這個方法
		 $("body").on("change", "#file", function (){
		        preview(this);
		    })
	    function preview(input) {	 
	        if (input.files && input.files[0]) {
	            var reader = new FileReader();            
	            reader.onload = function (e) {
	            	//會在class="preview" e.target.result為圖片暫存路徑  
	                $('.preview').attr('src', e.target.result);
	            }	 
	            reader.readAsDataURL(input.files[0]);
	        }
	    }
	})
	</script>
	  <br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="../commons/footer.jsp"/>
</body>
</html>