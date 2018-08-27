<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>/ajax/loginform.jsp</title>
<style>
	.result{
		background-color:#000;
		color: #fff;
		border-radius: 10px;
		margin-top: 10px;
		font-weight: bold;
		font-size: 20px;
	}
</style>
</head>
<body>
<%
	String id=(String)session.getAttribute("id");
	if(id!=null&&!id.equals("")){%>
	<p>
		<strong><%=id %></strong> 님 로그인중..
		<a href="logout.jsp">로그아웃</a>
	</p>	
<%  }%>
<h3>jquery 를 활용한 ajax form 전송</h3>
<form action="login.jsp" method="post" id="myForm">
	<label for="id">아이디</label>
	<input type="text" id="id" name="id"/>
	<label for="pwd">비밀번호</label>
	<input type="password" id="pwd" name="pwd"/>
	<button type="submit">로그인</button>
</form>
<div class="result"></div>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script>
	$("#myForm").submit(function(){
		
		// 폼에 이력한 값을 serialize 문자열로 읽어내기
		// id=xxx&pwd=xxx 형식으로 . name=value&name=value 형식
		var param=$(this).serialize();	// this->form
		console.log(param);
		
		// ajax request 를 이용해서 폼에 입력한 내용 서버에 전송
		// ajax 요청에 대한 응답은 함수에 인자로 받아짐.
		$.ajax({
			url: "login.jsp",	//요청 경로
			method:"post",		//요청 메소드
			data: param,		//요청 파라미터
			//responseData - Object(json으로 응답하면), 문자열 올수있음.
			success: function(responseData){	// 응답 데이터가 전달되는 함수 - login.jsp에서 출력되는(응답되는) 문자열이 그대로 들어옴
				console.log(responseData);		
				$(".result").text(responseData);
				//responseData는 object이다
				if(responseData.isSuccess){
					alert("로그인 되었습니다.");
				}else{
					alert("아이디 혹은 비밀번호가 틀려요.");
				}
			},
			error: function(xhr){	// 오류시 - XmlHttpResponse 객체
				colsole.log(xhr);
				$(".result").text(xhr.responseText);
			}
		});
		
		return false;	// 폼 전송 막기(페이지 전환 방지)		
	});
</script>
</body>
</html>