<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test1/save.jsp</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	//폼 전송되는 문자열 읽어오기	
	String msg=request.getParameter("msg");
	
	//1. 쿠키 객체 생성 new Cookie("key", value);
	Cookie cook=new Cookie("savedMsg", msg);
	//2. 최대 유지시간(초단위)
	cook.setMaxAge(60); //60초
	//3. response 객체에 담으면 - base64 encoding  - 64가지 문자만 저장할 수 있음.  한글 안됨.
	response.addCookie(cook);
	
	//응답할때 응답되는 웹브라우져에 자동 저장된다. 
%>
<p> 당신의 웹브라우져에 쿠키를 저장 했습니다.</p>
<a href="read_cookie.jsp">저장된 쿠키 읽어와 보기</a>
</body>
</html>
