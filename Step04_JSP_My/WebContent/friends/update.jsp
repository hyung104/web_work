<%@page import="test.friends.dao.FriendsDao"%>
<%@page import="test.friends.dto.FriendsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//POST방식으로 전송되었을 때 한글 깨지지 않도록
	request.setCharacterEncoding("utf-8");

	// 폼 전송되는 수정할 친구의 정보를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	String name=request.getParameter("name");
	String phone=request.getParameter("phone");
	String addr=request.getParameter("addr");
	
	//FriendsDto 객체에 담아서
	FriendsDto dto= new FriendsDto();
	dto.setNum(num);
	dto.setName(name);
	dto.setPhone(phone);
	dto.setAddr(addr);
	
	//FriendsDao 객체를 이용해서 DB에 수정반영
	FriendsDao dao=FriendsDao.getInstance();
	boolean isSuccess=dao.update(dto);
	
	//응답하기
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>friends/update.jsp</title>
</head>
<body>
<%
	if(isSuccess){
		out.println("<p>친구 정보가 수정 되었습니다.</p>");
	}else{
		out.println("<p>친구 정보 수정이 실패했습니다.</p>");		
	}
%>
<a href="list.jsp">친구목록보기</a>
</body>
</html>