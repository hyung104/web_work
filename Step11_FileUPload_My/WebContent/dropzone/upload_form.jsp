<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>/dropzone/upload_form.jsp</title>
<link rel="stylesheet" href="dropzone.css" />
<script src="dropzone.js"></script>
</head>
<body>
<h3>dropzone js 테스트</h3>
<form action="upload.jsp" method="post" class="dropzone" id="myForm">
	<input type="file" name="myFile"/>
</form>
<script>
	// input.name="file" 인경우 아래  paramName: 넘겨줄 필요 없음.
	//Dropzone.options.폼 아이디={옵선명:옵션값}};
	Dropzone.options.myForm={
		paramName:"myFile",
		success:function(file, responseData){
			
			console.log(responseData);
		}
	};
</script>
</body>
</html>