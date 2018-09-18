<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<title>Hyung's HomePage</title>
<jsp:include page="include_files/incLink.jsp"/>		
</head>
<body>
<!--header-->
<jsp:include page="include_files/head.jsp"/>

<!--container-->
<div class="container" style="height:540px;">
<div id="enter" class="mainDiv">Welcome !!!</div>
</div>
<!--footer-->
<jsp:include page="include_files/foot.jsp"/>
<jsp:include page="include_files/incScript.jsp"/>
<script>
	$("#enter").addClass("mainAni");
</script>
</body>
</html>