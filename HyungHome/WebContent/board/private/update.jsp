<%@page import="test.board.dao.BoardDao"%>
<%@page import="test.board.dto.BoardDto"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 폼 전송되는 수정할 글 정보를 읽어온다
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
{"isSuccess":<%=isSuccess%>}