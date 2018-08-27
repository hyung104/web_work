<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String uploadDir="/upload";
	String realPath=application.getRealPath(uploadDir);
	int sizeLimit=1024*1024*50; //50 Mbyte
	MultipartRequest mr=new MultipartRequest(request,
			realPath,
			sizeLimit,
			"utf-8",
			new DefaultFileRenamePolicy());
	//파일 시스템에 저장된 파일명 
	String saveFileName=mr.getFilesystemName("image");
	String cPath=request.getContextPath();
	String imagePath=cPath+"/upload/"+saveFileName;
		
%>
{"imagePath":"<%=imagePath %>"}