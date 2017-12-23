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
        <fieldset>
            <legend>行程總覽</legend>
            <input type="hidden" name="doWhat" value="detail">
            <input type="hidden" name="photoPath" value="">
            <input type="text" name="actStartDate" value="${activityBean.actStartDate}"><br>
            <input type="text" name="actRegion" value="${activityBean.actRegion}"><br>
            <input type="text" name="actTitle" value="${activityBean.actTitle}"><br>
            <input type="text" name="introduction" value="${activityBean.introduction}"><br>
        </fieldset>
    </form>
    <button id="create_Day">新增天數</button> <button id="submit">儲存</button>

    <!-- 以下div都是隱藏狀態 按按鈕才會浮出-->

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

    <script>
        $(function () {
            $("body").on('click', 'input[name=note]', function () {
                temp = $(this);
                $("#pac-input").val("");
            })

            //選擇完停留時間 按下儲存按鈕  要抓到剛調整的時間值 存到input裡面
            $('body').on('click', ".savePlace", function () {
                temp.val(simple_name);
                console.log(lng);
                temp.nextAll('input[name=longitude_temp]').val(lng);
                temp.nextAll('input[name=latitude_temp]').val(lat);
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
$(function(){
	var picPath=Cookies.get("picPath");
	console.log("照片路徑:"+picPath);
	$("#form").find("input[name='photoPath']").val(picPath);
});
</script>
    
 <jsp:include page="../commons/footer.jsp"/>   
</body>
</html>