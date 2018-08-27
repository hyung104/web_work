<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>member_detail.jsp</title>
</head>
<body>
<%
	//request 에 "dto" 라는 키값으로 담긴 MemberDto 객체 얻어오기	
	MemberDto dto=(MemberDto)request.getAttribute("dto");
%>
<h3>회원 한명의 정보 입니다.</h3>
<p>번호 : <strong><%=dto.getNum() %></strong></p>
<p>이름 : <strong><%=dto.getName() %></strong></p>
<p>주소 : <strong><%=dto.getAddr() %></strong></p>
</body>
</html>