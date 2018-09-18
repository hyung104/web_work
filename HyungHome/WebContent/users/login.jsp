<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// ajax요청 파라미터 추출
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	String isAjax=request.getParameter("isAjax");
	String url=request.getParameter("url");
	if(url==null){	//만일 전달되지 않았으면
		//인덱스 페이지로 이동되도록 한다.
		url=request.getContextPath();
	}
	//유효한 정보인지 확인 
	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);

	boolean isLoginSuccess=UsersDao.getInstance().isValid(dto);
	if(isLoginSuccess){ 
		//로그인 처리 하기
		session.setAttribute("loginId", id);	
	}
	// ajax 요청
	if(isAjax!=null&&isAjax.equals("1")){
%>
{"isSuccess":<%=isLoginSuccess %>,
"id":"<%=id%>"}
<%} else{
	response.sendRedirect(url);
}%>