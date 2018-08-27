<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>test/test01.jsp</title>
</head>
<body>
<%
	//msg라는 파라미터명으로 전달된 내용 추출
	String msg=request.getParameter("msg");
	//콘솔창에 출력
	System.out.println("msg:"+msg);
%>
<p> /test/test01.jsp 경로 요청에 대한 응답입니다.</p>
</body>
</html>