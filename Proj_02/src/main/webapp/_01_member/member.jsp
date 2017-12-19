<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</head>
<body>

    <form name="form" action="<c:url value='/member.controller' />" method="post">
        <div class="container" style="border:1px red solid">
            <h3><strong>Profile</strong></h3>
            <div class="row p-2" style="border:1px green solid">
                <div class="col-7  p-2" style="border:1px blue solid">
                    <img  value="" name="memberphoto" height="160" width="160" id="img" src="" />
                    <input accept="image/*" id="uploadImage" name="memberphoto" type="file" />
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
                </div><!-- 照片col 1 end -->
                <!-- member -->
                <div class="col-5 p-2" style="border:1px blue solid">
                    <!-- 帳號 -->
                    <div>
                        <label for="staticEmail">Email：</label>
                        <input type="text" readonly class="form-control-plaintext" name="memberemail"
                               id="staticEmail" value="${member.memberemail}">
                    </div>
                    <!-- 密碼 -->
                    <div>
                        <label>密碼：</label>
                        <input class="btn btn-sm" type="submit" name="memberpassword"
                               value="修改密碼" />
                    </div>
                    <!-- 暱稱 -->
                    <div>
                        <label>暱稱：</label>
                        <input type="text" name="membernickname" value="${member.membernickname}${param.membernickname}">
                    </div>
                    <!-- 性別-->
                    <div>
                        <label>性別：</label>
                        <select id="" name="membergender" value="${member.membergender}${param.membergender}">
                            <option value="">請選擇性別</option>
                            <option value="男生">男生</option>
                            <option value="女生">女生</option>
                        </select>
                    </div>
                    <!-- 生日 -->
                    <div>
                        <label>生日：</label>
                        <input type="date" name="memberbdate" value="${member.memberbdate}${param.memberbdate}">
                    </div>
                </div><!-- 帳號 col 2 end -->
            </div><!-- row end -->
            <!-- like -->
            <div class="row p-2" style="border:1px green solid">
                <!-- 活動類型 -->
                <div>
                    <label>活動類型：</label>
                    <input type="checkbox" name="liketype" value="表演萬象"> 表演萬象
                    <input type="checkbox" name="liketype" value="展覽廣場"> 展覽廣場
                    <input type="checkbox" name="liketype" value="音樂現場"> 音樂現場
                    <input type="checkbox" name="liketype" value="講座研習"> 講座研習
                    <input type="checkbox" name="liketype" value="電影瞭望"> 電影瞭望
                    <input type="checkbox" name="liketype" value="城市萬花筒"> 城市萬花筒
                    <input type="checkbox" name="liketype" value="親子活動"> 親子活動
                    <input type="checkbox" name="liketype" value="城外行腳"> 城外行腳
                </div>
                <!-- 地區 -->
                <div>
                    <label>活動地區：</label>
                    <input type="checkbox" name="liketype" value="中正區"> 中正區
                    <input type="checkbox" name="liketype" value="大同區"> 大同區
                    <input type="checkbox" name="liketype" value="中山區"> 中山區
                    <input type="checkbox" name="liketype" value="松山區"> 松山區
                    <input type="checkbox" name="liketype" value="大安區"> 大安區
                    <input type="checkbox" name="liketype" value="萬華區"> 萬華區
                    <input type="checkbox" name="liketype" value="信義區"> 信義區
                    <input type="checkbox" name="liketype" value="士林區"> 士林區
                    <input type="checkbox" name="liketype" value="北投區"> 北投區
                    <input type="checkbox" name="liketype" value="內湖區"> 內湖區
                    <input type="checkbox" name="liketype" value="南港區"> 南港區
                    <input type="checkbox" name="liketype" value="文山區"> 文山區
                </div>
            </div>
            <!-- epaper -->
            <div class="row p-2" style="border:1px green solid">
            	<label>電子報：</label>
                	<select name="memberepaper" value="${member.memberepaper}${param.memberepaper}">
                    	<option value="0">訂閱</option>
                        <option value="1">不訂閱</option>
                    </select>
            </div><!-- epaper row end-->
            <div>
                <input class="btn btn-primary" type="submit" value="送出修改">
            </div>
        </div><!-- container end -->
    </form>


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
            integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
            integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
            crossorigin="anonymous"></script>
</body>
</html>