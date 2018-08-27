<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>/test2/cookie_form.jsp</title>
</head>
<body>
<form action="save.jsp" method="post">
	<label for="name">쿠키 이름</label>
	<input type="text" id="name" name="name"/>
	<br />
	<label for="value">쿠키 값</label>
	<input type="text" id="value" name="value" />
	<br />
	<button type="submit">저장</button>
</form>
<h3>저장된 쿠키 목록 입니다.</h3>
<table>
	<thead>
		<tr>
			<th>쿠키 이름</th>
			<th>쿠키 값</th>
		</tr>
	</thead>
	<tbody>
	<%
	Cookie[] cooks=request.getCookies();
	if(cooks!=null && cooks.length>0){
		for(Cookie tmp:cooks){
	%>
		<tr>
			<td><%=tmp.getName() %></td>
			<td><%=tmp.getValue() %></td>
		</tr>
	<%			
		}
	}
	%>
	</tbody>
</table>	

</body>
</html>