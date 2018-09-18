<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그인 후 이동할 url정보를 읽어온다.
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
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<title>Hyung's HomePage:로그인</title>
<jsp:include page="../include_files/incLink.jsp"/>		
</head>
<body>
<!--header-->
<jsp:include page="../include_files/head.jsp"/>

<!--container-->
<div class="container" style="height:540px;">
	<h5>로그인 정보를 입력해주세요.</h5>
	<br /><br />
	<form action="login.jsp?url=<%=url%>" method="post">
		<input type="hidden" name="isAjax" value="0"/>
		<!-- <input type="hidden" name="url" value="<%//=url%>"/>  -->
		<label for="id">아이디</label>
		<input type="text" id="id" name="id"/>
		<label for="pwd">비밀번호</label>
		<input type="password" id="pwd" name="pwd"/>
		<button type="submit">로그인</button>
	</form>
	<br /><br />
</div>
<!--footer-->
<jsp:include page="../include_files/foot.jsp"/>
<jsp:include page="../include_files/incScript.jsp"/>
</body>
<script>
	$("#id").focus();
</script>
</html>