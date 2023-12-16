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
  .box{
    width: 40px;
    height: 40px;
    border: 1px solid gray;
    border-radius: 100px;
  }
</style>
</head>
<body>
	<div style="margin: 50px 100px;">
	
	<img alt="" src="../Statikk2.jpg" style="width: 150px; height: 150px;">
      <button type="button" class="btn btn-info"
      onclick="location.href='carform'">자동차정보입력</button>
      <br><br>
      <h3 class="alert alert-info">
        <b>총${totalcount }개의 자동차 정보가 있습니다</b>
      </h3>
      <table class="table table-bordered" style="width: 900px;">
        <tr align="center" valign="middle">
          <th width="100">번호</th>
          <th width="100">사진</th>
          <th width="200">자동차명</th>
          <th width="100">색상</th>
          <th width="160">가격</th>
          <th width="220">구입일</th>
          <th width="220">등록일</th>
          <th width="200">편집</th>
        </tr>
      	<tr>
     	  <c:forEach var="dto" items="${list }" varStatus="i">
     	    <tr valign="middle">
     	      <td align="center"><b>${i.count }</b></td>
     	      <td>
     	      <a href="detail?num=${dto.num }"><img alt="" src="../save/${dto.carphoto }" width="100" height="100" border="1" hspace="10"></a>
     	      </td>
     	      <td align="center"><b>${dto.carname }</b></td>
     	      <td align="center"><div style="background-color: ${dto.carcolor }" class="box"></div></td>
     	      <td align="center"><b><fmt:formatNumber value="${dto.carprice  }" type="currency"></fmt:formatNumber></b></td>
     	      <td align="center"><b>${dto.carguip }</b></td>
     	      <td align="center"><b><fmt:formatDate value="${dto.guipday }" pattern="yyyy-MM-dd HH:mm"/></b></td>
     	   	  <td align="center">
     	   	  <button type="button" class="btn btn-success btn-sm"
     	   	  onclick="location.href='updateform?num=${dto.num}'">수정</button>
     	   	  <button type="button" class="btn btn-danger btn-sm"
     	   	  onclick="location.href='delete?num=${dto.num}'">삭제</button>
     	   	  </td>
     	    </tr>
     	  </c:forEach>
      	</tr>
      </table>
    </div>
</body>
</html>