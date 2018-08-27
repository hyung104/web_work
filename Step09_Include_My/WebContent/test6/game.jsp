<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>/test5/game.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<jsp:include page="navbar.jsp">
	<jsp:param value="game" name="thisPage"/>
</jsp:include>
<div class="container">
	<h1>Game</h1>
	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Praesentium dolores vero quis veniam asperiores sapiente aut ullam ut aliquid deserunt necessitatibus itaque aperiam ratione nam obcaecati provident error rem doloremque.</p>
</div>
</body>
</html>