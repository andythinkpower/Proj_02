
        $(function () {
        	//////////////////////////
        	
        	$("body").on('click','.add_detail',function(){
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
                        $(this).next(".change").attr("value", hours + ':' + minutes)
                    }
                });
        		
        	})
        	
        	
                
        	
        	
        	//////////////////////////
                
            //計算目前天數 全域變數
            count = 0;    

            $("#form").append(addDay());

            //送出資料
            $("#submit").on('click', function () {
              //  $("#form").submit();
            });

            //增加單天活動項目
            $('body').on('click', ".add_detail", create_detail);

            function create_detail() {
                var detail = document.getElementById('detail');
                
                $(this).before('<input type="button" class="btn btn-info" data-toggle="modal" data-target=".modal" value="停留時間"/>'
                		+'<input class="change" type="text"  name="times" value="" />');
               
                


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
 