<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<FileDto> list=FileDao.getInstance().getList();
	String id=(String)session.getAttribute("loginId");
	if(id==null)id="";
	String cPath=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<title>Hyung's HomePage:자료실</title>
<jsp:include page="../include_files/incLink.jsp"/>		
</head>
<body>
<!--header-->
<jsp:include page="../include_files/head.jsp">
	<jsp:param value="file" name="category"/>
</jsp:include>

<!--container-->
<div class="container" style="height:540px;">
<br />
	<a href="private/upload_form.jsp" class="btn btn-default btn-xs">새글작성</a>
	<h3>자료실 목록 입니다.</h3>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>파일명</th>
				<th>다운로드 횟수</th>
				<th>등록일</th>
				<th>삭제</th>
			</tr>	
		</thead>
		<tbody>
			<%for(FileDto tmp:list){ %>
			<tr>
				<td><%=tmp.getNum() %></td>
				<td><%=tmp.getWriter() %></td>
				<td><%=tmp.getTitle() %></td>
				<td><%=tmp.getOrgFileName() %>
					<a href="download.jsp?num=<%=tmp.getNum()%>"><i class="glyphicon glyphicon-download pull-right"></i></a>
				</td>
				<td><%=tmp.getDownCount() %></td>
				<td><%=tmp.getRegdate() %></td>
				<td><%if(id.equals(tmp.getWriter())) {%><a href="javascript:deleteConfirm(<%=tmp.getNum() %>);">삭제</a><%}
				%></td>
			</tr>
			<%} %>
		</tbody>
	</table>
</div>
<!--footer-->
<jsp:include page="../include_files/foot.jsp"/>
<jsp:include page="../include_files/incScript.jsp"/>		
<script>
	//삭제 확인을 하는 함수
	function deleteConfirm(num){
		var isDelete=confirm(num+"번 자료를 삭제하시겠습니까?");
		if(isDelete){
			location.href="private/delete.jsp?num="+num;
		}
	}
	
</script>
</body>
</html>
