<%@page import="test.gallery.dao.GalleryDao"%>
<%@page import="test.gallery.dto.GalleryDto"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//삭제할 파일 번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	String gubun=request.getParameter("gubun");

	// 파일 시스템에서 삭제하기 위해서는 저장된 파일명을 알아야한다.	
	GalleryDto dto=GalleryDao.getInstance().getData(num);
	
	String imagePath=dto.getImagePath();
	
	// 세션의 아이디와 삭제할 글의 작성자와 같은지 한번 더 확인
	String id=(String)session.getAttribute("id");
	
	if(!(id.equals(dto.getWriter()))){
		//금지된 요청이라고 에러를 응답한다.
		/*
			response.sendError(에러코드, "에러메세지");
		*/
		//response.sendError(HttpServletResponse.SC_FORBIDDEN);
		response.sendError(HttpServletResponse.SC_FORBIDDEN, "본인의 이미지가 아닙니다.");
		return;
	}
	//1. db에서 파일 정보 삭제
	GalleryDao.getInstance().delete(num);
	
	//2. WebContent/upload 폴더에서 실제 파일 삭제
	
	// 삭제할 파일의 전체 경로 구성
	String path=application.getRealPath(imagePath);
	System.out.println(path);
	//file 객체를 생성해서 삭제
	new File(path).delete();
	
	//응답하기
	String cPath=request.getContextPath();
	//response.sendRedirect(cPath+"/gallery/list.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>/gallery/private/delete.jsp</title>
</head>
<body>
<p>파일을 삭제했습니다.</p>
<%if(gubun==null||!gubun.equals("1")) {%>
<a href="<%=cPath%>/gallery/list.jsp">확인</a>
<%}else{ %>
<a href="javascript: opener.location.reload(); window.close();">확인</a>
<%} %>
</body>
</html>