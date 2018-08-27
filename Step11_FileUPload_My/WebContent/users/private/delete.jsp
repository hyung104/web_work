<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/delete.jsp</title>
</head>
<body>
<%
	//1. 세션에서 아이디를 읽어와서
	String id=(String)session.getAttribute("id");
	//2. DB 에서 삭제하고
	UsersDao.getInstance().delete(id);
	//3. 로그아웃 처리도 하고
	session.invalidate();
	//4. 응답한다. 
%>
<p> <strong><%=id %></strong> 회원님 탈퇴 처리 되었습니다.</p>
<a href="<%=request.getContextPath() %>/">인덱스로 이동</a>
</body>
</html>







