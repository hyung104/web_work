<%@page import="test.gallery.dao.GalleryDao"%>
<%@page import="test.gallery.dto.GalleryDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<GalleryDto> list=GalleryDao.getInstance().getList();
	String id=(String)session.getAttribute("id");
	if(id==null)id="";
	String cPath=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>/gallery/list.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<div class="container">
	<%if(id!=null && !id.equals("")){%>
	<p><strong><%=id %></strong> 로그인중...</p>
	<a href="<%=cPath %>/users/logout.jsp">로그아웃</a><br />
	<%}else{ %>
		<a href="<%=cPath %>/users/loginform.jsp?url=<%=cPath %>/file/list.jsp">로그인</a><br />
	<%} %>
	<a href="private/upload_form.jsp">사진 올리기</a>
	<h3>사진 Gallery 입니다.</h3>
	<hr />
			<%
			int count=0;
			for(GalleryDto tmp:list){
				count++;
				if(count%3==1){
					out.println("<div class='row'>");	
			    } 
			%>
		<div class="col-xs-4">
			<h4><%=tmp.getCaption() %></h4>
			<a href="javascript:viewImage('<%=tmp.getNum() %>');">
				<img src="<%=cPath %>/<%=tmp.getImagePath() %>" title="<%=tmp.getCaption() %>" alt="<%=tmp.getCaption() %>" 
					class="img-responsive img-thumbnail"/></a>
		
				<p>
					작성자:<strong><%=tmp.getWriter() %></strong><br />
					등록일:<strong><%=tmp.getRegdate() %></strong>
				</p>
		</div>
			<%  if(count%3==0){
					out.println("</div>");	
			    }
			}
			if(count%3!=0){
				out.println("</div>");	
			}
		%>
<!-- 	
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>이미지</th>
				<th>설명</th>
				<th>등록일</th>
				<th>삭제</th>
			</tr>	
		</thead>
		<tbody>
			<%for(GalleryDto tmp:list){ %>
			<tr>
				<td><%=tmp.getNum() %></td>
				<td><%=tmp.getWriter() %></td>
				<td><a href="javascript:viewImage('<%=tmp.getNum() %>');"><img src="<%=cPath %>/<%=tmp.getImagePath() %>" width="100px" alt="<%=tmp.getCaption() %>" /></a></td>
				<td><%=tmp.getCaption() %></td>
				<td><%=tmp.getRegdate() %></td>
				<td><%if(id.equals(tmp.getWriter())) {%><a href="javascript:deleteConfirm(<%=tmp.getNum() %>);">삭제</a><%}%></td>
			</tr>
			<%} %>
		</tbody>
	</table>
-->	
</div>
</body>
<script>
	//이미지 보여주는 팝업창
	function viewImage(num){
		window.open("viewImage.jsp?num="+num, "viewimage","width=1100,height=750");
	}
	
	//삭제 확인을 하는 함수
	function deleteConfirm(num){
		var isDelete=confirm(num+"번 이미지를 삭제하시겠습니까?");
		if(isDelete){
			location.href="private/delete.jsp?num="+num;
		}
	}
	
</script>
</html>