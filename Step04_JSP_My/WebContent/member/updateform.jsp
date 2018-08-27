<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//파라미터로 전달되는 수정할 회원의 번호 읽어오기
	int num=Integer.parseInt(request.getParameter("num"));

	//수정할 회원의 정보 불러오기
	MemberDao dao=MemberDao.getInstance();	
	MemberDto dto=dao.getData(num);	
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>member/updateform.jsp</title>
</head>
<body>
<h3>회원 수정 폼입니다.</h3>
<form action="update.jsp" method="post">
	<input type="hidden" id="num" name="num" value="<%=dto.getNum()%>"/>
	<label for="name">이름</label>
	<input type="text" id="name" name="name" value="<%=dto.getName()%>"/>
	<label for="addr">주소</label>
	<input type="text" id="addr" name="addr" value="<%=dto.getAddr()%>"/>
	<button type="submit">저장</button>
	<button type="reset">취소</button>
</form>
</body>
</html>