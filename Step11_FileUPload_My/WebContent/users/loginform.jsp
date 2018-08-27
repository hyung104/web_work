<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/loginform.jsp</title>
</head>
<body>
<%
	//로그인후 이동할 url 정보를 읽어온다. 
	String url=request.getParameter("url");
	if(url==null){//만일 전달되지 않았으면
		//인덱스 페이지로 이동 되도록 한다. 
		url=request.getContextPath()+"/";
	}
%>
<h3>로그인 폼입니다.</h3>
<form action="login.jsp?url=<%=url %>" method="post">
	<label for="id">아이디</label>
	<input type="text" name="id" id="id"/>
	<label for="pwd">비밀번호</label>
	<input type="password" name="pwd" id="pwd"/>
	<button type="submit">로그인</button>
</form>
</body>
</html>







