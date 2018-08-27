<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"   pageEncoding="UTF-8"%>
<%
	//1번 회원 정보를 db에서 읽어오기
	MemberDto dto=MemberDao.getInstance().getData(1);
%>
{
"num":<%=dto.getNum() %>,
"name":"<%=dto.getName() %>",
"addr":"<%=dto.getAddr() %>"
}