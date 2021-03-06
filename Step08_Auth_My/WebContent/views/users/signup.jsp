<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>/users/signup.jsp</title>
</head>
<body>
<h3>회원 가입 요청 결과 페이지</h3>
<c:choose>
	<c:when test="${isSuccess }">
		<p><strong>${param.id }</strong> 님 가입 되었습니다.</p>
		<a href="loginform.do">로그인 하기 </a>
	</c:when>
	<c:otherwise>
		<p>가입실패</p>
	<a href="signup_form.do">다시 가입하러 가기</a>	
	</c:otherwise> 
</c:choose>
</body>
</html>