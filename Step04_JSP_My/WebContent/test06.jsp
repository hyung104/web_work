<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>test06.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<% 
	//context path (컨텍스트 경로)
	String cPath=request.getContextPath();
%>
<p> context path : <strong><%=cPath %></strong></p>
<p> context path : <strong><%=request.getContextPath() %></strong></p>
<p> context path : <strong>${pageContext.request.contextPath }</strong></p>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
</body>
</html>
