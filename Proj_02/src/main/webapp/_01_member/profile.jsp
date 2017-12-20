<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Profile</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">

</head>
<body>
    <div class="container">

      <legend class="text-lg-center"><strong>Profile</strong></legend>

        <form class="mx-5 px-5">
        <!-- 帳號 -->
          <div class="form-group row">
            <label>Email：</label>
            <div>
              <input type="text" readonly class="form-control-plaintext" id="staticEmail" value="email@example.com">
            </div>
          </div>

        <!-- 密碼 -->

        <div class="form-group row">
          <label>密碼：</label>
          <div class="pr-2">
            <input type="password" placeholder="Password">
          </div>
          <input class="btn btn-warning" type="submit" value="修改密碼" />
        </div>
        </form>

        <form class="mx-5 px-5">
        <!-- 暱稱 -->
        <div class="form-group row">
          <label>暱稱：</label>
          <input type="text">
        </div>

        <!-- 性別-->

        <div class="form-group row">
          <label>性別：</label>
          <select>
            <option>男生</option>
            <option>女生</option>
          </select>
        </div>

        <!-- 生日 -->

        <div class="form-group row">
          <label>生日：</label>
          <input type="date" name="bday">
        </div>


        <!-- 喜好 -->
        <div>
        <!-- 活動類型 -->

        <div class="form-group row">
          <label>活動類型：</label>
          <input type="checkbox" name="liketype" value="表演萬象"> 表演萬象
          <input type="checkbox" name="liketype" value="展覽廣場"> 展覽廣場
          <input type="checkbox" name="liketype" value="音樂現場"> 音樂現場
          <input type="checkbox" name="liketype" value="講座研習"> 講座研習
          <input type="checkbox" name="liketype" value="電影瞭望"> 電影瞭望
          <input type="checkbox" name="liketype" value="城市萬花筒"> 城市萬花筒
          <input type="checkbox" name="liketype" value="親子活動"> 親子活動
          <input type="checkbox" name="liketype" value="城外行腳"> 城外行腳
        </div>

        <!-- 地區 -->
        <div class="form-group row">
          <label>活動地區：</label>
          <input type="checkbox" name="liketype" value="中正區"> 中正區
          <input type="checkbox" name="liketype" value="大同區"> 大同區
          <input type="checkbox" name="liketype" value="中山區"> 中山區
          <input type="checkbox" name="liketype" value="松山區"> 松山區
          <input type="checkbox" name="liketype" value="大安區"> 大安區
          <input type="checkbox" name="liketype" value="萬華區"> 萬華區
          <input type="checkbox" name="liketype" value="信義區"> 信義區
          <input type="checkbox" name="liketype" value="士林區"> 士林區
          <input type="checkbox" name="liketype" value="北投區"> 北投區
          <input type="checkbox" name="liketype" value="內湖區"> 內湖區
          <input type="checkbox" name="liketype" value="南港區"> 南港區
          <input type="checkbox" name="liketype" value="文山區"> 文山區
        </div>
        </div>
        <!-- epaper -->

        <div class="form-group row">
          <label>電子報：</label>
          <input type="radio" name="gender" value="male" checked> 訂閱
          <input type="radio" name="gender" value="female"> 不訂閱
        </div>

        <div>
          <input class="btn btn-primary" type="submit" value="送出修改">
        </div>
    </div>
  </form>
  <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
</body>
</html>