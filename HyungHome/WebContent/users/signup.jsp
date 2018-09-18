<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 폼전송된 회원 정보를 추출해서
	//request.setCharacterEncoding("utf-8"); <-encodingFilter 사용해서 안해줘도 됨
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	String email=request.getParameter("email");
	// db에 저장하고
	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setEmail(email);
	boolean isSuccess=UsersDao.getInstance().insert(dto);
	// 응답하기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<title>Hyung's HomePage:회원가입 결과</title>
<jsp:include page="../include_files/incLink.jsp"/>		
</head>
<body>
<!--header-->
<jsp:include page="../include_files/head.jsp"/>

<!--container-->
<div class="container" style="height:450px;">
<h3>회원 가입 요청 결과 페이지</h3>
<br />
<%if(isSuccess) {%>
	<p><strong><%=id %></strong> 회원님 가입되었습니다.</p>
	<a href="loginform.jsp">로그인 하기 </a>
<%}else{ %>
	<p>가입실패</p>
	<a href="signup_form.jsp">다시 가입하러 가기</a>
<%} %>
</div>
<!--footer-->
<jsp:include page="../include_files/foot.jsp"/>
<jsp:include page="../include_files/incScript.jsp"/>		
</div>
</body>
</html>