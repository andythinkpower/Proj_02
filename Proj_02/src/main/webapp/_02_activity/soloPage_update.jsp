<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="../css/google_search.css" />
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>


<title>顯示單獨頁面</title>
<style>
body {
	background-color: #F2E6E6;
}

#section {
	margin: 5%;
	width: 30%;
}

html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

#map {
	height: 50%;
	float: right;
	width: 50%;
	height: 50%;
}

#directions-panel {
	margin-top: 10px;
	background-color: #FFEE77;
	padding: 10px;
}
</style>
</head>
<body>
	<jsp:include page="../commons/header_login.jsp" />
	<!-- 傳進來的參數 -->
	<p id="activityID" style="display: none;"><%= request.getParameter("activityID") %></p>
	
	<script>
		$(function(){
			
			var whole_Day=0;
			$.getJSON("update_page.do",{"activityID":$("#activityID").text()},function(data){
				
				$.each(data.superList,function(i,v){
					
					whole_Day++;
					addDayX(i);
					$.each(v,function(index,value){
						var row = $("<div class='form-row my-2'>").html("<div class='col-2'>" +
			                     "<input class='form-control setTime time' value='"+value.times+"' data-toggle='modal' data-target='#timeSlider' type='text' name='times' placeholder='停留時間' readonly />" +
			                     "</div><div class='col'><select class='custom-select mb-2 mr-sm-2 mb-sm-0 name='kinds'>" +
			                     "<option value='hhh' >選擇類型</option><option value='景點'>景點</option><option value='餐廳'>餐廳</option><option value='飯店'>飯店" +
			                     "</option><option value='活動'>活動</option><option value='其他'>其他</option></select></div> <div class='col-5'>" +
			                     "<input class='form-control note' value='"+value.note+"' name='note' placeholder='輸入所要搜尋的資料' data-toggle='modal' data-target='#searchBox' readonly />" +
			                     "</div> <div class='col'><input class='form-control' value='"+value.budget+"' name='budget' placeholder='預算' /></div>" +
			                     "<div class='col'><img src='../img/trash-3x.png' class='mt-1 pl-2 delete'/></div><input name='dates' type='hidden' value='"+value.dates+"'/>" +
			                     "<input name='longitude_temp' value='"+value.longitude+"' type='hidden' /><input name='latitude_temp' value='"+value.latitude+"' type='hidden' />");
			                $(".day"+i+"").before(row);
			                
			                $(".day"+i+"").prev().find(".custom-select").val(value.kinds);
			                
			              
			                
					})
				})
			})
			
			
			function addDayX(count) {
                //檢查天數
                //新增天數框架
                var card = $("<div class='card mt-3' style='border:2px solid gray;'>");
                var head = $("<div class='card-head'><h2 class='pt-2 px-3'>第<span>" + (count+1) + "</span>天</h2></div>")
                var body = $("<div class='card-body'>");
                body.append("<input class='btn btn-info col-3 mt-3 add_detail day" + count + "' type='button' value='新增活動' />");
                card.append(head);
                card.append(body);
                $(".option").before(card);
            };
            
            function addDay() {
                //檢查天數
                whole_Day++;
                //新增天數框架
                var card = $("<div class='card mt-3' style='border:2px solid gray;'>");
                var head = $("<div class='card-head'><h2 class='pt-2 px-3'>第<span>" + whole_Day + "</span>天</h2></div>")
                var body = $("<div class='card-body'>");
                body.append("<input class='btn btn-info col-3 mt-3 add_detail' type='button' value='新增活動' />");
                card.append(head);
                card.append(body);
                $(".option").before(card);
            };
            
            function create_detail() {
                var row = $("<div class='form-row my-2'>").html("<div class='col-2'>" +
                     "<input class='form-control setTime time' data-toggle='modal' data-target='#timeSlider' type='text' name='times' placeholder='停留時間' readonly />" +
                     "</div><div class='col'><select class='custom-select mb-2 mr-sm-2 mb-sm-0 id='inlineFormCustomSelect' name='kinds'>" +
                     "<option value='' selected>選擇類型</option><option value='景點'>景點</option><option value='餐廳'>餐廳</option><option value='飯店'>飯店" +
                     "</option><option value='活動'>活動</option><option value='其他'>其他</option></select></div> <div class='col-5'>" +
                     "<input class='form-control note' name='note' placeholder='輸入所要搜尋的資料' data-toggle='modal' data-target='#searchBox' readonly />" +
                     "</div> <div class='col'><input class='form-control' name='budget' placeholder='預算' /></div>" +
                     "<div class='col'><img src='../img/trash-3x.png' class='mt-1 pl-2 delete'/></div><input name='dates' type='hidden' value='"+whole_Day+"'/>" +
                     "<input name='longitude_temp' type='hidden' value=''/><input name='latitude_temp' type='hidden' value=''/>");
                $(this).before(row);
            }
            
            
          //增加單天活動項目
            $('body').on('click', ".add_detail", create_detail);
            //增加新的一天
            
            $('#create_Day').on('click', addDay);

            //刪除單一活動項目 如果全刪光 會自動把當天也砍掉  !!天數還沒能全部動態更新!!
            $('body').on('click', '.delete', function () {
                var length = $(this).parents(".card-body").children(".form-row").length;
                if (length == 1) {
                    console.log("length=0");
                    $(this).parents(".card").remove();
                    whole_Day--;
                } else {
                    $(this).parents(".form-row").remove();
                }
            });

            //按下停留時間按鈕 記住當下位置 方便等等儲存時間
            $('body').on('click', '.setTime', function () {
                //前面沒var 是全域變數
                time_value = $(this);
            });

            //選擇完停留時間 按下儲存按鈕  要抓到剛調整的時間值 存到input裡面
            $('body').on('click', ".saveTime", function () {
                var stay_time = $(this).parents('.modal-content').find(".stayTime").text();
                console.log(stay_time);
                time_value.attr("value", stay_time);
            });

            //拉軸拉停留時間
            $("body").on('click', '.add_detail', function () {
                $(".slider").slider({
                    min: 0,
                    max: 1440,
                    step: 15,
                    slide: function (e, ui) {
                        var hours = Math.floor(ui.value / 60);
                        var minutes = ui.value - (hours * 60);
                        console.log(hours);
                        if (hours < 10)   hours = '0' + hours;
                        if (minutes == 0) minutes = '0' + minutes;
                        $('.modal-title').html(hours + ':' + minutes);
                    }
                });
            })
            
            
            $("body").on("change", "#file", function () {
                preview(this);
            })
            function preview(input) {

                //取得檔名
                $(".cap").text(input.files[0].name);


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
	
	 <div class="row">
        <div class="col"></div>
        <div class="col-5">

            <h1 class="text-center">修改行程</h1>
<h3>ee</h3>
            <form id="activity" action="ActivityController.do" method="post">
                <div class="container" style="border:2px solid gray;border-radius:5px;background-color: white;">
                    <div class="form-row pt-4">
                        <div class="col text-center ">
                            <input type="hidden" name="doWhat" value="detail">
                            <div class="form-group pt-2">
                                <label for="Title">行程名稱:</label>
                                <input type="text" id="Title" name="actTitle" value="${activityBean.actTitle}" />
                            </div>
                            <div class="form-group pt-4">
                                <label for="Region">活動地區:</label>
                                <input type="text" id="Region" name="actRegion" value="${activityBean.actRegion}" />
                            </div>
                            <div class="form-group pt-4">
                                <label for="date">出發日期:</label>
                                <input type="text" name="actStartDate" id="date" value="${activityBean.actStartDate}" readonly>
                                <br>
                            </div>
                            <div class="form-group pl-5 ">
                                <input type="file" id="file" name="file" class="form-control-file" accept="image/*" style='display:none'>
                            </div>
                        </div>
                        <div class="col pr-5">
                         <label for='file'>
                                <img src="${pageContext.request.contextPath}${activityBean.photoPath}" class="figure-img img-fluid rounded preview" width='300' style='height:250px'>
                           </label>
                        </div>
                    </div>
                    <div class="form-group px-5">
                        <label for="exampleFormControlTextarea1">簡介:</label>
                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="5" ></textarea>
                    </div>

                </div>

                <!-- 總結選項 一開始就有 -->
                <div class="card mt-3 option" style="border:2px solid red;">
                    <div class="card-body">
                        <div class="row">
                            <div class="col"></div>
                            <div class="col">
                                <input id="create_Day" class="btn btn-primary ml-4" type="button" value="新增天數">
                                <input id="submit" class="btn btn-dark ml-3" type="submit" value="儲存" />
                            </div>
                            <div class="col"></div>
                        </div>
                    </div>
                </div>

            </form>
        </div>
        <div class="col"></div>
    </div>
    
    
    <!-- ======================================== 隱藏區域 ======================================== -->
    <!-- 負責連接google map searchBox -->

    <div class="container">
        <div class="modal" id="searchBox">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title ">搜尋景點</h5>
                        <button class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <input type="text" id="pac-input" />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" data-dismiss="modal">取消</button>
                        <button id="aa" class="btn btn-primary savePlace" data-dismiss="modal">儲存</button>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 負責選取時間 -->

    <div class="container">
        <div class="modal" id="timeSlider">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title stayTime">停留時間</h5>
                        <button class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <div class="slider" style="border:1px solid red;"></div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" data-dismiss="modal">取消</button>
                        <button id="aa" class="btn btn-primary saveTime" data-dismiss="modal">儲存</button>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ======================================== 隱藏區域 ======================================== -->

    <script>
        $(function () {
        	
        	$("#introduction").val('${activityBean.introduction}');
        	
        	
        	
        	
            $("body").on('click', 'input[name=note]', function () {
                temp = $(this);
                console.log(temp)
                $("#pac-input").val("");
            })

            //選擇完停留時間 按下儲存按鈕  要抓到剛調整的時間值 存到input裡面
            $('body').on('click', ".savePlace", function () {
                temp.val(simple_name);
                console.log(lng);
                temp.parent().nextAll('input[name=longitude_temp]').val(lng);
                temp.parent().nextAll('input[name=latitude_temp]').val(lat);
            });
        })

        //!!!!!!!已了解
        function initAutocomplete() {

            // 創造一個searchBox物件
            var input = document.getElementById('pac-input');
            var searchBox = new google.maps.places.SearchBox(input);

            searchBox.addListener('places_changed', function () {
                //步驟1 取得searchBox傳回的Place物件陣列 如果沒有直接return
                var places = searchBox.getPlaces();
                //找不到地點返回
                if (places.length == 0) {
                    return;
                }
                //取得這個地點我們所要的資訊
                simple_name = places[0].name;
                lng = places[0].geometry.location.lng();
                lat = places[0].geometry.location.lat();
                //把地點名稱 經緯度 塞到對應的input中

            });
        }

    </script>

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAAxgzejqCBKYETiCdV-Q9_u7VhfX7BKM0&libraries=places&callback=initAutocomplete"
            async defer></script>





	<jsp:include page="../commons/footer.jsp" />
</body>
</html>