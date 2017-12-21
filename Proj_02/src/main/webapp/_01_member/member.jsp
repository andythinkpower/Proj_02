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
    <style>
        body {
            font-family: Microsoft JhengHei;
        }
    </style>
</head>
<body>
<jsp:include page="../commons/header.jsp"></jsp:include>
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
                        
        <input type="button" class="btn btn-sm btn-info" data-toggle="modal" data-target="#changepasswordModal" value="修改密碼">
        <div class="modal" id="changepasswordModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">修改密碼</h5>
                        <button class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label>舊密碼</label>
                                <input type="password" class="form-control" />
                            </div>
                            <div class="form-group">
                                <label>新密碼</label>
                                <input type="password" class="form-control" />
                            </div>
                            <div class="form-group">
                                <label>再輸入一次密碼</label>
                                <input type="password" class="form-control" />
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-primary" data-dismiss="modal">送出修改</button>
                        <button class="btn btn-secondary" data-dismiss="modal">關閉視窗</button>
                    </div>
                </div>
            </div>
        </div>
        
                    </div>
                    <!-- 暱稱 -->
                    <div>
                        <label>暱稱：</label>
                        <input type="text" name="membernickname" value="${member.membernickname}">
                    </div>
                    <!-- 性別-->
                    <div>
                        <label>性別：</label>
                        <select id="membergender" name="membergender">
                            <option id="none" value="">請選擇性別</option>
                            <option id="male" value="男生">男生</option>
                            <option id="female" value="女生">女生</option>
                        </select>
                    </div>
                    <!-- 這裡是隱藏接收性別回傳值的地方 -->            
            		<input id="gender" type="text" style="display:none" value="${member.membergender}">
                    <!-- 生日 -->
                    <div>
                        <label>生日：</label>
                        <input id="memberbdate" type="date" name="memberbdate" value="${member.memberbdate}">
                    </div>
                    <!-- 這裡是隱藏接收生日回傳值的地方 -->            
            		<input id="bdate" type="text" style="display:none" value="${member.memberbdate}">
                </div><!-- 帳號 col 2 end -->
            </div><!-- row end -->
            <!-- like -->
            <div class="row p-2" style="border:1px green solid">
                <!-- 活動類型 -->
                <div>
                    <label>活動類型：</label>
<!--                     <input type="checkbox" name="liketype" value="0"> 全選 -->
                    <input id="type表演萬象" type="checkbox" name="liketype" value="表演萬象"> 表演萬象
                    <input id="type展覽廣場" type="checkbox" name="liketype" value="展覽廣場"> 展覽廣場
                    <input id="type音樂現場" type="checkbox" name="liketype" value="音樂現場"> 音樂現場
                    <input id="type講座研習" type="checkbox" name="liketype" value="講座研習"> 講座研習
                    <input id="type電影瞭望" type="checkbox" name="liketype" value="電影瞭望"> 電影瞭望
                    <input id="type城市萬花筒" type="checkbox" name="liketype" value="城市萬花筒"> 城市萬花筒
                    <input id="type親子活動" type="checkbox" name="liketype" value="親子活動"> 親子活動
                    <input id="type戶外行腳" type="checkbox" name="liketype" value="戶外行腳"> 戶外行腳
                </div>
                <!-- 這裡是隱藏接收活動類型回傳值的地方 -->            
            		<input id="liketypes" type="text" style="display:none" value="${member.events}">
                <!-- 地區 -->
                <div>
                    <label>活動地區：</label>
                    <input id="region中正區" type="checkbox" name="likeregion" value="中正區"> 中正區
                    <input id="region大同區" type="checkbox" name="likeregion" value="大同區"> 大同區
                    <input id="region中山區" type="checkbox" name="likeregion" value="中山區"> 中山區
                    <input id="region松山區" type="checkbox" name="likeregion" value="松山區"> 松山區
                    <input id="region大安區" type="checkbox" name="likeregion" value="大安區"> 大安區
                    <input id="region萬華區" type="checkbox" name="likeregion" value="萬華區"> 萬華區
                    <input id="region信義區" type="checkbox" name="likeregion" value="信義區"> 信義區
                    <input id="region士林區" type="checkbox" name="likeregion" value="士林區"> 士林區
                    <input id="region北投區" type="checkbox" name="likeregion" value="北投區"> 北投區
                    <input id="region內湖區" type="checkbox" name="likeregion" value="內湖區"> 內湖區
                    <input id="region南港區" type="checkbox" name="likeregion" value="南港區"> 南港區
                    <input id="region文山區" type="checkbox" name="likeregion" value="文山區"> 文山區
                </div>
                <!-- 這裡是隱藏接收活動類型回傳值的地方 -->            
            		<input id="likeregions" type="text" style="display:none" value="${member.regions}">
            </div>
            <!-- epaper -->
            <div class="row p-2" style="border:1px green solid">
            	<label>電子報：</label>
                	<select id="memberepaper" name="memberepaper" >
                    	<option id="epaper0" value="0">不訂閱</option>
                        <option id="epaper1" value="1">訂閱</option>
                    </select>
            </div><!-- epaper row end-->
            <!-- 這裡是隱藏接收電子報回傳值的地方 -->            
            <input id="epaper" type="text" style="display:none" value="${member.memberepaper}">                     
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
            
    <script>
