$(function () {
    ///////////一進畫面執行/////////////
    //計算目前天數 全域變數
    count = 0;
    //畫面一進入先自動新增一天
    $("#form").append(addDay());

    ///////////事件/////////////
    //按下停留時間按鈕 記住當下位置 方便等等儲存時間
    $('body').on('click', '.setTime', function () {
        //前面沒var 是全域變數
        time_value = $(this).nextAll(".time");
    });




    //選擇完停留時間 按下儲存按鈕  要抓到剛調整的時間值 存到input裡面
    $('body').on('click', ".saveTime", function () {
        var stay_time = $(this).parents('.modal-content').find(".stayTime").text();
        console.log("ans:" + stay_time);
        time_value.attr("value", stay_time);
    });


    $("body").on('click', '.add_detail', function () {
        $(".slider").slider({
            min: 0,
            max: 1440,
            step: 15,
            slide: function (e, ui) {
                var hours = Math.floor(ui.value / 60);
                var minutes = ui.value - (hours * 60);
                if (hours.length == 1) hours = '0' + hours;
                if (minutes.length == 1) minutes = '0' + minutes;
                $('.modal-title').html(hours + ':' + minutes);
            }
        });

    })

    //送出資料
    $("#submit").on('click', function () {
        $("#form").submit();
    });

    //刪除單一活動項目 如果全刪光 會自動把當天也砍掉  !!天數還沒能動態更新!!
    $('body').on('click', '.delete', function () {
        console.log($(this).parents('.del').children().length);
        if ($(this).parents('.del').children().length == 2) {
            $(this).parents('.father').remove();
            count--;
        } else {
            $(this).parents('.single').remove();
        }

    });

    //增加單天活動項目
    $('body').on('click', ".add_detail", create_detail);
    function create_detail() {
        $(this).before('<div class="single"></div>');
        $(this).prev().append('<input type="button" class="btn btn-info setTime" data-toggle="modal" data-target="#timeSlider" value="停留時間"/>'
                + '<input class="time" type="text"  name="times" value="" />');


        var activity = ['表演', '展覽', '音樂', '研習', '影視', '休閒', '親子'];
        var select = $("<select name='kinds'>");
        for (i = 0; i <= activity.length; i++) {
            if (i == 0) {
                var op = $("<option>").text('種類');
            } else {
                var op = $("<option>").text(activity[i - 1]);
            }
            select.append(op);
        }
        $(this).prev().append(select);

        //活動名稱 預算 動態更新
        for (j = 0; j < 5; j++) {
            if (j == 0) {
                $(this).prev().append($("<input class='note' name='note' placeholder='活動地點' data-toggle='modal' data-target='#searchBox'>"));
            } else if (j == 1) {
                $(this).prev().append($("<input name='budget' placeholder='預算'>"));
            } else if (j == 2) {
                $(this).prev().append($("<input name='dates' type='hidden' value='" + count + "'>"));
                var dd = $(this).parents('.father').find("span").text();
                console.log(dd);
            } else if (j == 3) {
                $(this).prev().append($("<input name='longitude_temp' type='hidden' value='" + count + "'>"));
            } else if (j == 4) {
                $(this).prev().append($("<input name='latitude_temp' type='hidden' value='" + count + "'>"));
            }
        }
        $(this).prev().append("<input class='delete' type='button' value='刪除'/><br>")
    }
    //新增新的一天
    $('#create_Day').on('click', addDay);

    function addDay() {
        //檢查天數  
        count++;
        //新增天數框架
        $("#form").append('<div id="days"><div class="father"><fieldset><legend>第<span>' + count + '</span>天</legend>'
            + '<div class="del"><input type="button" class="add_detail" value="新增行程"></div></fieldset></div></div>')
    };
});