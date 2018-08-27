<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/cafe/detail.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<style>
	.content{
		border: 1px solid #888888;
		box-shadow: 5px 5px 5px #888888;
	}
	.content img{
		max-width: 100%;
	}
	.comment{
		position: relative;
	}
	/* 댓글에 댓글을 다는 폼은 일단 숨겨 놓기 */
	.comment form{
		display: none;
	}
	.comments ul {
		padding: 0;
		margin: 0;
		list-style-type: none;		
	}
	.comments ul li{
		border-top: 1px solid #888;
	}
	.comments dt{
		margin-top: 5px;
	}
	.comments dd{
		margin-left: 26px;
	}
	/* 댓글의 댓글 이미지 배치*/
	.comment .reply_icon{
		width: 8px;
		height: 8px;
		position: absolute;
		top: 10px;
		left: 30px;
	}
	.muted{
		color: #888;
	}
	.container .row{
		height: 30px;
	}
	.comments form textarea, .comments form button{
		float: left;
	}
	.comments li{
		clear: left;
	}
	
	.comments li pre{
		background-color:#fff;
		border: 0px;
	}
	.comments form textarea{
		width: 500px;
		height: 100px;
	}
	.comments form button{
		height: 100px;
	}
	.comment_form{
		clear: both;
		border-top: 1px solid #888;
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
		<ul>
			<c:forEach var="tmp" items="${commentList }">
				<li class="comment" <c:if test="${tmp.num ne tmp.comment_group }">style="padding-left:50px;"</c:if> >
					<c:if test="${tmp.num ne tmp.comment_group }">
						<img class="reply_icon" src="${pageContext.request.contextPath }/resources/images/re.gif"/>
					</c:if>	
				
				<c:choose>
					<c:when test="${empty tmp.deldate }">
					<dl>
						<dt>
							<img src="${pageContext.request.contextPath }/resources/images/user_image.gif"/>
							<span>${tmp.writer }</span>
							<span>${tmp.regdate }</span>&nbsp;&nbsp;
							<c:if test="${id eq tmp.writer }">
								<a href="javascript:deleteConfirm2(${tmp.num });">삭제</a> |
							</c:if>
							<a href="javascript:" class="reply_link">답글</a> |
							<a href="javascript: recommend(${tmp.num });">추천</a> 
							<c:if test="${tmp.recommendCnt gt 0}">
								&nbsp;&nbsp;추천: ${tmp.recommendCnt }회
							</c:if>														
						</dt>
						<dd>
							<c:if test="${tmp.num ne tmp.comment_group }">
								<i class="muted">${tmp.target_id }</i>
								<br/>
							</c:if>
							<pre>${tmp.content }</pre>
						</dd>
					</dl>
					<form action="comment_insert.do" method="post">
						<!-- 덧글 작성자 -->
						<input type="hidden" name="writer" value="${id }"/>
						<!-- 덧글 그룹 -->
						<input type="hidden" name="ref_group" value="${dto.num }" />
						<!-- 덧글 대상 -->
						<input type="hidden" name="target_id" value="${tmp.writer }" />
						<input type="hidden" name="comment_group" value="${tmp.comment_group }" />
						<textarea name="content"></textarea>
						<button type="submit">등록</button>
					</form>		
						</c:when>
					<c:otherwise>
						<span>삭제된 댓글입니다.</span>
					</c:otherwise>			
				</c:choose>
				</li>
			</c:forEach>
		</ul>
		
		<!-- 원글에 댓글을 작성할수 있는 폼 -->
		<div class="comment_form">
			<form action="comment_insert.do" method="post">
				<input type="hidden" name="writer" 
					value="${id }" />
				<input type="hidden" name="ref_group" 
					value="${dto.num }"/>
				<input type="hidden" name="target_id" 
					value="${dto.writer }"/>
				<textarea name="content"></textarea>
				<button type="submit">등록</button>
			</form>
		</div>
	</div>					
</div>

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script>
	//로그인 했는지 여부
	var isLogin=${isLogin};
	
	//댓글 전송 이벤트가 일어 났을때 실행할 함수 등록
	$(".comment_form > form, .comment form").submit(function(){
		if(!isLogin){//로그인 하지 않았으면
			var isGoLogin=confirm("로그인이 필요 합니다.");
			if(isGoLogin){
				//로그인 페이지로 이동하기
				location.href="${pageContext.request.contextPath}"+
					"/users/loginform.do"+
					"?url=${pageContext.request.contextPath}"+
					"/cafe/detail.do?num=${dto.num}";
			}
			return false;//폼 전송 막기 
		}
	});
	
	// 답글 링크를 눌렀을때 실행할 함수 등록 
	$(".comment .reply_link").click(function(){
		if($(this).text()=="답글"){
			$(this).text("취소");
		} else{
			$(this).text("답글");
		}

		$(this).parent().parent().parent().find("form").slideToggle(200);	
	});

	// 추천 링크를 눌렀을때 실행할 함수 등록 
	function recommend(num){
		if(!isLogin){//로그인 하지 않았으면
			var isGoLogin=confirm("로그인이 필요 합니다.");
			if(isGoLogin){
				//로그인 페이지로 이동하기
				location.href="${pageContext.request.contextPath}"+
					"/users/loginform.do"+
					"?url=${pageContext.request.contextPath}"+
					"/cafe/detail.do?num=${dto.num}";
			}
			return;
		}	
		
		$.ajax({
			url:"isValidRecommend.do",
			method:"post",
			data:{"num":num},
			success:function(responseData){
				if(responseData.isValid){
					$.ajax({
						url:"recommend.do",
						method:"post",
						data:{"num":num},
						success:function(responseData){
							if(responseData.isSuccess){
								alert("추천했습니다.");
							}				
						}
					});
					
				}else{
					alert("이미 추천하셨습니다.");
				}
			}
		});
	}
	function deleteConfirm2(num){
		var isDelete=confirm("댓글을 삭제 하시겠습니까?");
		if(isDelete){
			location.href="private/commentDelete.do?ref_group=${dto.num}&condition=${condition}&keyword=${keyword}&num="+num;
		}		
	}						
</script>
</body>
</html>
