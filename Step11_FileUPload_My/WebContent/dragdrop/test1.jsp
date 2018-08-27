<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/dragdrop/test1.jsp</title>
<style>
	.box{
		width: 100px;
		height: 100px;
		background-color: yellow;
	}
	.drop-area{
		width: 300px;
		height: 300px;
		background-color: pink;
		margin: 0 auto;
	}
</style>
</head>
<body>
<h3>drag and drop 테스트</h3>
<div class="box" draggable="true">drag me!</div>
<div class="drop-area"></div>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script>
	//드레그가 시작 되었을때 실행할 함수 등록 
	$(".box").on("dragstart", function(e){
		$(this).text("dragging...");
	});
	//드레그가 끝났을때 실행할 함수 등록 
	$(".box").on("dragend", function(e){
		$(this).text("dragend!");
	});
	
	//무언가 드레그 오버 되었을때 실행할 함수 등록 
	$(".drop-area").on("dragover", function(e){
		e.preventDefault();  //기본 이벤트 막기
	    e.stopPropagation(); //이벤트 전파 막기 
	});
	
	//무언가 드랍 되었을때 실행할 함수 등록 
	$(".drop-area").on("drop", function(e){
		e.preventDefault();  
	    e.stopPropagation();
		$(this).text("something dropped!");
	});
</script>
</body>
</html>
