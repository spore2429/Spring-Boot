<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gaegu:wght@300&family=Nanum+Pen+Script&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
div.mainimg{
	width: 600px;
	height: 300px;
}

</style>
</head>
<body style="background-color: black;">
<c:set var="root" value="<%=request.getContextPath() %>"/>
<div align="center" class="mainimg">
<img alt="" src="${root }/image/gta2.webp" style="width: 600px; height: 200px;"><br><br>
<img alt="" src="${root }/image/gta3.webp" style="width: 600px; height: 200px;"><br><br>
<img alt="" src="${root }/image/gta4.jpg" style="width: 600px; height: 200px;"><br><br>
</div>
<h2 style="color: white;">Main Page 입니다</h2>

</body>
</html>