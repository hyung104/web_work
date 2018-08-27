<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test1/read_cookie.jsp</title>
</head>
<body>
<%
	// 클라이언트가 요청할때 request 객체에 쿠키가 담겨 있다.
	Cookie[] cooks=request.getCookies();
	
	//읽어온 문자열을 저장할 변수
	String savedMsg=null;
	if(cooks!=null && cooks.length>0){ //쿠키가 존재한다면
		//반복문 돌면서 쿠키 객체를 하나씩 불러와서
		for(Cookie tmp:cooks){
			//savedMsg 라는 이름으로 저장된 쿠키가 있다면 
			if(tmp.getName().equals("savedMsg")){
				//저장된 값을 읽어와서 변수에 담는다. 
				savedMsg=tmp.getValue();
			}
		}
	}
%>
<p> 쿠키로 저장 되었던 문자열 : <strong><%=savedMsg %></strong></p>
</body>
</html>
