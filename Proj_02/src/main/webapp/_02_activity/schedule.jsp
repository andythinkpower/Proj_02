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
<jsp:include page="../commons/header.jsp"/>
	<h1>建立行程-1</h1>
	<!-- 利用JavaScript 先做一些簡易判斷 符合才可送出(未完成)-->
	<form id="activity" action="ActivityController.do" method="post" enctype="Multipart/Form-Data">
	
	<input type="text" name="doWhat" value="schedule" style="display:none;">
		起始時間:<input type="text" name="actStartDate" id="date"> <br><!-- 使用jQuery ui Datepicker  -->
		地區:<input type="text" name="actRegion"> <br> 
		活動標題:<input type="text" name="actTitle">
		<hr>
		上傳圖片:
		<input type="file" id="file"  name="file"><br>
		<img class="preview" style="max-width: 150px; max-height: 150px;">
		<hr>
		簡介:
		<textarea rows="20px" cols="40px" name="introduction"></textarea>
		<br> <input id='sub' type="button" value="下一步">
	</form>
	
	
	<script>
	$(function (){
		//基本防呆  日期跟標題要輸入表單才能送出
		$("#sub").on('click',function(){
			var title=$("input[name=actTitle]").val();
			var actStartDate=$("input[name=actStartDate]").val();
			if(title.trim().length==0){
				alert("請輸入活動標題");
			}else if(actStartDate.trim().length==0){
				alert("請輸入活動日期");
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
	
<jsp:include page="../commons/footer.jsp"/>
</body>
</html>