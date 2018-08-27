<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>/views/showmember.jsp</title>
</head>
<body>
<%
	MemberDto dto=(MemberDto)request.getAttribute("dto");
%>
<h3>회원 한명의 정보 보기</h3>
<p>번호 : <strong><%=dto.getNum() %></strong></p>
<p>이름 : <strong><%=dto.getName() %></strong></p>
<p>주소 : <strong><%=dto.getAddr() %></strong></p>
<a href="index.jsp">인덱스로 가기</a><br />
<a href="../index.jsp">인덱스로 가기</a>
</body>
</html>