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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body style="background-color: black;">
<!-- 검색창 -->
<div class="searcharea" style="width: 100%; text-align: center;">
	<form action="list">
		<div style="width: 450px;" class="d-inline-flex">
			<select class="form-select" style="width: 150px;" name="searchcolumn"> <!-- 컬럼 -->
			  <option value="subject">제목</option>
			  <option value="id">아이디</option>
			  <option value="name">작성자</option>
			  <option value="content">내용</option>
			</select>&nbsp;
			<input type="text" name="searchword" class="form-control" style="width: 150px;"
			placeholder="검색어">&nbsp;
			<button type="submit" class="btn btn-success">검색</button>	
		</div>
	</form>
</div>
<div style="margin: 20px 100px; width: 900px;"> <!-- 탑,레프트 -->
	<h3 class="alert alert-info">총 ${totalCount }개의 글이 있습니다</h3>
	<br>
	<!-- 글쓰기는 로그인을 해야보임 -->
	<c:if test="${sessionScope.loginok!=null }">
	  <div style="float: right;">
		<button type="button" class="btn btn-info"
		onclick="location.href='list?searchcolumn=id&searchword=${sessionScope.myid}'">내가쓴글</button>
		<button type="button" class="btn btn-info"
		onclick="location.href='form'">글쓰기</button>
	  </div>
	</c:if>
	<br><br>
	<table class="table table-bordered">
		<tr class="table-info" align="center">
		  <th width="60">번호</th>
		  <th width="260">제목</th>
		  <th width="160">작성자</th>
		  <th width="200">작성일</th>
		  <th width="100">조회</th>
		  <th width="100">추천</th>
		</tr>
		<c:if test="${totalCount==0 }">
		  <tr>
		    <td>
			<h5>등록된 게시글이 없습니다</h5>
			</td>
		  </tr>
		</c:if>
		
	  <c:if test="${totalCount>0 }">
	  	<c:forEach var="dto" items="${list }">
	  	  <tr align="center">
	  	  	<td align="center">${no }</td> 
	  	  	<c:set var="no" value="${no-1 }"/> <!-- 번호증감식  -->
			<td>
			  <!-- 답글일경우 level 1개당 2칸띄우기 -->
			  <c:forEach begin="1" end="${dto.relevel }">
			  	&nbsp;&nbsp;
			  </c:forEach>
			  <!-- 답글일경우 답글 이미지 -->
			  <c:if test="${dto.relevel>0 }">
			  	<img alt="" src="../image/re.png">
			  </c:if>
			  <a href="content?num=${dto.num }&currentPage=${currentPage }">${dto.subject }</a>
			  <c:if test="${dto.photo!=null }">
			  	<i class="bi bi-tencent-qq"></i>
			  </c:if>
			</td>
			
			<td>${dto.name }</td>
			<td>
				<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd"/>
			</td>
			<td>${dto.readcount }</td>
			<td>${dto.likes }</td>
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