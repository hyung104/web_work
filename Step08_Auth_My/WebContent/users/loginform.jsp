<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그인 후 이동할 url정보를 읽어온다.
	//request.setCharacterEncoding("utf-8"); <-encodingFilter 사용해서 안해줘도 됨
	String url=request.getParameter("url");
	if(url==null){	//만일 전달되지 않았으면
		//인덱스 페이지로 이동되도록 한다.
		url=request.getContextPath();
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<!-- login == signin -->
<title>/users/loginform.jsp</title>
</head>
<body>
<h3>로그인 폼입니다.</h3>
<form action="login.jsp?url=<%=url%>" method="post">
	<!-- <input type="hidden" name="url" value="<%//=url%>"/>  -->
	<label for="id">아이디</label>
	<input type="text" id="id" name="id"/>
	<label for="pwd">비밀번호</label>
	<input type="password" id="pwd" name="pwd"/>
	<button type="submit">로그인</button>
</form>
</body>
</html>