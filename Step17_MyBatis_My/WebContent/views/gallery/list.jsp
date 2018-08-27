<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/gallery/list.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<div class="container">
<!-- session 영역에  id 가 비어 있지않으면 ( 로그인 된 상태라면) -->
<c:choose>
	<c:when test="${not empty sessionScope.id }">
		<p><strong><a href="${pageContext.request.contextPath }/users/private/info.do">${id }</a></strong> 님 로그인중...</p>
		<a href="${pageContext.request.contextPath }/users/logout.do">로그아웃</a>&nbsp;&nbsp;&nbsp;
	</c:when>
	<c:otherwise>
		<a href="${pageContext.request.contextPath }/users/loginform.do?url=${pageContext.request.contextPath }/gallery/list.do">로그인</a>&nbsp;&nbsp;&nbsp;
	</c:otherwise>
</c:choose>
	<a href="private/upload_form.do">사진 올리기</a>&nbsp;&nbsp;&nbsp;
	<a href="${pageContext.request.contextPath }">Home</a>
	<h3>사진 Gallery 입니다.</h3>
<c:set var="count" value="0" />
<c:forEach var="tmp" items="${list }">
	<c:set var="count" value="${count+1 }" />
	<c:if test="${count mod 3 eq 1 }">
	<div class='row'>
	</c:if>
		<div class="col-xs-4">
			<h4>${tmp.caption}</h4>
			<a href="javascript:viewImage('${tmp.num }');">
				<img src="${pageContext.request.contextPath }/${tmp.imagePath }" title="${tmp.caption}" alt="${tmp.caption}" 
					class="img-responsive img-thumbnail"/></a>
		
				<p>
					작성자:<strong>${tmp.writer }</strong>
				<c:if test="${id eq tmp.writer }">
					<a class="btn btn-xs btn-default" href="javascript:deleteConfirm(${tmp.num });">삭제</a>
				</c:if>	
					<br />
					등록일:<strong>${tmp.regdate }</strong>
				</p>
		</div>
	<c:if test="${count mod 3 eq 0 }">
	</div>
	</c:if>

</c:forEach>
<c:if test="${count mod 3 ne 0 }">
	</div>
</c:if>
	
	<!-- 페이징 처리 -->
	<div class="row">
		<div class="col-xs-12 text-center">
			<ul class = "pagination">
				<c:choose>
					<c:when test="${startPageNum ne 1 }">
						<li><a href="list.do?pageNum=${startPageNum - 1 }">&laquo;</a></li>
					</c:when>
					<c:otherwise>
						<li  class="disabled"><a href="#">&laquo;</a></li>
					</c:otherwise>
				</c:choose>
				<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }" step="1">
					<c:choose>
						<c:when test="${i eq pageNum }">
							<li class="active"><a href="list.do?pageNum=${i }">${i }</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="list.do?pageNum=${i }">${i }</a></li>	
						</c:otherwise>
					</c:choose>
				</c:forEach>
		
				<c:choose>
					<c:when test="${endPageNum lt totalPageCount }">
						<li><a href="list.do?pageNum=${endPageNum + 1 }">&raquo;</a></li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><a href="javascript:">&raquo;</a></li>
					</c:otherwise>
				</c:choose>
			</ul>		
		</div>
	</div>	
</div>
<script>
	//이미지 보여주는 팝업창
	function viewImage(num){
		window.open("viewImage.do?num="+num, "viewimage","width=1100,height=750");
	}

	//삭제 확인을 하는 함수
	function deleteConfirm(num){
		var isDelete=confirm(num+"번 이미지를 삭제하시겠습니까?");
		if(isDelete){
			location.href="private/delete.do?num="+num;
		}
	}	
</script>
</body>
</html>
