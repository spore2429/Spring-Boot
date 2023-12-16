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
<body style="background-color: black;">
<div class="alert alert-danger" style="width: 500px; margin-left: 8%;">
<c:if test="${totalcount==0 }">
  <h1 align="center"><b>등록된 정보가 없습니다</b></h1>
</c:if>
<c:if test="${totalcount>0 }">
  <h1 align="center"><b>총 ${totalcount }개의 정보가있습니다</b></h1>
</c:if>


<table class="table table-dark">
	<caption align="top"><span style="float: right;">
		<button type="button" class="btn btn-outline-dark"
		onclick="location.href='ipgoform'"><b>상품추가</b></button>
	</span></caption>
	
	<c:forEach var="dto" items="${list }">
	  <tr valign="middle" align="center">
	    <td width="200" rowspan="4" style="text-align: center;">
	    	<c:if test="${dto.photoname!='no'}">
	    	 <c:forTokens var="pho" items="${dto.photoname }" delims="," begin="0" end="0"> <!-- 대표사진 0번지 사진만 나오게 -->
		      <a href="content?num=${dto.num }"><img src="../upload/${pho}" style="width: 150px; height: 150px;"></a>
		    </c:forTokens>
	    	</c:if>
	    	<c:if test="${dto.photoname=='no' }">
	    	  <img src="../image/no.png" style="width: 150px; height: 150px;">
	    	</c:if>
		</td>
		<td>
		  <b>상품명: ${dto.sangpum }</b>
		</td>
	  </tr>
	  <tr valign="middle" align="center">
	    <td>
	      <b>단가: <fmt:formatNumber value="${dto.price }" type="currency"/></b>
	    </td>
	  </tr>
	  <tr valign="middle" align="center">
	    <td>
	      <b>입고일: <fmt:formatDate value="${dto.ipgoday }" pattern="yyyy년 MM월 dd일"/></b>
	    </td>
	  </tr>
	  <tr valign="middle" align="center">
	    <td>
	      <button type="button" class="btn btn-outline-warning"
	      onclick="location.href='uform?num=${dto.num}'"><b>수정</b></button>
	      <button type="button" class="btn btn-outline-danger"
	      onclick="location.href='delete?num=${dto.num}'"><b>삭제</b></button>
	    </td>
	  </tr>
	</c:forEach>
</table>
</div>
</body>
</html>