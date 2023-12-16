<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gamja+Flower&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body style="background-color: black;">
<div style="margin: 35px 135px;">
		<form action="loginprocess" method="post" >
			<table class="table table-bordered" >
				<caption align="top"><b style="color: white;">회원 로그인</b></caption>
				<tr valign="middle">
					<th style="width: 120px;background-color: #ddd; background-image: url('../image/gtaback.webp');">아이디</th>
					<td style="background-image: url('../image/gtaback.webp');">
						<input type="text" name="id" class="form-control"
						required="required" autofocus="autofocus"
						style="width: 150px;"
						placeholder="아이디" value="${sessionScope.saveok==null?"":sessionScope.myid }">
					</td>
				</tr>
				<tr valign="middle">
					<th style="width: 120px;background-color: #ddd; background-image: url('../image/gtaback.webp');" >비밀번호</th>
					<td style="background-image: url('../image/gtaback.webp');">
						<input type="password" name="pass" class="form-control"
						required="required" style="width: 150px;"
						placeholder="비밀번호">
					</td>
				</tr>
				<tr valign="middle">
					<td colspan=2 align="center" style="background-image: url('../image/gtaback.webp');">
						<input type="checkbox" name="cbsave" ${sessionScope.saveok==null?"":"checked" }>아이디저장	
						<button type="submit" class="btn btn-warning">회원로그인</button><br>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
