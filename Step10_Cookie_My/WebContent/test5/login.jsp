<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test5/login.jsp</title>
</head>
<body>
<%
	//폼 전송 파라미터를 읽어온다.
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	//아이디 저장 여부(체크 하지 않았으면 null 이다.)
	String isSave=request.getParameter("isSave");
	
	//아이디 비밀번호가 유효한 정보인지 확인하고
	//유효한 정보이고 isSave 가 null 이 아니면 
	//아이디를 쿠키를 응답해서 저장한다.
	
	if(isSave != null){
		// savedId 라는 쿠키이름으로 id 저장하기 
		Cookie cook=new Cookie("savedId", id);
		cook.setMaxAge(60);
		response.addCookie(cook);
	}
%>
<p> <strong><%=id %></strong> 님 로그인 되었습니다.</p>
<a href="../index.jsp">확인</a>
</body>
</html>










