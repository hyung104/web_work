<%@page import="test.gallery.dao.GalleryDao"%>
<%@page import="test.gallery.dto.GalleryDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num=Integer.parseInt(request.getParameter("num"));
	String id=(String)session.getAttribute("id");
	if(id==null)id="";
	String cPath=request.getContextPath();
	GalleryDto dto=GalleryDao.getInstance().getData(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>/gallery/viewImage.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<div class="container">
<a href="javascript:self.close();">닫기</a><br /><br />
작성자 : <%=dto.getWriter() %><br />
설명 : <%=dto.getCaption() %> <br />
<%if(id.equals(dto.getWriter())) {%><a href="javascript:deleteConfirm(<%=dto.getNum() %>);">삭제</a><%}%><br />
<img src="<%=cPath %>/<%=dto.getImagePath() %>" /><br />
<a href="javascript:self.close();">닫기</a><br />
</div>
<script>
	//삭제 확인을 하는 함수
	function deleteConfirm(num){
		var isDelete=confirm(num+"번 이미지를 삭제하시겠습니까?");
		if(isDelete){
			location.href="private/delete.jsp?gubun=1&num="+num;
		}
	}	
</script>
</body>
</html>