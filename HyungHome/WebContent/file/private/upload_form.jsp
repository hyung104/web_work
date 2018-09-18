<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		[ 파일 업로드 폼 작성법]
				
		1. method="post"
		2. enctype="multipart/form-data"
		3. <input type="file" />
	*/

	//로그인 한 사용자의 아이디
	String id=(String)session.getAttribute("loginId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<title>Hyung's HomePage:자료실</title>
<jsp:include page="../../include_files/incLink.jsp"/>		
</head>
<body>
<!--header-->
<jsp:include page="../../include_files/head.jsp">
	<jsp:param value="file" name="category"/>
</jsp:include>

<!--container-->
<div class="container" style="height:540px;">
<br />
<h3>자료실 업로드 폼 입니다.</h3><br />
<!-- enctype="multipart/form-data"로 넘기면  request.getparameter로 추출이 안됨. => 도와주는 역할 cos.jar  -->
<table>
<form action="upload.jsp" method="post" enctype="multipart/form-data" id="insertForm">
	<tbody>
		<tr hegit="30">
			<th width="70"><label for="title">제목</label></th>
			<td wdith="500"><input type="text" name="title" id="title"/></td>
		</tr>		
		<tr hegit="30">
			<th><label for="myFile">첨부파일</label></th>
			<td><input type="file" name="myFile" id="myFile" class="btn btn-xs"/></td>
		</tr>		
		<tr hegit="30">
			<td colspan="2"><button type="submit" class="btn btn-primary">업로드</button>
				<button type="button" id="cancelBtn" class="btn btn-default ">취소</button>
			</td>
		</tr>		
	</tbody>
</form>
</table>
</div>
<!--footer-->
<jsp:include page="../../include_files/foot.jsp"/>
<jsp:include page="../../include_files/incScript.jsp"/>		
<script>
	$("#cancelBtn").click(function(){
		history.back();	
		
	});
	
	$("#insertForm").ajaxForm(function(responseData){
		if(responseData.isSuccess){
			alert("저장되었습니다.");
			location.href="../list.jsp";
		}else{
			alert("오류가 발생하여 저장되지 않았습니다.");
		}
	});
	
</script>	
</body>
</html>






