<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//파라미터로 전달된 쿠키 이름과 쿠키 값을 읽어온다.
	String name=request.getParameter("name");
	String value=request.getParameter("value");
	//쿠키 객체를 생성해서 정보를 담고
	Cookie cook=new Cookie(name, value);
	cook.setMaxAge(60);
	response.addCookie(cook);
	
	//바로 리다이렉트 응답 주고
	response.sendRedirect("cookie_form.jsp");
%>
