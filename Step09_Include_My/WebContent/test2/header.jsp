<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- 부분 markup -->
<div class="header">
	<h3>header 입니다.</h3>
 <%
 	//아래 줄을 안하면 코딩 오류는 나지만, 실행 오류는 안남. main.jsp에 선언되어 있고 include 되므로
	//문제는 가독성  => request를 활용함.
 	String myName=(String)request.getAttribute("myName");
 %>	
	<p>내이름은 : <%=myName %></p>
</div>