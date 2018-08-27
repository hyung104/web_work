<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>test02.jsp</title>
</head>
<body>
<h3>JSTL it 문</h3>
<c:if test="true">
	<p>출력이 되요</p>
</c:if>
<c:if test="false">
	<p>출력이 안되요</p>
</c:if>
<c:if test="${10 gt 2 }">
	<p>10은 2보다 커요</p>
</c:if>
<c:if test="${2 lt 10 }">
	<p>2는 10보다 작아요</p>
</c:if>
<%request.setAttribute("num", 10); %>
<c:if test="${num gt 2 }">
	<p>${num }는 2보다 커요</p>
</c:if>
<%session.setAttribute("id", "gura"); %>
<c:if test="${not empty id }">	<!-- sessionScope.id -->
	<p>${id } 님 로그인중...</p>
</c:if>

<c:choose>
	<c:when test="${not empty id }">
		<p>${id } 님 로그인중..2.</p>
	</c:when>
	<c:otherwise>
	<a href="loginform.jsp">로그인</a>
	</c:otherwise>
</c:choose>

</body>
</html>