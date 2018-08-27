<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>/test2/main.jsp</title>
</head>
<body>
<%
	//header.jsp에서 사용할 데이터를 main.jsp 에서 전달하려면
	//String myName="김구라";  <- request 활용하려면 선언하면 안됨. header.jsp에 이중선언되서 실행오류 발생
	//request에 담는다.
	request.setAttribute("myName", "김구라");
%>
<%@include file="header.jsp" %>
<div class="main">
	<h3>메인 컨텐츠 입니다.</h3>
	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempora cumque consequuntur in suscipit rerum quis laudantium ipsum repellat dolorum delectus exercitationem aliquid dicta sequi excepturi adipisci nesciunt accusantium iusto sint.</p>
</div>
</body>
</html>