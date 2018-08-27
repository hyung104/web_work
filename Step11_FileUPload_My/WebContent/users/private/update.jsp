<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 파라미터로 전달되는 회원정보 추출
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	String email=request.getParameter("email");
	//2. DB 에 수정반영
	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setEmail(email);
	boolean isSuccess=UsersDao.getInstance().update(dto);
	//3. 응답하기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update.jsp</title>
</head>
<body>
<%if(isSuccess){ %>
	<p> <%=id %> 회원님 정보를 수정했습니다.</p>
	<a href="info.jsp">확인</a>
<%}else{ %>
	<p> 회원 정보 수정 실패!</p>
	<a href="updateform.jsp">다시 작성하기</a>
<%} %>
</body>
</html>










