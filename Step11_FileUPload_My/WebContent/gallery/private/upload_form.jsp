<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>/gallery/private/upload_form.jsp</title>
</head>
<body>
<h3>사진 업로드폼</h3>
<a href="../list.jsp">사진 갤러리 목록</a><br /><br />
<form action="upload.jsp" method="post" enctype="multipart/form-data">
	<label for="caption">설명</label>
	<input type="text" name="caption" id="caption"/><br/>
	<label for="image">이미지</label>
	<input type="file" name="image" id="image" /><br/>
	<button type="submit">업로드</button>
</form>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script>
	$("#image").on("change", function(){
		//console.log("===" + $("#image").val());
		var fileName=$("#image").val();
		fileName = fileName.slice(fileName.indexOf(".") + 1).toLowerCase();
		if(fileName != "jpg" && fileName != "png" &&  fileName != "gif" &&  fileName != "bmp"){
			alert("이미지 파일은 (jpg, png, gif, bmp) 형식만 등록 가능합니다.");
			$("#image").val("");
			return;
		}
	});
</script>
</body>
</html>