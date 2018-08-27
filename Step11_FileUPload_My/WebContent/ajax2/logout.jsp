<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션 초기화
	session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>/ajax2/logout.jsp</title>
</head>
<body>
<p>로그아웃 되었습니다.</p>
<a href="loginform.jsp">로그인 폼</a>
</body>
</html>