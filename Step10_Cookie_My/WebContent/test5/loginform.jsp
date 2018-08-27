<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test5/loginform.jsp</title>
</head>
<body>
<%
	//쿠키에 저장된 아이디를 담을 변수
	String savedId="";
	
	Cookie[] cooks=request.getCookies();
	if(cooks!=null && cooks.length>0){
		for(Cookie tmp:cooks){
			//savedId 라는 쿠키명으로 저장된 값이 있으면
			if(tmp.getName().equals("savedId")){
				//변수에 저장된 아이디값을 담는다. 
				savedId=tmp.getValue();
			}
		}
	}
%>
<h3>로그인 폼입니다.</h3>
<form action="login.jsp" method="post">
	<table>
		<tr>
			<th><label for="id">아이디</label></th>
			<td><input type="text" name="id" id="id" value="<%=savedId%>"/></td>
		</tr>
		<tr>
			<th><label for="pwd">비밀번호</label></th>
			<td><input type="password" name="pwd" id="pwd"/></td>
		</tr>
		<tr>
			<td></td>
			<td>
				<label>
					<input type="checkbox" name="isSave" value="yes"/>
					아이디 저장
				</label>
			</td>
		</tr>
		<tr>
			<td></td>
			<td><button type="submit">로그인</button></td>
		</tr>
	</table>
</form>
</body>
</html>