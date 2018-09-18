<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 세션에서 아이디를 읽어와서
	String id=(String)session.getAttribute("loginId");
	//2. db에서 삭제하고
	boolean isSuccess=UsersDao.getInstance().delete(id);	
	//3. 로그아웃 처리하고
	session.invalidate();	
	//4. 응답한다.
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<title>Hyung's HomePage:게시판  삭제</title>
<jsp:include page="../../include_files/incLink.jsp"/>		
</head>
<body>
<!--header-->
<jsp:include page="../../include_files/head.jsp">
	<jsp:param value="board" name="category"/>
</jsp:include>
<jsp:include page="../../include_files/foot.jsp"/>
<jsp:include page="../../include_files/incScript.jsp"/>		

<%if(isSuccess){%>
	<script>	
		alert("<%=id %> 님 탈퇴 처리 되었습니다.");
		location.href="${pageContext.request.contextPath }/";
	</script>
<%}else{%>
	<script>	
		alert("삭제 실패!");
		history.back();
	</script>
<%}%>
</body>
</html>