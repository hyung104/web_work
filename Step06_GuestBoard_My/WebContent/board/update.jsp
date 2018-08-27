<%@page import="test.board.dao.BoardDao"%>
<%@page import="test.board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 폼 전송되는 수정할 글 정보를 읽어온다
	request.setCharacterEncoding("utf-8");
	int num=Integer.parseInt(request.getParameter("num"));
	String writer=request.getParameter("writer");
	String title=request.getParameter("title");
	String content=request.getParameter("content");

	// 2. BoardDao 객체를 이용해서 수정 반영한다.
	BoardDto dto=new BoardDto();
	dto.setNum(num);
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setContent(content);	

	boolean isSuccess=BoardDao.getInstance().update(dto);
	
	// 3. 응답하기
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>/board/update.jsp</title>
</head>
<body>
<%if(isSuccess){%>
	<p><strong><%=num %></strong> 번 글 정보를 수정했습니다.</p>
<%}else{%>
	<p>글 수정 실패</p>
<%}%>
<a href="list.jsp">글 목록 보기</a> 
</body>
</html>