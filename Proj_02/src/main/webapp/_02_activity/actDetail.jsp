<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>細節更新</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
    
    <script src="../js/_02_actDetail.js" type="text/javascript"></script>
    

    <style>
        .large {
            border: 1px solid yellow;
        }

        .middle {
            margin: 10px;
            padding: 10px;
            border: 2px solid red;
        }

        .small {
            margin: 10px;
            padding: 10px;
            border: 1px solid blue;
        }
    </style>
   

</head>
<body>
<jsp:include page="../commons/header.jsp"/>
    <form action="ActivityController.do" id="form" method="post">
    <fieldset><legend>行程總覽</legend>
    	<input type="text" name="doWhat" value="detail" style="display:none;">
    	<input type="text" name="actStartDate" value="${activityBean.actStartDate}"><br>
    	<input type="text" name="actRegion" value="${activityBean.actRegion}"><br>
    	<input type="text" name="actTitle" value="${activityBean.actTitle}"><br>
    	<input type="text" name="introduction" value="${activityBean.introduction}"><br>
    </fieldset>
    </form>

    <button id="create_Day">新增天數</button> <button id="submit">儲存</button>
    
    
    
  
<div class="container">
    <div class="modal" >
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">停留時間</h5>
            <button class="close" data-dismiss="modal">&times;</button>
          </div>
          <div class="modal-body">
              <div class="form-group">
                  <div class="slider" style="border:1px solid red;"></div>                 
              </div>               
          </div>
          <div class="modal-footer">
            <button class="btn btn-secondary" data-dismiss="modal">取消</button>
            <button id="aa" class="btn btn-primary" data-dismiss="modal">儲存</button>
              
          </div>
        </div>
      </div>
    </div>
    </div>
    
 <jsp:include page="../commons/footer.jsp"/>   
</body>
</html>