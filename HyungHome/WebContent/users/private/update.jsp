<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
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
{"isSuccess":<%=isSuccess%>}