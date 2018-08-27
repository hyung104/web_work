<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//1. 파라미터로 전달되는 회원정보 추출
	//request.setCharacterEncoding("utf-8"); <-encodingFilter 사용해서 안해줘도 됨
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	String email=request.getParameter("email");
	
	//2.db에 수정반영
	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setEmail(email);
	boolean isSuccess=UsersDao.getInstance().update(dto);	
	//3.응답하기
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>/users/private/update.jsp</title>
</head>
<body>
<%if(isSuccess) {%>
	<p><%=id %> 회원님의 정보를 수정했습니다.</p>
	<a href="info.jsp">확인</a>
<%}else { %>
	<p>회원 정보 수정 실패</p>
	<a href="updateform.jsp">다시 수정하기</a>

<%} %>
</body>
</html>