<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		[ 영역[scope) ]  - setAttribute()
				
		1. page 영역(scope): 해당 페이지에서만 사용가능
		2. request 영역  : 응답하기 전까지 사용가능 (forward O, redirect X)
		3. session 영역	: 세션이 유효할때까지 사용가능
		4. application 영역	: 서버 끄기 전까지 사용가능. 서버 전체에서 공유
		
		주로 request, session 사용.
	*/
	
	// page scope 에  "myName" 이라는 키값으로  String type 저장
	pageContext.setAttribute("myName", "김구라");
	// request scope에 "yourName" 이라는 키값으로 String type 저장
	request.setAttribute("yourName", "원숭이");
	// session scope에  "ourName" 이라는 키값으로 String type 저장
	session.setAttribute("ourName", "Acorn");
	//application scope에 "herName" 이라는 키값으로 String type 저장
	application.setAttribute("herName","신민아");
%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>/scope/test01.jsp</title>
</head>
<body>
<p>myName: <strong>${pageScope.myName }</strong></p>
<p>myName: <strong>${myName }</strong></p>
<p>yourName: <strong>${requestScope.yourName}</strong></p>
<p>yourName: <strong>${yourName}</strong></p>
<%
	String ourName=(String)session.getAttribute("ourName");
%>
<p>ourName: <strong><%=ourName %></strong></p>
<p>ourName: <strong>${sessionScope.ourName}</strong></p>
<p>ourName: <strong>${ourName}</strong></p>
<p>herName: <strong>${applicationScope.herName}</strong></p>
<p>herName: <strong>${herName}</strong></p>
</body>
</html>