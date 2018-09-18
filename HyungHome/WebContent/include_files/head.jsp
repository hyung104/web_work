<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String loginId=(String)session.getAttribute("loginId");
	System.out.println(loginId);
	String category=request.getParameter("category");
	String active1="", active2="";
	if(category!=null&&category.equals("board")){
		active1=" cool-link-active";
	}
	if(category!=null&&category.equals("file")){
		active2=" cool-link-active";
	}
%>
<!--TO TOP-->
<a href="javascript:" id="return-to-top"> <span>TO TOP <i class="fas fa-long-arrow-alt-up"></i> </span></a>

<header id="header1">
	<div id="hwraper">

		<h1 id="logo">
		<a href="${pageContext.request.contextPath }/"><img src="${pageContext.request.contextPath }/resources/images/Hlogo.png" alt="logo"></a>
		</h1>
		<ul id="hnavi">
			<li><a href="${pageContext.request.contextPath }/board/list.jsp" class="cool-link<%=active1%>">게시판</a></li>
			<li><a href="${pageContext.request.contextPath }/file/list.jsp" class="cool-link<%=active2%>">자료실</a></li>
		</ul>
		<!-- 
		<div class="search" >				
			<span class="searchbox">	
		    <input type="search" placeholder="Search..." />
			</span>
			<i class="fa fa-search" style="font-size:1.7em; color:Tomato"></i>				
		</div>
		 -->
		<div id="loginDiv">
<%if(loginId==null||loginId.equals("")){ %>      
			<button id="loginBtn" class="btn btn-info" data-toggle="modal" data-target="#loginFormModal" >로그인</button>
<%}else{ %>
		<a href="${pageContext.request.contextPath }/users/private/updateform.jsp"><%=loginId %>님</a>
		<button id="logoutBtn" class="btn btn-xs">로그아웃</button>
<%} %>        
		</div>

	</div>
</header>

<div class="modal fade" id="loginFormModal">
	<!-- modal-lg  | default(생략시) | modal-sm -->	
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span>&times;</span><span class="sr-only">모달 닫기</span></button>
        <h4 class="modal-title">로그인</h4>
      </div>
      <div class="modal-body">
      	<table>
      		<thead>
      			<tr>
      				<th width="200"></th>
      				<th width="300"></th>
      			</tr>
      		</thead>
      		<tbody>
<form action="${pageContext.request.contextPath }/users/login.jsp" method="post" id="loginForm">      
	<input type="hidden" name="isAjax" value="1"/>		
      			<tr>
      				<td><label for="id">아이디</label></td>
      				<td><input type="text" id="loginId" name="id"/></td>
      			</tr>
      			<tr>
      				<td><label for="pwd">비밀번호</label></td>
      				<td><input type="password" id="loginPwd" name="pwd"/></td>
      			</tr>
      		</tbody>
      	</table>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary">로그인</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        <br />
        <hr />
        <a class="logon1" href="${pageContext.request.contextPath }/users/signup_form.jsp">회원가입</a>
      </div>
</form>      			      
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
