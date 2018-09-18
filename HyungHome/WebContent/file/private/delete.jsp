<%@page import="java.io.File"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="test.file.dao.FileDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//삭제할 파일 번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));

	// 파일 시스템에서 삭제하기 위해서는 저장된 파일명을 알아야한다.
	FileDto dto=FileDao.getInstance().getData(num);
	
	String saveFileName=dto.getSaveFileName();
	
	// 세션의 아이디와 삭제할 글의 작성자와 같은지 한번 더 확인
	String id=(String)session.getAttribute("loginId");
	
	if(!(id.equals(dto.getWriter()))){
		//금지된 요청이라고 에러를 응답한다.
		/*
			response.sendError(에러코드, "에러메세지");
		*/
		//response.sendError(HttpServletResponse.SC_FORBIDDEN);
		response.sendError(HttpServletResponse.SC_FORBIDDEN, "본인의 파일이 아닙니다.");
		return;
	}
	//1. db에서 파일 정보 삭제
	boolean isSuccess=FileDao.getInstance().delete(num);
	
	//2. WebContent/upload 폴더에서 실제 파일 삭제
	
	// 삭제할 파일의 전체 경로 구성
	String path=application.getRealPath("/upload") + File.separator+saveFileName;
	
	//file 객체를 생성해서 삭제
	new File(path).delete();
	
	//응답하기
	String cPath=request.getContextPath();
	//response.sendRedirect(cPath+"/file/list.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<title>Hyung's HomePage:자료실  삭제</title>
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
		alert("<%=num %> 번 자료가 삭제 되었습니다.");
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