<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// canPopup 이라는 파라미터로 넘어오는 문자열이 있는지 확인한다.
	String canPopup=request.getParameter("canPopup");
	
	//만일 있으면 체크박스가 체크 되어서 폼이 전송된 것이다.
	if(canPopup != null){
		//쿠키를 심는다.
		Cookie cook=new Cookie("canPopup", canPopup);
		cook.setMaxAge(60);//60초
		//cook.setMaxAge(60*60*24);//24 시간
		response.addCookie(cook);
	}
%>
<script>
	//팝업창을 javascript 를 이용해서 닫는다.
	self.close();
</script>
</body>
</html>



















