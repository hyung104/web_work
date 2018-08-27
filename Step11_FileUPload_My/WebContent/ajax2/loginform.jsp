<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>/ajax2/loginform.jsp</title>
<style>
	.result{
		background-color:#000;
		color: #fff;
		border-radius: 10px;
		margin-top: 10px;
		font-weight: bold;
		font-size: 20px;
	}
</style>
</head>
<body>
<%
	String id=(String)session.getAttribute("id");
	if(id!=null&&!id.equals("")){%>
	<p>
		<strong><%=id %></strong> 님 로그인중..
		<a href="logout.jsp">로그아웃</a>
	</p>	
<%  }%>
<h3>jquery 를 활용한 ajax form 전송</h3>
<form action="login.jsp" method="post" id="myForm">
	<label for="id">아이디</label>
	<input type="text" id="id" name="id"/>
	<label for="pwd">비밀번호</label>
	<input type="password" id="pwd" name="pwd"/>
	<button type="submit">로그인</button>
</form>
<div class="result"></div>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery.form.min.js"></script>
<script>
	$("#myForm").ajaxForm(function(responseData){
		console.log(responseData);
		if(responseData.isSuccess){
			alert("로그인 되었습니다.");
		}else{
			alert("아이디 혹은 비밀번호가 틀려요.");
		}
	});
</script>
</body>
</html>