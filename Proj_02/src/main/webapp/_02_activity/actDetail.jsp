<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
     -->

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
    <script>
        //計算目前天數 全域變數
        count = 0;

    </script>

</head>
<body>

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
      <script>
        $(function () {

            $("#form").append(addDay());

            //送出資料
            $("#submit").on('click', function () {
                $("#form").submit();
            });

            //增加單天活動項目
            $('body').on('click', ".add_detail", create_detail);

            function create_detail() {
                var detail = document.getElementById('detail');
                //  alert($(this).parent().parent().find("#x").val());
                //停留小時 動態新增
                var temp_hour = document.createElement('select');
                temp_hour.name = 'hour';
                for (i = 0; i < 24; i++) {
                    var temp_option = document.createElement('option');
                    if (i == 0) {
                        temp_option.innerText = '時'
                    } else {
                        temp_option.innerText = i;
                    }
                    temp_hour.appendChild(temp_option);
                }
                $(this).before(temp_hour);

                //停留分鐘 動態新增
                var temp_min = document.createElement('select');
                temp_min.name = 'min';
                for (i = 0; i < 60; i++) {
                    var temp_option = document.createElement('option');
                    if (i == 0) {
                        temp_option.innerText = '分'
                    } else {
                        temp_option.innerText = i;
                    }
                    temp_min.appendChild(temp_option);
                }
                $(this).before(temp_min);


                var activity = ['表演', '展覽', '音樂', '研習', '影視', '休閒', '親子'];
                //類型 動態更新
                var temp_kinds = document.createElement('select');
                temp_kinds.name = 'kinds';
                for (i = 0; i <= activity.length; i++) {
                    var temp_option = document.createElement('option');
                    if (i == 0) {
                        temp_option.innerText = '種類'
                    } else {
                        temp_option.innerText = activity[i-1];
                    }
                    temp_kinds.append(temp_option);
                }
                $(this).before(temp_kinds);
                //  <input type="text" name="dates" value="1" style="display:none">
                //活動名稱 預算 動態更新
                for (j = 0; j < 3; j++) {
                    var temp_input = document.createElement('input');
                    temp_input.type = "text";
                    if (j == 0) {
                        temp_input.name = "note";
                        temp_input.placeholder = "活動名稱";
                    } else if (j == 1) {
                        temp_input.name = "budget";
                        temp_input.placeholder = "預算";
                    } else {
                        temp_input.name = "dates";
                        temp_input.setAttribute("value",$(this).parents(".father").find("span").text());
                        temp_input.style = "display:none";
                        console.log($(this).parents(".father").find("span").text());
                    }
                    $(this).before(temp_input);
                }
                //換行
                var br = document.createElement("br");
                $(this).before(br);
            }

            //新增新的一天
            $('#create_Day').on('click', addDay);


            function addDay() {
                //天數+1
                count++;
                //新增天數框架
                $("#form").append('<div id="days"><div class="father"><fieldset><legend>第<span>' + count + '</span>天</legend>'
                    + '<div><input type="button" class="add_detail" value="新增行程"></div></fieldset></div></div>')            
            };           
        });
    </script>
</body>
</html>