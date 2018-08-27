<%@page import="test.friends.dto.FriendsDto"%>
<%@page import="test.friends.dao.FriendsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//파라미터로 전달되는 수정할 친구의 번호 읽어오기
	int num=Integer.parseInt(request.getParameter("num"));

	//수정할 친구의 정보 불러오기
	FriendsDao dao=FriendsDao.getInstance();	
	FriendsDto dto=dao.getData(num);	
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>friends/updateform.jsp</title>
</head>
<body>
<h3>친구 수정 폼입니다.</h3>
<form action="update.jsp" method="post">
	<input type="hidden" id="num" name="num" value="<%=dto.getNum()%>"/>
	<label for="name">이름</label>
	<input type="text" id="name" name="name" value="<%=dto.getName()%>"/>
	<label for="phone">전화번호</label>
	<input type="text" id="phone" name="phone" value="<%=dto.getPhone()%>"/>
	<label for="addr">주소</label>
	<input type="text" id="addr" name="addr" value="<%=dto.getAddr()%>"/>
	<button type="submit">저장</button>
	<button type="reset">취소</button>
</form>
</body>
</html>