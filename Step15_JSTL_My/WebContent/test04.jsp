<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>test04.jsp</title>
</head>
<body>
<%--
	page 영역에 값 저장히기
	
	pageContext.setAttribute();

 --%>
<c:set var="num" value="1"/>
<c:set var="name" value="김구라"/>
<c:set var="addr" value="노량진"/>

<p>번호: <strong>${pageScope.num }</strong></p>
<p>이름: <strong>${name }</strong></p>
<p>주소: <strong>${addr }</strong></p>

<p>번호: <strong><c:out value="${num2 }" default="0"/></strong></p>
<p>이름: <strong><c:out value="${name2 }" default="아무개"/></strong></p>


<%
	// 테스트를 위해  request에 문자열 담아 놓기
	request.setAttribute("markup", "<a href=''>링크1</a>");
	request.setAttribute("markup2", "&lt;a href=''&gt;링크2&lt;/a&gt;");
%>

<p>${markup }</p>
<!-- escapeXml="true" 생략해도 됨. -->
<p><code><c:out value="${markup }" escapeXml="true"/></code></p>
<p>${markup2 }</p>

</body>
</html>