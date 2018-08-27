<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>index.jsp</title>
</head>
<body>
<h3>MVC 패턴 인덱스 페이지 입니다.</h3>
<c:if test="${not empty id }">
	<p><strong><a href="users/private/info.do">${id }</a></strong> 님 로그인중...</p>
	<a href="users/logout.do">로그아웃</a>
</c:if>
<ul>
	<li><a href="users/signup_form.do">회원가입</a></li>
	<li><a href="users/loginform.do?url=${pageContext.request.contextPath }/home.do">로그인</a></li>
	<li><a href="market/buy.jsp">상품 구입</a></li>
	<li><a href="market/buy2.jsp">상품 구입2</a></li>
	<li><a href="market/buy3.jsp">상품 구입3</a></li>
</ul>
</body>
</html>