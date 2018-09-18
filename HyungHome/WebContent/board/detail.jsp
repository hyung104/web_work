<%@page import="test.board.dto.BoardDto"%>
<%@page import="test.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
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
<div class="container">
<%
	//	/board/detail.jsp?num=x
	
	// 자세히 보여줘야 될 글 번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	// BoardDao를 이용해서 글 하나의 정보 불러오기.
	BoardDto dto=BoardDao.getInstance().getData(num);
	
	//세션 로그인 아이디
	String loginId=(String)session.getAttribute("loginId");
	if(loginId==null)loginId="";
	
%>
<br />
<table class="table table-bordered">
	<tr>
		<th width="100">글번호</th>
		<td><%=dto.getNum() %></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td><%=dto.getWriter() %></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><%=dto.getTitle() %></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea cols="30" rows="10" disabled><%=dto.getContent() %></textarea></td>
	</tr>	
	<tr>
		<th>등록일</th>
		<td><%=dto.getRegdate() %></td>
	</tr>
</table>
<%if(loginId.equals(dto.getWriter())) {%>
<a class="btn btn-default btn-xs" href="private/updateform.jsp?num=<%=dto.getNum()%>">수정</a>
<a class="btn btn-default btn-xs" href="javascript: deleteCheck();">삭제</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%}%>
<a class="btn btn-default btn-xs" href="list.jsp">목록</a><br /><br />
<br />
</div>
<jsp:include page="../include_files/foot.jsp"/>
<jsp:include page="../include_files/incScript.jsp"/>		
<script>
	function deleteCheck(){
		var isDelete=confirm("글을 삭제 하시겠습니까?");
		if (isDelete) {
			location.href="private/delete.jsp?num=<%=dto.getNum()%>";
		}
	}
</script>
</body>
</html>