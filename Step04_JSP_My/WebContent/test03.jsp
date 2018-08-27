<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>test03.jsp</title>
</head>
<body>
<%
	List<String> list=new ArrayList<>();
	list.add("김구라");
	list.add("해골");
	list.add("원숭이");
	list.add("주뎅이");
	list.add("덩어리");
%>
<h3>친구 목록 입니다.</h3>
<ul>
	<li><%=list.get(0) %></li>
	<li><%=list.get(1) %></li>
	<li><%=list.get(2) %></li>
	<li><%=list.get(3) %></li>
	<li><%=list.get(4) %></li>
</ul>
<h3>친구 목록 입니다.</h3>
<ul>
	<%for(int i=0; i<list.size(); i++){ %>
	<li><%=list.get(i) %></li>
	<%} %>
</ul>
<h3>친구 목록 입니다.</h3>
<ul>
	<%for(String tmp:list){ %>
	<li><%=tmp %></li>
	<%} %>
</ul>
</body>
</html>