<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>test/test02.jsp</title>
</head>
<body>
<%
	// post방식 전송했을때 한글 깨지지 않도록
	request.setCharacterEncoding("utf-8");

	String name=request.getParameter("name");
	String addr=request.getParameter("addr");
	
	System.out.println(name+"|"+addr);
	
	//요청 방식 읽어오기
	String method=request.getMethod();
%>
<p> /test/test02.jsp 경로 요청에 대한 응답입니다.</p>
<p> 요청방식 : <strong><%=method %></strong></p>
</body>
</html>