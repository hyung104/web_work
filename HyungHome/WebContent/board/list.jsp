<%@page import="java.util.List"%>
<%@page import="test.board.dao.BoardDao"%>
<%@page import="test.board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<BoardDto> list=BoardDao.getInstance().getList();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<title>Hyung's HomePage:게시판</title>
<jsp:include page="../include_files/incLink.jsp"/>		
</head>
<body>
<!--header-->
<jsp:include page="../include_files/head.jsp">
	<jsp:param value="board" name="category"/>
</jsp:include>

<!--container-->
<div class="container" style="height:540px;">
<br />
	<a href="private/insertform.jsp" class="btn btn-default btn-xs">새글작성</a>
	<h3>게시글 목록 입니다.</h3>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
		<%for(BoardDto tmp:list){ %>		
			<tr>
				<td><%=tmp.getNum() %></td>
				<td><a href="detail.jsp?num=<%=tmp.getNum() %>"><%=tmp.getTitle() %></a></td>
				<td><%=tmp.getWriter() %></td>
				<td><%=tmp.getRegdate() %></td>
			</tr>
		<%} %>
		</tbody>
	</table>
</div>
<!--footer-->
<jsp:include page="../include_files/foot.jsp"/>
<jsp:include page="../include_files/incScript.jsp"/>		
</body>
</html>