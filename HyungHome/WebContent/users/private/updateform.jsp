<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 세션에 저장된 아이디를 읽어낸다.
	String id=(String)session.getAttribute("loginId");

	//2. 아이디를 이용해서 회원정보를 얻어온다.
	UsersDto dto=UsersDao.getInstance().getData(id);
	
	//3. form에 수정할 회원 정보를 출력해서 응답한다..
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<title>Hyung's HomePage:회원정보수정</title>
<jsp:include page="../../include_files/incLink.jsp"/>		
</head>
<body>
<!--header-->
<jsp:include page="../../include_files/head.jsp"/>

<!--container-->
<div class="container" style="height:540px;">
<br />
<h3>회원정보 수정 페이지 입니다.</h3>
<br />
<table>
<form action="update.jsp" method="post" id="updateForm">
	<input type="hidden" name="id" value="<%=id%>"/>
	<tbody>
		<tr height="40">
			<th width="100"><label for="id">아이디</label></th>
			<td width="500"><input type="text" id="id" value="<%=id%>" disabled="disabled"/></td>
		</tr>
		<tr height="40">
			<th><label for="pwd">비밀번호</label></th>
			<td><input type="password" name="pwd" id="pwd"	value="<%=dto.getPwd()%>"/></td>
		</tr>
		<tr height="40">
			<th><label for="pwd2">비밀번호 확인</label></th>
			<td><input type="password" id="pwd2" value="<%=dto.getPwd()%>"/></td>
		</tr>
		<tr height="40">
			<th><label for="email">이메일 주소</label></th>
			<td><input type="text" name="email" id="email"	value="<%=dto.getEmail()%>"/><br/></td>
		</tr>
		<tr height="40">
			<td colspan="2">
				<button class="btn btn-primary" type="submit">수정 확인</button>&nbsp;&nbsp;
				<button class="btn btn-warning" type="button" id="deleteBtn">탈퇴</button>&nbsp;&nbsp;
				<button class="btn btn-default" type="button" id="backBtn">이전화면</button>
			</td>
		</tr>
	</tbody>
</form>
</table>
</div>
<!--footer-->
<jsp:include page="../../include_files/foot.jsp"/>
<jsp:include page="../../include_files/incScript.jsp"/>
</body>
<script>	
	$("#backBtn").click(function(){
		history.back();
	});
	$("#deleteBtn").click(function(){
		var isDelete=confirm("회원 탈퇴 하시겠습니까?");
		if (isDelete) {
			location.href="delete.jsp";
		}		
	});
	//form에 submit 이벤트가 일어 났을 때 실행할 함수 등록
	$("#updateForm").submit(function(){
		//입력한 비밀번호를 읽어와서
		var pwd1=$("#pwd").val();
		var pwd2=$("#pwd2").val();
		
		if(pwd1!=pwd2){	// 두개를 다르게 입력하면
			alert("비밀번호를 확인 하세요.");
			return false;	// 폼 전송 막기
		}
		
		var param=$(this).serialize();
		
		$.ajax({
			url: "update.jsp",	//요청 경로
			method:"post",		//요청 메소드
			data: param,			//요청 파라미터
			success: function(responseData){
				alert('수정완료했습니다.');
				history.back();
			},
			error: function(xhr){	// 오류시 - XmlHttpResponse 객체
				alert('오류가 발생했습니다.\r\n다시 수정해주세요.')
			}
		});
	});	
	
	
</script>
