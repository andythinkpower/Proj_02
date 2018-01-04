 $(function () {

            var count = 0;
            addDay();
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
                    count--;
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


            function create_detail() {
                var row = $("<div class='form-row my-2'>").html("<div class='col-2'>" +
                     "<input class='form-control setTime time' data-toggle='modal' data-target='#timeSlider' type='text' name='times' placeholder='時間' readonly />" +
                     "</div><div class='col'><select class='custom-select mb-2 mr-sm-2 mb-sm-0 id='inlineFormCustomSelect' name='kinds'>" +
                     "<option value='' selected>選擇類型</option><option value='景點'>景點</option><option value='餐廳'>餐廳</option><option value='飯店'>飯店" +
                     "</option><option value='活動'>活動</option><option value='其他'>其他</option></select></div> <div class='col-5'>" +
                     "<input class='form-control note' name='note' placeholder='輸入所要搜尋的資料' data-toggle='modal' data-target='#searchBox' readonly />" +
                     "</div> <div class='col'><input class='form-control' name='budget' placeholder='預算' /></div>" +
                     "<div class='col'><img src='../img/trash-3x.png' class='mt-1 pl-2 delete'/></div><input name='dates' type='hidden' value='"+count+"'/>" +
                     "<input name='longitude_temp' type='hidden' value=''/><input name='latitude_temp' type='hidden' value=''/>");
                $(this).before(row);
            }

            function addDay() {
                //檢查天數
                count++;
                //新增天數框架
                var card = $("<div class='card mt-3' style='border:2px solid gray;'>");
                var head = $("<div class='card-head'><h2 class='pt-2 px-3'>第<span>" + count + "</span>天</h2></div>")
                var body = $("<div class='card-body'>");
                body.append("<input class='btn btn-info col-3 mt-3 add_detail' type='button' value='新增活動' />");
                card.append(head);
                card.append(body);
                $(".option").before(card);
            };


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