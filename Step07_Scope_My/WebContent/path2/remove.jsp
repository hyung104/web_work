<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>/path2/remove.jsp</title>
</head>
<body>
<%
	//세션에서 "myName" 이라는 키값으로 저장된 정보 삭제
	//session.removeAttribute("myName");
	//세션에 저장된 모든 정보 삭제
	session.invalidate();
%>
<p>세션에 저장된 정보를 삭제했습니다.</p>
<a href="result.jsp">이전 페이지로 이동</a>
</body>
</html>