<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//세션 로그인 아이디
	String loginId=(String)session.getAttribute("loginId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<title>Hyung's HomePage:게시판 새글작성</title>
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
<h3>게시글 작성 폼 입니다.</h3><br />
<table>
	<tbody>
<form action="insert.jsp" method="post" id="insertForm">
	<input type="hidden" name="writer" value="<%=loginId%>"/>
		<tr>
			<th width="60"><label for="writer">작성자</label></th>
			<td width="400"><input type="text" id="writer" value="<%=loginId%>" disabled /></td>
		</tr>
		<tr>
			<th><label for="title">제목</label></th>
			<td><input type="text" id="title" name="title" /></td>
		</tr>
		<tr>
			<th><label for="content">내용</label></th>
			<td><textarea name="content" id="content" cols="30" rows="10"></textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="submit" class="btn btn-primary">작성 완료</button>
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
		history.back();	
		
	});
	
	$("#insertForm").ajaxForm(function(responseData){
		if(responseData.isSuccess){
			alert("저장되었습니다.");
			location.href="../list.jsp";
		}else{
			alert("오류가 발생하여 저장되지 않았습니다.");
		}
	});
	
</script>		
</body>
</html>