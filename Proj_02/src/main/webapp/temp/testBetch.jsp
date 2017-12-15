<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <title>測試多筆交易</title>
    <script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
    <style>
        form{          
            margin:10%;
        }
        select{
            margin-left:20px;
        }

    </style>

</head>
<body>
   

    <form id="batch" action="xxx.do">
        停留時間: <select name="times">
            <option value="半小時">半小時</option>
            <option value="一小時">一小時</option>
            <option value="三小時">三小時</option>
            <option value="半天">半天</option>
            <option value="一天">一天</option>
        </select>
        活動種類:<select name="kinds">
            <option value="表演">表演</option>
            <option value="展覽">展覽</option>
            <option value="音樂">音樂</option>
            <option value="研習">研習</option>
            <option value="影視">影視</option>
            <option value="休閒">休閒</option>
            <option value="親子">親子</option>              
        </select>
        活動名稱:<input type="text" name="note"/><br /><br />

        停留時間: <select name="times">
            <option value="半小時">半小時</option>
            <option value="一小時">一小時</option>
            <option value="三小時">三小時</option>
            <option value="半天">半天</option>
            <option value="一天">一天</option>
        </select>
        活動種類:<select name="kinds">
            <option value="表演">表演</option>
            <option value="展覽">展覽</option>
            <option value="音樂">音樂</option>
            <option value="研習">研習</option>
            <option value="影視">影視</option>
            <option value="休閒">休閒</option>
            <option value="親子">親子</option>
        </select>
        活動名稱:<input type="text" name="note" /><br /><br />

        停留時間: <select name="times">
            <option value="半小時">半小時</option>
            <option value="一小時">一小時</option>
            <option value="三小時">三小時</option>
            <option value="半天">半天</option>
            <option value="一天">一天</option>
        </select>
        活動種類:<select id="cc" name="kinds">
            <option value="表演">表演</option>
            <option value="展覽">展覽</option>
            <option value="音樂">音樂</option>
            <option value="研習">研習</option>
            <option value="影視">影視</option>
            <option value="休閒">休閒</option>
            <option value="親子">親子</option>
        </select>
        活動名稱:<input type="text" name="note" /><br /><br />

        <input type="submit" value="送出批次insert">

    </form>



</body>
</html>