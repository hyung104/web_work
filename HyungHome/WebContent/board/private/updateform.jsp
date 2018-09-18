<%@page import="test.board.dao.BoardDao"%>
<%@page import="test.board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 수정할 글 번호를 읽어온다
	int num=Integer.parseInt(request.getParameter("num"));
	// 2. BoardDao를 이용해서 수정할 글정보를 얻어온다.
	BoardDto dto=BoardDao.getInstance().getData(num);
	// 3. 글 수정 폼을 응답한다.
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<title>Hyung's HomePage:게시판 수정</title>
<jsp:include page="../../include_files/incLink.jsp"/>		
</head>
<body>
<!--header-->
<jsp:include page="../../include_files/head.jsp">
	<jsp:param value="board" name="category"/>
</jsp:include>

<!--container-->
<div class="container" style="height:540px;">
<br />
<h3>게시판글 수정 폼 입니다.</h3>
<table>
	<tbody>
<form action="update.jsp" method="post" id="updateForm">
	<input type="hidden" name="num" value="<%=dto.getNum()%>"/>
	<input type="hidden" name="writer" value="<%=dto.getWriter()%>"/>
		<tr>
			<th width="60"><label for="num">글번호</label></th>
			<td width="400"><input type="text" id=""num"" value="<%=dto.getNum()%>" disabled /></td>
		</tr>
		<tr>
			<th><label for="writer">작성자</label></th>
			<td><input type="text" id="writer" value="<%=dto.getWriter()%>" disabled /></td>
		</tr>
		<tr>
			<th><label for="title">제목</label></th>
			<td><input type="text" id="title" name="title" value="<%=dto.getTitle()%>"/></td>
		</tr>
		<tr>
			<th><label for="content">내용</label></th>
			<td><textarea name="content" id="content" cols="30" rows="10"><%=dto.getContent()%></textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="submit" class="btn btn-primary">수정확인</button>
				<button type="button" id="cancelBtn" class="btn btn-default ">취소</button>	
				
			</td>
		</tr>
</form>		
	</tbody>
</table>
</div>
<!--footer-->
<jsp:include page="../../include_files/foot.jsp"/>
<jsp:include page="../../include_files/incScript.jsp"/>
<script>
	$("#cancelBtn").click(function(){
		location.href="../list.jsp";
	});
	
	$("#updateForm").ajaxForm(function(responseData){
		if(responseData.isSuccess){
			alert("저장되었습니다.");
			location.href="../detail.jsp?num=<%=num%>";
		}else{
			alert("오류가 발생하여 저장되지 않았습니다.");
		}
	});
	
</script>		
</body>
</html>