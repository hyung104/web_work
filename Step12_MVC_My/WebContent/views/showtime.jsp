<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>/views/showtime.jsp</title>
</head>
<body>
<%
	String now=(String)request.getAttribute("now");
%>
<h3>현재시간</h3>
<p>현재시간 : <strong><%=now %></strong></p>
</body>
</html>