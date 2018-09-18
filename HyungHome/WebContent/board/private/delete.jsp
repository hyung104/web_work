<%@page import="test.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 파라미터로 전달되는 삭제할 글번호를 읽어온다
	int num=Integer.parseInt(request.getParameter("num"));
	//2. BoardDao를 이용해서 해당글을 삭제한다.
	boolean isSuccess=BoardDao.getInstance().delete(num);
	//3. 응답하기
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<title>Hyung's HomePage:게시판  삭제</title>
<jsp:include page="../../include_files/incLink.jsp"/>		
</head>
<body>
<!--header-->
<jsp:include page="../../include_files/head.jsp">
	<jsp:param value="board" name="category"/>
</jsp:include>
<jsp:include page="../../include_files/foot.jsp"/>
<jsp:include page="../../include_files/incScript.jsp"/>		

<%if(isSuccess){%>
	<script>	
		alert("<%=num %> 번 글이 삭제 되었습니다.");
		location.href="../list.jsp";
	</script>
<%}else{%>
	<script>	
		alert("삭제 실패!");
		location.href="../list.jsp";
	</script>
<%}%>
</body>
</html>