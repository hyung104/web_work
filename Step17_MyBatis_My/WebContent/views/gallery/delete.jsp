<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/gallery/upload.jsp</title>
</head>
<body>
<c:choose>
	<c:when test="${isSuccess }">
		<p>이미지 파일을 삭제 했습니다.</p>
	</c:when>
	<c:otherwise>
		<p>이미지 파일 삭제 실패</p>
	</c:otherwise>
</c:choose>
<a href="../list.do">목록보기</a>
</body>
</html>