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

<div style="margin: 50px 100px">
<button type="button" class="btn btn-info"
onclick="location.href='writeform'">글쓰기</button>
</div>
<div style="margin: 50px 100px;">
      <br><br>
      <h3 class="alert alert-info">
        <c:if test="${totalcount==0 }">
    		<b>저장된 상품정보가 없습니다</b>
		</c:if>
		<c:if test="${totalcount>0 }">
    		<b>총${totalcount }개의 상품정보가 있습니다</b>
        </c:if>
      </h3>
      <table class="table table-bordered" style="width: 900px;">
        <tr align="center" valign="middle">
          <th width="100">번호</th>
          <th width="200">상품명</th>
          <th width="160">가격</th>
          <th width="220">등록일</th>
          <th width="200">편집</th>
        </tr>
      	<tr>
     	  <c:forEach var="dto" items="${list }" varStatus="i">
     	    <tr valign="middle">
     	      <td align="center"><b>${i.count }</b></td>
     	      <td align="center">
     	      <c:if test="${dto.photoname!=null }">
     	      <img alt="" src="../save/${dto.photoname }" width="80" height="80" border="1" hspace="10">
     	      </c:if>
     	      <c:if test="${dto.photoname==null }">
     	      <img alt="" src="../save/noimg.jpg" width="80" height="80" border="1" hspace="10">
     	      </c:if>
     	      <b>${dto.sang }</b>
     	      </td>
     	      <td align="center"><b><fmt:formatNumber value="${dto.price  }" type="currency"></fmt:formatNumber></b></td>
     	      <td align="center"><b><fmt:formatDate value="${dto.ipgoday }" pattern="yyyy-MM-dd HH:mm"/></b></td>
     	   	  <td align="center">
     	   	  <button type="button" class="btn btn-success btn-sm"
     	   	  onclick="location.href='uform?num=${dto.num}'">수정</button>
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