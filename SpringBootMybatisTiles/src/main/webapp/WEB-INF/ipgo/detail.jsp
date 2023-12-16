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
</head>
<body>
<div style="margin: 100px 100px; text-align: center;">
<h2 class="alert alert-danger" style="width: 400px;">
<b>디테일페이지</b>
<br>
<br>
 <c:forTokens var="pho" items="${dto.photoname }" delims=","> <!-- 대표사진 0번지 사진만 나오게 -->
	<img src="../upload/${pho}" style="width: 150px; height: 150px;">
 </c:forTokens>
</h2>
</div>
</body>
</html>