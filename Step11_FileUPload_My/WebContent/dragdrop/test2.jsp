<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/dragdrop/test2.jsp</title>
<style>
	.box{
		width: 100px;
		height: 100px;
		background-color: yellow;
		border: 1px, solid, red;
		float: left;
	}
	.drop-area{
		clear: both;
		width: 300px;
		height: 300px;
		background-color: pink;
		margin: 0 auto;
	}
</style>
</head>
<body>
<h3>drag and drop 테스트</h3>
<div class="box" draggable="true" id="one">drag me!</div>
<div class="box" draggable="true" id="two">drag me!</div>
<div class="box" draggable="true" id="three">drag me!</div>
<div class="drop-area"></div>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script>
	//드레그가 시작 되었을때 실행할 함수 등록 
	$(".box").on("dragstart", function(e){
		$(this).text("dragging...");
		//이벤트가 일어난 요소의  id 값을 읽어내서
		var id=$(this).attr("id");
		//info 라는 키값으로 이벤트 객체에 담는다.
		e.originalEvent.dataTransfer.setData("info", id);
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
	    //drop 된 요소의 정보 읽어오기
	    var info=e.originalEvent.dataTransfer.getData("info");
		$(this).text(info+" dropped!");
	});
</script>
</body>
</html>
