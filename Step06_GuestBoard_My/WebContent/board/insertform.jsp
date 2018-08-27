<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>/board/insertform.jsp</title>
</head>
<body>
<h3>새글 작성 폼 입니다.</h3>
<form action="insert.jsp" method="post">
	<label for="writer">작성자</label>
	<input type="text" id="writer" name="writer"/><br />
	<label for="title">제목</label>
	<input type="text" id="title" name="title" /><br />
	<label for="content">내용</label><br />
	<textarea name="content" id="content" cols="30" rows="10"></textarea>
	<br />	
	<button type="submit">작성 완료</button>
</form>
</body>
</html>