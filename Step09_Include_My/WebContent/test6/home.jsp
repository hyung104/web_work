<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>/test5/home.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<%-- 
	navbar.jsp 페이지를 inlcude 하고
	thisPage 라는 파라미터 명으로 home 이라는 파라미터 값을 전달할수도 있다.
	
	- 전달한 파라미터는 navbar.jsp 페이지에서
	request.getParameter("thisPage") 해서 읽어 올수 있다.
	  
--%>
<jsp:include page="navbar.jsp">
	<jsp:param value="home" name="thisPage"/>
</jsp:include>
<div class="container">
	<h1>Home</h1>
	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Praesentium dolores vero quis veniam asperiores sapiente aut ullam ut aliquid deserunt necessitatibus itaque aperiam ratione nam obcaecati provident error rem doloremque.</p>
</div>
</body>
</html>