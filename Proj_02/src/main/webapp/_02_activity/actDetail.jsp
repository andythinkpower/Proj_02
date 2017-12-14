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

</head>
<body>






    <h1>建立行程-2</h1>
    <form action="ActivityController.do" id="formm" method="post">
        <!--之後 日期要顯示在fieldset 下面的legend-->
       <input type="text" name="doWhat" value="detail" style="display:none;">
                <div id="days" class="middle">
                    <fieldset>
                        <legend>第一天</legend>
                        <!-- 這是activitybean -->
                        <input type="text" name="actStartDate" value="${activityBean.actStartDate }" style="display:none;">
                        <input type="text" name="actRegion" value="${activityBean.actRegion }" style="display:none;">
                        <input type="text" name="actTitle" value="${activityBean.actTitle }" style="display:none;">
                        <input type="text" name="introduction" value="${activityBean.introduction }" style="display:none;">
                        <!-- 這是activitybean -->
                        <div id="detail" class="small">
                            <select id="ho" name="hour">
                                <option value="">時</option>
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                            </select>
                            <select name="min">
                                <option value="">分</option>
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                            </select>
                            <select name="kinds">
                                <option>表演</option>
                                <option>展覽</option>
                                <option>音樂</option>
                                <option>研習</option>
                                <option>影視</option>
                                <option>休閒</option>
                                <option>親子</option>
                            </select>
                            <input class="form-group col-md-1" type="text" id="x" name="note" placeholder="活動名稱">
                            <input type="text" name="budget" placeholder="預算">
                            <input type="button" id="add_detail" value="新增行程">
                            <br />
                           

                        </div>
                    </fieldset>
</div>
          
          
      
    </form>

    <button id="create_Day">新增天數</button> <button id="submit">儲存</button>  

   



    <script>
        $(function () {

            //計算目前天數
            count = 1;

            //送出資料
            $("#submit").on('click', function () {
                $("#formm").submit();
            });

            //新增新的一天
            $('#create_Day').on('click', create_day);

            function create_day() {
                count++;
                console.log(count);
                var days = document.getElementById('days');
                var newDay = document.createElement('div');
                var fieldDay = document.createElement("fieldset")
                var legend = document.createElement("legend");
                legend.innerText = "第" + count + "天";

                fieldDay.appendChild(legend);
                newDay.appendChild(fieldDay);
                
                var add_Detail = document.createElement('input');
                add_Detail.type = "button";
                add_Detail.value = "新增行程";
                





                newDay.className = "small";
                fieldDay.appendChild(add_Detail)
               



                days.append(newDay);
            }



            

            //增加單天活動項目
            $('#add_detail').on('click', create_detail);


            function create_detail() {
                var detail = document.getElementById('detail');
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

                detail.append(temp_hour);

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
                detail.append(temp_min);

                

                var activity = ['表演', '展覽', '音樂', '研習', '影視', '休閒', '親子'];               
                //類型 動態更新
                var temp_kinds = document.createElement('select');
                temp_kinds.name = 'kinds';
                for (i = 0; i < 4; i++) {
                    var temp_option = document.createElement('option');
                    if (i == 0) {
                        temp_option.innerText = '種類'
                    } else {
                        temp_option.innerText = activity[i];
                    }
                    temp_kinds.append(temp_option);
                }
                detail.appendChild(temp_kinds);


                //活動名稱 預算 動態更新
                for (j = 0; j < 2; j++) {
                    var temp_input = document.createElement('input');
                    temp_input.type = "text";
                    if (j == 0) {
                        temp_input.name = "note";
                        temp_input.placeholder = "活動名稱";
                    } else {
                        temp_input.name = "budget";
                        temp_input.placeholder = "預算";
                    }
                    detail.appendChild(temp_input);
                }
                //換行
                var br = document.createElement("br");
                detail.appendChild(br);

            }
        });
    </script>

</body>
</html>