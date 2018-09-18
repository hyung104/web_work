<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<script src="${pageContext.request.contextPath }/resources/js/jquery.form.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/main.js"></script>

<script>
// head.jsp 관련 시작
	$("#loginFormModal").modal({
		backdrop: false,		// backdrop 여부 -  없애면서 단, 페이지 로딩시점에 띄움.
		show:false				// 로딩시점에 modal 띄울지 여부
	});
	
	/*
		Modal에서 발생하는 이벤트 명
		1. "show.bs.modal"
		2. "shown.bs.modal"
		3. "hide.bs.modal"
		4. "hidden.bs.modal"
	*/
	$("#loginFormModal").on("show.bs.modal", function(){
		$("#loginId").val("");		
		$("#loginPwd").val("");	
	});
	$("#loginFormModal").on("shown.bs.modal", function(){
		$("#loginId").focus();	
	});
	
	$("#loginForm").ajaxForm(function(responseData){
		if(responseData.isSuccess){
			alert("로그인 되었습니다.");
			$("#loginFormModal").modal("hide");
			
			// 로그인정보 보여주기
			$("#loginDiv").text("");		
			//$("#loginDiv").text(responseData.id+" 님");
			$("<a>")
				.attr("href", "${pageContext.request.contextPath }/users/private/updateform.jsp")
				.text(responseData.id+" 님")
			 	.appendTo($("#loginDiv"));
			
			$("<button>")
			   .text("로그아웃")
			   .attr("id", "logoutBtn")
			   .addClass("btn")
			   .addClass("btn-xs")
			   .appendTo($("#loginDiv"));
		}else{
			alert("아이디 혹은 비밀번호가 틀려요.");
		}
	});
	
	$(document).on("click", "#logoutBtn", function(){  
		$.ajax({
			url: "<%=request.getContextPath()%>/users/logout.jsp",	//요청 경로
			method:"post",		//요청 메소드
			data: "",			//요청 파라미터
			success: function(responseData){
				// 로그인 버튼 보여주기
				location.href="${pageContext.request.contextPath }/";
				/*
				$("#loginDiv").text("");
				$("<button>")
				   .text("로그인")
				   .attr("data-toggle", "modal")
				   .attr("data-target", "#loginFormModal")
				   .addClass("btn")
				   .addClass("btn-info")
				   .appendTo($("#loginDiv"));
				*/
			},
			error: function(xhr){	// 오류시 - XmlHttpResponse 객체
			}
		});		
	});
	
	// head.jsp 관련 끝
	
</script>	