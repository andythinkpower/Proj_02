<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="../css/google_search.css" />
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
    <script type="text/javascript" src="../js/cookie.js"></script>
    <script src="../js/_02_actDetail.js" ></script>
    <title>活動細節頁面</title>  
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

<jsp:include page="../commons/header_login.jsp"/>
    <div class="row">
        <div class="col"></div>
        <div class="col-5">

            <h1 class="text-center">建立行程-2</h1>

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

                        <label for="introduction">簡介:</label>
                        <textarea class="form-control" id="introduction" name="introduction" rows="5" ></textarea>
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


    <script>
        $(function () {
            var picPath = Cookies.get("picPath");
            console.log("照片路徑:" + picPath);
            $("#form").find("input[name='photoPath']").val(picPath);
        });
    </script>
    
 <jsp:include page="../commons/footer.jsp"/>   
</body>
</html>