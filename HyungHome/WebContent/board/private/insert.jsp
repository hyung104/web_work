<%@page import="test.board.dto.BoardDto"%>
<%@page import="test.board.dao.BoardDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 폼 전송되는 내용을 추출해서
	String writer=request.getParameter("writer");
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	
	//2. DB에 저장하고
	BoardDto dto=new BoardDto();
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setContent(content);	
	BoardDao dao=BoardDao.getInstance();
	boolean isSuccess=dao.insert(dto);
	
	//3. 응답하기
%>
{"isSuccess":<%=isSuccess%>}