//這裡是處理電子報回傳值的地方
    var epaper=$('#epaper').val();
    console.log(epaper);
    if(epaper=="0"){
    	$("#epaper0").attr("selected", "selected");
    }else{
    	$("#epaper1").attr("selected", "selected");
    }
//這裡是處理性別回傳值的地方
    var gender=$('#gender').val();
    console.log(gender);
    if(gender=="女生"){
    	$("#female").attr("selected", "selected");
    }else if(gender=="男生"){
    	$("#male").attr("selected", "selected");
    }else{
    	$("#none").attr("selected", "selected");
    }
//這裡是處理生日回傳值的地方
    var bdate=$('#bdate').val();
    console.log(bdate);
//這裡是處理喜好類型回傳值的地方
    var liketypes=$('#liketypes').val();
    console.log(liketypes);
    if(liketypes.match('表演萬象')!=null){    	$("#type表演萬象").attr("checked", "checked");    }
    if(liketypes.match('展覽廣場')!=null){    	$("#type展覽廣場").attr("checked", "checked");    }
	if(liketypes.match('音樂現場')!=null){    	$("#type音樂現場").attr("checked", "checked");    }
	if(liketypes.match('講座研習')!=null){    	$("#type講座研習").attr("checked", "checked");    }
	if(liketypes.match('電影瞭望')!=null){    	$("#type電影瞭望").attr("checked", "checked");    }
	if(liketypes.match('城市萬花筒')!=null){    	$("#type城市萬花筒").attr("checked", "checked");    }
	if(liketypes.match('親子活動')!=null){    	$("#type親子活動").attr("checked", "checked");    }
	if(liketypes.match('戶外行腳')!=null){    	$("#type戶外行腳").attr("checked", "checked");    }
//這裡是處理喜好類型回傳值的地方
    var likeregions=$('#likeregions').val();
    console.log(likeregions);
    if(likeregions.match('中正區')!=null){    	$("#region中正區").attr("checked", "checked");    }
    if(likeregions.match('大同區')!=null){    	$("#region大同區").attr("checked", "checked");    }
    if(likeregions.match('中山區')!=null){    	$("#region中山區").attr("checked", "checked");    }
    if(likeregions.match('松山區')!=null){    	$("#region松山區").attr("checked", "checked");    }
    if(likeregions.match('大安區')!=null){    	$("#region大安區").attr("checked", "checked");    }
    if(likeregions.match('萬華區')!=null){    	$("#region萬華區").attr("checked", "checked");    }
    if(likeregions.match('信義區')!=null){    	$("#region信義區").attr("checked", "checked");    }
    if(likeregions.match('士林區')!=null){    	$("#region士林區").attr("checked", "checked");    }
    if(likeregions.match('北投區')!=null){    	$("#region北投區").attr("checked", "checked");    }
    if(likeregions.match('內湖區')!=null){    	$("#region內湖區").attr("checked", "checked");    }
    if(likeregions.match('南港區')!=null){    	$("#region南港區").attr("checked", "checked");    }
    if(likeregions.match('文山區')!=null){    	$("#region文山區").attr("checked", "checked");    }
//這裡處理全選/清空
//$('input[name="liketype"]:checkbox:eq(0)').change(function () {
    // 取得「其他選項」CheckBox
    //var checkboxes = $('input[name="liketype"]:checkbox:gt(0)');
    // 「其他選項」CheckBox 會依據「全部」CheckBox 的 Checked 狀態改變
    //$(this).is(':checked') ? checkboxes.prop('checked', 'checked') : checkboxes.removeAttr('checked');
//});
//$('input[name="liketype"]:checkbox:gt(0)').change(function () {
	// 判斷「其他選項」CheckBox 的 Checked 狀態是否全勾選, 如果全勾選即將「全部」Checkbox 勾選
	//if ($('input[name="liketype"]:gt(0):checked').length == ($('input[name="liketype"]:checkbox:gt(0)').length)) {
	//	$('input[name="liketype"]:checkbox:eq(0)').prop("checked", "checked");
	//} else {
	//	$('input[name="liketype"]:checkbox:eq(0)').removeAttr("checked");
	//}
//});

    </script>
<jsp:include page="../commons/footer.jsp"></jsp:include>
</body>
</html>