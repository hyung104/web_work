<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>/test1/cookie_form.jsp</title>
</head>
<body>
<form action="save.jsp" method="post">
	<label for="msg">쿠키에 저장할 문자열 입력</label>
	<input type="text" id="msg" name="msg"/>
	<button type="submit">저장</button>
</form>
</body>
</html>