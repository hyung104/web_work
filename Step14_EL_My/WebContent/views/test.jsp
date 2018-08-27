<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>views/test.jsp</title>
</head>
<body>
<h3>EL로 요청 parameter 추출</h3>
<p>num : <strong><%=request.getParameter("num") %></strong></p>
<p>num : <strong>${param.num }</strong></p>
<p>name : <strong>${param.name }</strong></p>
</body>
</html>