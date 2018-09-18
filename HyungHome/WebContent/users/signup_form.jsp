<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<title>Hyung's HomePage:회원가입</title>
<jsp:include page="../include_files/incLink.jsp"/>		
</head>
<body>
<!--header-->
<jsp:include page="../include_files/head.jsp"/>

<!--container-->
<div class="container" style="height:540px;">
	<h3>회원 가입 페이지 입니다.</h3>
	<table>
		<thead>
			<tr>
				<th width="100"></th>
				<th width="200"></th>
				<th width="200"></th>
			</tr>
		</thead>
		<tbody>
<form action="signup.jsp" method="post" id="signupForm">
			<tr height="50">
				<td><label for="id">아이디</label></td>
				<td><input type="text" name="id" id="id"/></td>
				<td><span id="checkResult"></span></td>
			</tr>
			<tr height="50">
				<td><label for="pwd">비밀번호</label></td>
				<td colspan="2"><input type="text" name="pwd" id="pwd"/><br/></td>
			</tr>
			<tr height="50">
				<td><label for="email">이메일</label></td>
				<td colspan="2"><input type="text" name="email" id="email"/><br/></td>
			</tr>
			<tr height="50">
				<td colspan="3"><button type="submit" class="btn btn-primary">가입</button></td>
			</tr>			
			
		</tbody>
</form>
	</table>
</div>
<!--footer-->
<jsp:include page="../include_files/foot.jsp"/>
<jsp:include page="../include_files/incScript.jsp"/>
<script>
	//폼의 유효성 여부
	var formValid=false;
	
	$("#signupForm").submit(function(){
		//만일 폼의 유효성 여부가 false 이면 
		if(formValid==false){
			alert("아이디, 비밀번호, 이메일을 입력해주세요");
			return false;//폼 전송 막기
		}
	});
	

	//아이디 입력란에 입력했을때 실행할 함수 등록 
	$("#id").on("input", function(){
		//입력한 아이디를 읽어와서
		var inputId=$(this).val();
		//ajax 요청을 이용해서 서버에 보낸다.
		$.ajax({
			url:"checkid.jsp",
			method:"post",
			data:{"inputId":inputId},
			success:function(responseData){
				//뭐가 응답되는지 콘솔에 출력해 보기 
				console.log(responseData);
				// responseData 는 object 이다.
				// {canUse:true} 또는 {canUse:false}
				if(responseData.canUse){
					formValid=true;
					$("#checkResult")
					.text("사용가능")
					.css("color","#00ff00");
				}else{
					formValid=false;
					$("#checkResult")
					.text("사용불가")
					.css("color","#ff0000");
				}
			}
		});
	});
</script>
</body>
</html>
