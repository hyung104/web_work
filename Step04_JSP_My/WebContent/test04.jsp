<%@page import="java.util.ArrayList"%>
<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>test04.jsp</title>
</head>
<body>
<%
	List<MemberDto> members=new ArrayList<>();
	members.add(new MemberDto(1, "김구라", "노량진"));
	members.add(new MemberDto(2, "해골", "행신동"));
	members.add(new MemberDto(3, "원숭이", "상도동"));
%>
<h3>회원 목록 입니다.</h3>
<table>
	<thead>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>주소</th>
		</tr>
	</thead>
	<tbody>
<% for(MemberDto tmp:members){%>	
		<tr>
			<td><%=tmp.getNum() %></td>
			<td><%=tmp.getName() %></td>
			<td><%=tmp.getAddr() %></td>
		</tr>		
<%} %>		
	</tbody>	
</table>
</body>
</html>