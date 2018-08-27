<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>/views/users/info.jsp</title>
</head>
<body>
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
			<td>${dto.id }</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>${dto.email }</td>
		</tr>
		<tr>
			<td>가입일</td>
			<td>${dto.regdate }</td>
		</tr>		
	</tbody>
</table>	
<a href="updateform.do">회원정보 수정</a>
<a href="javascript: deleteConfirm();">회원탈퇴</a>
<script>
	function deleteConfirm(){
		var isDelete=confirm("회원 탈퇴 하시겠습니까?");
		
		if(isDelete){
			location.href="delete.do";
		}		
	}
</script>
</body>
</html>