<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/table.css" />
<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script> -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>Event01</title>

</head>
<body>

	<hr />
	<input type="button" value="check" id="buttonToggle" />
	<br />
	<input type="checkbox" id="Toggle" />Toggle All
	<br />
	<input type="checkbox" value="a1" name="a" />A1
	<input type="checkbox" value="a2" name="a" />A2
	<input type="checkbox" value="a3" name="a" />A3
	<input type="checkbox" value="a4" name="a" />A4
	<input type="checkbox" value="a5" name="a" />A5
	<input type="checkbox" value="a6" name="a" />A6
	<input type="button" value="get checked" id="buttonGet" />
	<hr />

	<script>
		$(function() {
			$('#datePicker').datepicker({});
		});

		$('#Toggle').change(function() {
			//切換所有checkbox的勾選狀態        	
			//         	 console.log($(this).attr('checked'));
			//         	 console.log($(this).prop('checked'));
			var b = $(this).prop('checked');
			$(':checkbox[name="a"]').prop('checked', b);
		});

		$('#buttonToggle').click(function() {
			//切換各自checkbox的勾選狀態
			$(':checkbox[name="a"]').each(function() {
				var b = !$(this).prop('checked')
				$(this).prop('checked', b)
			});
		});

		$('#buttonGet').click(function() {
			//讀出所有被勾選checkbox的值
			var items = [];
			// 			$(':checked[name="a"]').each(function() {
			$(':checked[name="eventType"]').each(function() {
				items.push($(this).val());
			});
			alert(items);
		});
	</script>

	<input type="text" name="datePicker" id="datePicker">



	<form action="<c:url value="/EventPage/Event01.controller" />" method="get">
		<table>
			<tr>
				<td><input type="submit" name="searchEvent" value="尋找活動">
					<input type="checkbox" name="eventType" value="表演">表演 <input
					type="checkbox" name="eventType" value="展覽">展覽 <input
					type="checkbox" name="eventType" value="音樂">音樂 <select
					name="manyType">
						<option value=""></option>
						<option value="表演">表演</option>
						<option value="展覽">展覽</option>
						<option value="音樂">音樂</option>
				</select></td>
			</tr>
		</table>
	</form>

<!-- 	method(String aaa,String id) if("aaa".equal(aaa)){ service.select(id) } -->

<!-- 	<form action="xxx.do" id="form"> -->
<!-- 		<input type="text" name="aaa" value="aaa" style="display: none"> -->
<!-- 		<input type="text" name="id" value="" style="display: none"> -->
<!-- 	</form> -->

<!--	<script>
		$(this).on('click', function() {
			$("#id").value = "";
			$("#form").submit();
		})
	</script>  -->

	<c:if test="${not empty select}">
		<table>
			<thead>
				<tr>
					<th>LogoImageFile</th>
					<th>EventType</th>
					<th>EventName</th>
					<th>地區</th>
					<th>IsCharge</th>
					<th>活動時間</th>
					<th>ShowGroupName</th>
					<th>BriefIntroduction</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bean" items="${select}">
					<tr>
						<td><a href="<c:url value="/EventPage/EventSelf.jsp"/>"><img
								src="${bean.logoimageFile}"></a></td>
						<td>${bean.eventTypeId}</td>
						<td><a href="<c:url value="/EventPage/EventSelf.jsp"/>">${bean.eventName}</a></td>
						<td>${bean.areaId}</td>
						<td>${bean.isCharge}</td>
						<td>${bean.dtStart}~${bean.durationEnd}</td>
						<td>${bean.showGroupName}</td>
						<td>${bean.briefIntroduction}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>

</body>
</html>