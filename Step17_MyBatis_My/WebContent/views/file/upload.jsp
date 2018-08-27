<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/file/upload.jsp</title>
</head>
<body>
<c:choose>
	<c:when test="${isSuccess }">
		<p>파일을 업로드 했습니다.</p>
	</c:when>
	<c:otherwise>
		<p>파일 업로드 실패</p>
	</c:otherwise>
</c:choose>
<a href="../list.do">목록보기</a>
</body>
</html>