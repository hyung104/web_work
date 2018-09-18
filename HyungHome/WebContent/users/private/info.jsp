<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>/users/private/info.jsp</title>
</head>
<body>
<%
	//1. 세션에 저장된 아이디를 읽어와서
	String id=(String)session.getAttribute("loginId");

	//2. db에서 해당 아이디의 개인정보를 읽어와서
	UsersDto dto=UsersDao.getInstance().getData(id);	
	//3. 응답한다.
%>
<h3>개인 정보 입니다.</h3>
<table>
	<thead>
		<tr>
			<th>항목</th>
			<th>정보</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>아이디</td>
			<td><%=dto.getId() %></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><%=dto.getEmail() %></td>
		</tr>
		<tr>
			<td>가입일</td>
			<td><%=dto.getRegdate() %></td>
		</tr>		
	</tbody>
</table>	
<a href="updateform.jsp">회원정보 수정</a>
<a href="javascript: deleteConfirm();">회원탈퇴</a>
<script>
	function deleteConfirm(){
		var isDelete=confirm("회원 탈퇴 하시겠습니까?");
		
		if(isDelete){
			location.href="delete.jsp";
		}		
	}
</script>
</body>
</html>