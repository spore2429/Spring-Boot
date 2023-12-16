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
<script type="text/javascript">
$(function() {

	$("div.likes").click(function() {
		
		var thumb=$(this).find("i").attr("class");
		//alert(thumb);
		
		if(thumb=='bi bi-hand-thumbs-up-fill'){
			$(this).find("i").attr("class","bi bi-hand-thumbs-up-fill a").css("color","red");
		}else{
			
			$(this).find("i").attr("class","bi bi-hand-thumbs-up-fill").css("color","black");
		}
		
		var num=${dto.num};
		//alert(num);
		var icon=$(this);
		//alert(icon);
  
		$.ajax({
			
			data:{"num":num},
			url:"/reboard/updatelike",
			dataType:"json",
			type:"get",
			success:function(res){
				$("div.likes").find("b").text(res.likes);
			}
		});
		
	});
});
</script>
</head>
<body style="background-color: black;">
<div style="width: 600px; margin: 50px 100px;">
<table class="table table-borderd">
  <tr>
    <td>
      <h2>${dto.subject }</h2>
      <b>${dto.name }(${dto.id })</b><br>
      <span style="color: gray; font-size: 0.8em;">
      	<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/>
      	&emsp;
      	조회: ${dto.readcount }
      </span>
    </td>
  </tr>
  <tr>
    <td>
      <pre>
      	${dto.content }
      </pre><br><br>
      <c:if test="${dto.photo!=null }">
      	<c:forEach var="photo" items="${dto.photo }">
      		<img alt="" src="../rephoto/${photo }" width="100" class="img-thumbnail">
      	</c:forEach>
      </c:if>
      <br><br>
      <div class="likes">
      	<i class="bi bi-hand-thumbs-up-fill" style="cursor: pointer;"></i>&nbsp;
      	좋아요 <b>${dto.likes }</b>
      </div>
    </td>
  </tr>
  
 <tr>
      <td>
      <button type="button" class="btn btn-outline-success"
      onclick="location.href='form?num=${dto.num}&regroup=${dto.regroup }&relevel=${dto.relevel }&restep=${dto.restep }&currentPage=${currentPage }'">답글</button>
      
      <c:if test="${sessionScope.loginok!=null && sessionScope.myid == dto.id }">
      <button type="button" class="btn btn-outline-success"
      onclick="location.href=''">수정</button></c:if>
      
      <c:if test="${sessionScope.loginok!=null && sessionScope.myid == dto.id }">
      <button type="button" class="btn btn-outline-success"
      onclick="location.href=''">삭제</button></c:if>
      
      <button type="button" class="btn btn-outline-success"
      onclick="location.href=''">목록</button>
      
      <c:if test="${sessionScope.loginok!=null }">
      <button type="button" class="btn btn-outline-success"
      onclick="location.href=''">글쓰기</button>
      </c:if>
      </td>
   </tr>
</table>
</div>


</body>
</html>