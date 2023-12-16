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
<body style="background-color: black;">
<div style="margin-top: 50px; margin-left: 50px;">
	<h3 class="alert alert-danger" style="width: 600px;" align="center">영화 정보</h3>
	<table style="width: 600px;">
		<tr>
		  <td width="350" rowspan="4">
		  	<img alt="" src="../moviephoto/${dto.mv_poster }" class="photo">
		  </td>
		</tr>
		<tr>
		  <td><b style="color: white;">제목: ${dto.mv_title }</b></td>
		</tr>
		<tr>
		  <td><b style="color: white;">감독: ${dto.mv_director }</b></td>
		</tr>
		<tr>
		  <td><b style="color: white;">개봉일: ${dto.mv_opendate }</b></td>
		</tr>
		<tr>
		  <td colspan="2" align="center">
		  <br>
		  <button type="button" class="btn btn-success"
		  onclick="location.href='uform?num=${dto.mv_num}'">수정</button>
		   <button type="button" class="btn btn-danger"
		  onclick="location.href='delete?num=${dto.mv_num}'">삭제</button>
		   <button type="button" class="btn btn-primary"
		  onclick="location.href='writeform'">등록</button>
		   <button type="button" class="btn btn-info"
		  onclick="location.href='list'">목록</button>
		  </td>
		</tr>
	</table>
</div>
</body>
</html>