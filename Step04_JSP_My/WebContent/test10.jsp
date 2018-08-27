<?xml version="1.0" encoding="UTF-8"?>
<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1번 회원 정보를 db에서 읽어오기
	MemberDto dto=MemberDao.getInstance().getData(1);
%>
<member>
	<num><%=dto.getNum() %></num>
	<name><%=dto.getName() %></name>
	<addr><%=dto.getAddr() %></addr>
</member>