<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
<%
	String id=(String)session.getAttribute("id");
%>
<%if(id!=null) {%>
	<p><strong><%=id %></strong>님 로그인중...</p>
	<a href="users/logout.jsp">로그아웃</a>
<%}else { %>
	<a href="users/loginform.jsp">로그인</a>
<%} %>
<h3>인덱스 페이지 입니다.</h3>
<ul>
	<li><a href="users/signup_form.jsp">회원가입</a></li>
	<li><a href="file/list.jsp">자료실</a></li>
	<li><a href="gallery/list.jsp">사진 갤러리</a></li>
	<li><a href="ajax/loginform.jsp">ajax 로그인</a></li>
	<li><a href="ajax2/loginform.jsp">ajax 로그인2</a></li>
	<li><a href="ajax3/upload_form.jsp">ajax 파일 업로드</a></li>
	<li><a href="dragdrop/test1.jsp">drag 테스트1</a></li>
	<li><a href="dropzone/upload_form.jsp">drop zone 테스트</a></li>
	<!-- <li><a href="ajax4/upload_form.jsp">drag drop 파일 업로드</a></li> -->
</ul>
</body>
</html>