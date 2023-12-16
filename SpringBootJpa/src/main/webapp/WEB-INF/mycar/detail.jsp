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
  img.photo{
  	width: 300px;
  	height: 300px;
  	border: 1px solid gray;
  	border-radius: 30px;
  }
  
  div.box{
    width: 50px;
    height: 50px;
    border-radius: 100px;
    border: 1px solid gray;
  }
</style>
</head>
<body>
	<h3 class="alert alert-info">구입 자동차 정보</h3>
	<table style="width: 500px;">
		<tr>
		  <td width="350" rowspan="4">
		  	<img alt="" src="../save/${dto.carphoto }" class="photo">
		  </td>
		  <td>
		    <div class="box" style="background-color: ${dto.carcolor}"> 
		    </div><b>${dto.carcolor }</b>
		  </td>
		</tr>
		<tr>
		  <td><b>자동차명: ${dto.carname }</b></td>
		</tr>
		<tr>
		  <td><b>단가: <fmt:formatNumber value="${dto.carprice }" type="currency"></fmt:formatNumber></b></td>
		</tr>
		<tr>
		  <td><b>구입일: ${dto.carguip }</b></td>
		</tr>
		<tr>
		  <td colspan="2" align="center">
		  <button type="button" class="btn btn-outline-success"
		  onclick="location.href='updateform?num=${dto.num}'">수정</button>
		   <button type="button" class="btn btn-outline-danger"
		  onclick="location.href='delete?num=${dto.num}'">삭제</button>
		   <button type="button" class="btn btn-outline-primary"
		  onclick="location.href='carform'">등록</button>
		   <button type="button" class="btn btn-outline-info"
		  onclick="location.href='carlist'">목록</button>
		  </td>
		</tr>
	</table>
</body>
</html>