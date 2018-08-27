<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/cafe/detail.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<style>
	.content{
		width: 766px;
		border: 1px solid #888888;
		box-shadow: 10px 10px 5px #888888;
	}
	.content img{
		max-width: 100%;
	}
	/* 댓글에 댓글을 다는 폼은 일단 숨겨 놓기 */
	.comment form{
		display: none;
	}
	
	.comment{
		position: relative;
	}
	
	/* 댓글의 댓글 이미지 배치*/
	.comment .reply_icon{
		width: 8px;
		height: 8px;
		position: absolute;
		top: 0px;
		left: -10px;
	}
	
	.muted{
		color: #888;
	}	
	.container .row{
		height: 30px;
	}
	
	.content-ta {
		display: inline-block;
	 	width: 90%;
	}
</style>

</head>
<body>
<div class="container">
	<h3>글 자세히 보기 페이지</h3>
	<br />
	<div class="row">
		<div class="col-xs-1">글번호</div>
		<div class="col-xs-11">${dto.num }</div>
	</div>
	<div class="row">
		<div class="col-xs-1">작성자</div>
		<div class="col-xs-11">${dto.writer }</div>
	</div>
	<div class="row">
		<div class="col-xs-1">제목</div>
		<div class="col-xs-11">${dto.title }</div>
	</div>
	<div class="row">
		<div class="col-xs-1">글조회수</div>
		<div class="col-xs-11">${dto.viewCount }</div>
	</div>
	<div class="content">${dto.content }</div><br />
	<c:if test="${sessionScope.id eq dto.writer }">
	<div class="row">
		<div class="col-xs-12">
			<a class="btn btn-primary" href="private/updateform.do?num=${dto.num }">수정</a> &nbsp;
			<a class="btn btn-primary" href="javascript: deleteConfirm()">삭제</a>
			<script>
				function deleteConfirm(){
					var isDelete=confirm("글을 삭제 하시겠습니까?");
					if(isDelete){
						location.href="private/delete.do?num=${dto.num }";
					}
					
				}
			</script>
		</div>	
	</div>
	<br />
	</c:if>		
	<div class="row">
		<div class="col-xs-6 text-left">
			<c:if test="${dto.prevNum ne 0 }">
				<a class="btn btn-default btn-xs" href="detail.do?num=${dto.prevNum }&condition=${condition}&keyword=${keyword}">이전글</a>
			</c:if>
			<c:if test="${dto.nextNum ne 0 }">
				<a class="btn btn-default btn-xs" href="detail.do?num=${dto.nextNum }&condition=${condition}&keyword=${keyword}">다음글</a>
			</c:if>
		</div>
		<div class="col-xs-6 text-right">
			<a class="btn btn-default btn-xs" href="list.do?condition=${condition}&keyword=${keyword}">목록 보기</a>
		</div>
	</div>
	
	<!-- 댓글에 관련된 UI -->
	<div class="comments">
	<hr />
		<c:forEach var="tmp" items="${commentList }">
			<div class="comment" <c:if test="${tmp.num ne tmp.comment_group }">style="margin-left:50px;"</c:if> >
			<c:if test="${tmp.num ne tmp.comment_group }">
				<img class="reply_icon" src="${pageContext.request.contextPath }/resources/images/re.gif" />
			</c:if>
				<img src="${pageContext.request.contextPath }/resources/images/user_image.gif" />
				<span>${tmp.writer }</span>
				<span>${tmp.regdate }</span>
				<a href="javascript:" class="reply_link">답글</a>|
				<a href="">신고</a>	
				
				<c:if test="${tmp.num ne tmp.comment_group }">
					<br />
					<strong class="muted">${tmp.target_id }</strong>
				</c:if>
									
				<pre>${tmp.content }</pre>	
				<form action="comment_insert.do" method="post">
					<!-- 덧글 작성자 -->
					<input type="hidden" name="writer" value="${id }"/>
					<!-- 덧글 그룹 -->
					<input type="hidden" name="ref_group" value="${dto.num }" />
					<!-- 덧글 대상 -->
					<input type="hidden" name="target_id" value="${tmp.writer }" />
					<input type="hidden" name="comment_group" value="${tmp.comment_group }" />
					
					<textarea name="content" class="form-control content-ta"></textarea>
					<button type="submit" class="btn btn-default">등록</button>					
				</form>
			</div>
		</c:forEach>
		
		<hr />	
		<!-- 원글에 댓글을 작성할 수 있는 폼 -->
		<div class="comment_form">
			<form action="comment_insert.do" method="post">
				<input type="hidden" name="writer" value="${id }" />
				<input type="hidden" name="ref_group" value="${dto.num }"/>
				<input type="hidden" name="target_id" value="${dto.writer }"/>				
				<textarea name="content" class="form-control content-ta" placeholder="로그인 하셔야 댓글에 글을 쓸 수 있습니다."></textarea>
				<button type="submit" class="btn btn-default">등록</button>
			</form>
		</div>
	</div>
</div>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script>
	//로그인 여부
	var isLogin=${isLogin};
	
	//댓글 전송 이벤트가 일어 났을 때 실행할 함수 등록
	$(".comment_form > form , .comment form").submit(function(){
		if(!isLogin){	// 로그인 하지 않았으면
			var isGoLogin=confirm("로그인이 필요 합니다.");
			if(isGoLogin){
				//로그인 페이지로 이동하기		
				location.href="${pageContext.request.contextPath }" + "/users/loginform.do"
				+ "?url=${pageContext.request.contextPath }/cafe/detail.do?num=${dto.num }";
			}		
			return false;
		}		
	});
	
	//답글 링크를 눌렀을때 실행할 함수 등록
	$(".comment .reply_link").click(function(){
		if($(this).text()=="답글"){
			$(this).text("취소");
		} else{
			$(this).text("답글");
		}
		
		$(this).parent().find("form").slideToggle(200);		
	});
</script>
</body>
</html>