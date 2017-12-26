<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文章</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
    <style>
        body{
            font-family:Microsoft JhengHei;
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
                        <div class="card-header">
                            <h4>文章</h4>
                        </div>
                        <div class="card-body">
                            <form>
                                <div class="form-group">
                                    <label for="title">標題：</label>
                                    <input type="text" readonly class="form-control-plaintext" value="${param.articlename}" />
                                </div>
                                <div class="form-group">
                                    <label for="title">類型：</label>
                                    <input type="text" readonly class="form-control-plaintext" value="${param.articletype}" />
                                </div>
                                <div class="form-group">
                                    <label for="file">Image Upload</label>
                                    <img /><!--上傳後的照片顯示在這裡-->
                                </div>
                                <div class="form-group">
                                    <label for="body">內容：</label><br />
                                    <textarea class="form-control-plaintext" name="content" id="editor">${param.articlecontent}</textarea>
                                </div>
                                <div>
                                    <input type="radio" name="setting" id="setting1" /><label for="setting1">公開</label>
                                    <input type="radio" name="setting" id="setting2" /><label for="setting2">私人</label>
                                </div>
                                <div>
                                    <input type="submit" class="btn btn-primary" value="Submit" />
                                </div>
                            </form><!-- form end here-->
                        </div><!-- card-body end here-->
                    </div><!-- card end here-->
                </div><!-- col end here-->
            </div><!-- row end here-->
        </div><!-- container end here-->
    </section>
<jsp:include page="/commons/footer.jsp"></jsp:include>    
</body>
</html>