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

<div style="margin: 10px 10px;">
<table class="table table-dark" style="width: 600px;">
<caption align="top"><b style="color: white;">회원전용 게시판</b>
<span style="float: right;">
  <button type="button" class="btn btn-outline btn-info"
  onclick="location.href='form'">글쓰기</button>
</span>
</caption>
<tr align="center">
  <th width="60">번호</th>
  <th width="150">제목</th>
  <th width="220">작성자</th>
  <th width="250">작성일</th>
  <th width="100">조회수</th>
</tr>

  <c:if test="${totalCount==0 }">
	<h2 class="alert alert-info">회원정보가 없습니다</h2>
  </c:if>
  
<c:if test="${totalCount>0 }">
	<h2 class="alert alert-info">총 ${totalCount }명의 회원정보가 있습니다</h2>
	 <br><br>
  
<c:forEach var="dto" items="${list }">
    <tr>
      <td align="center">${no }</td>
    	<c:set var="no" value="${no-1 }"/> <!-- 출력후 감소 -->
      
	  <td align="center"><a href="content?num=${dto.num }&currentPage=${currentPage}"><b>${dto.subject }</b></a></td> 
	  <td align="center"><b>${dto.name }(${dto.myid })</b></td> 
      <td align="center"><fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/></td>
      <td align="center">${dto.readcount }</td>
    </tr>
  </c:forEach>
</c:if>
</table>

     <!-- 페이지번호 출력 -->
     <c:if test="${totalCount>0 }">
        <div style="width: 800px; text-align: center;">
           <ul class="pagination justify-content-center">
              <!-- 이전 -->
              <c:if test="${startPage>1 }">
                 <li class="page-item"><a href="list?currentPage=${startPage-1 }"></a></li>
              </c:if>
              <c:forEach var="pp" begin="${startPage }" end="${endPage }">
                 <c:if test="${currentPage==pp }">
                    <li class="page-item active">
                         <a class="page-link" href="list?currentPage=${pp }">${pp }</a>
                    </li>
                 </c:if>
                 <c:if test="${currentPage!=pp }">
                    <li class="page-item">
                         <a class="page-link" href="list?currentPage=${pp }">${pp }</a>
                    </li>
                 </c:if>
              </c:forEach>
                 
              
              <!-- 다음 -->
              <c:if test="${endPage<totalPage }">
                 <li class="page-item ">
                      <a class="page-link" href="list.jsp?currentPage=${ endPage+1}>">다음</a>
                  </li>
              </c:if>
           </ul>
        </div>
     </c:if>
     
     
 </div>

</body>
</html>