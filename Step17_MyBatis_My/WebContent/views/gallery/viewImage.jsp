<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/gallery/viewImage.jsp</title>
</head>
<body>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<div class="container">
<a href="javascript:self.close();">닫기</a><br /><br />
작성자 : ${dto.writer }<br />
설명 : ${dto.caption }<br />
<img src="${pageContext.request.contextPath }/${dto.imagePath }" /><br />
<a href="javascript:self.close();">닫기</a><br />
</body>
</html>