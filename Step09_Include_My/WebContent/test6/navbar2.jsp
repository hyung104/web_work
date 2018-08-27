<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// request 에 "thisPage" 라는 키값으로 담긴 문자열을 읽어온다.
	String thisPage=(String)request.getAttribute("thisPage");
%>
<div class="navbar navbar-inverse">
	<div class="navbar-header">
		<ul class="nav navbar-nav">
			<li <%if(thisPage.equals("home")){ %> class="active" <%} %>><a href="home.jsp">Home</a></li>
			<li <%if(thisPage.equals("game")){ %> class="active" <%} %>><a href="game.jsp">Game</a></li>
			<li <%if(thisPage.equals("contact")){ %> class="active" <%} %>><a href="contact.jsp">Contact</a></li>
		</ul>
	</div>
</div>