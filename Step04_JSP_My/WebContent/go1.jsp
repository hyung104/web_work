<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	System.out.println("/go1.jsp 요청 처리중...");
	// context path 읽어오기
	String cPath=request.getContextPath();
	
	//Redirect 이동 응답 (절대경로)
	response.sendRedirect(cPath+"/test01.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>go1.jsp</title>
</head>
<body>
</body>
</html>