<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 파라미터로 전달되는 아이디 읽어오기
	String inputId=request.getParameter("inputId");
	//2. DB 에서 사용가능한 아이디인지 확인 한다.
	boolean canUse=UsersDao.getInstance().canUseId(inputId);
	//3. 가능한지 여부를 적당한 문자열 형식으로 응답한다.
	// html or json or xml or 자기만의 형식
	// 가급적 json 형식으로 응답하는게 좋다.
%>
{"canUse":<%=canUse %>}