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
<script type="text/javascript">
	$(function() {
		
		$("#allcheck").click(function() {
			
			var chk=$(this).is(":checked"); //allcheck에 0,1 checked값전달
			console.log(chk);
			
			$(".del").prop("checked",chk);  //class del에게 체크값전달
		});
		
		$("#btnmemberdel").click(function() {
			
			var cnt=$(".del:checked").length;
			//alert(cnt);
			
			if(cnt==0){
				alert("먼저 회원을 선택해주세요");
				return;
			}
			
			$(".del:checked").each(function(i,element) {
				
				var num=$(this).attr("num");
				console.log(num);
				
				//선택한 체크 삭제
				$.ajax({
					
					type:"get",
					url:"delete",
					dataType:"html",
					data:{"num":num},
					success:function(){
						
						location.reload();
						//alert("삭제되었습니다");
					}
				});
				
			});
			
		});
		
		
	});
</script>
</head>
<body style="background-color: black;">
<c:if test="${totalcount==0 }">
	<h2 class="alert alert-info">회원정보가 없습니다</h2>
</c:if>
<c:if test="${totalcount>0 }">
	<h2 class="alert alert-info">총 ${totalcount }명의 회원정보가 있습니다</h2>
</c:if>

<button type="button" class="btn btn-success"
onclick="location.href='memberform'">회원가입</button>
<br>
<br>

 <table class="table table-dark">
	
        <tr align="center" valign="middle">
          <th>번호</th>
          <th>이름</th>
          <th>아이디</th>
          <th>비밀번호</th>
          <th>사진</th>
          <th>전화번호</th>
          <th>주소</th>
          <th>이메일</th>
          <th>가입일</th>
          <th><input type="checkbox" id="allcheck">삭제</th>
          
        </tr>
        
      	<tr>
     	  <c:forEach var="dto" items="${list }" varStatus="i">
     	    <tr valign="middle">
     	      <td align="center"><b>${i.count }</b></td> 
     	      <td align="center"><b>${dto.name }</b></td>
     	      <td align="center"><b>${dto.id }</b></td>
     	      <td align="center"><b>${dto.pass }</b></td>
     	      <td align="center">
     	      <img alt="" src="../save/${dto.photo }" width="80" height="80" border="1" hspace="10">
     	      </td>
     	      <td align="center"><b>${dto.hp }</b></td>
     	      <td align="center"><b>${dto.addr }</b></td>
     	      <td align="center"><b>${dto.email }</b></td>
     	   
     	      <td align="center"><fmt:formatDate value="${dto.gaipday }" pattern="yyyyMMdd HH:mm"/>
     	      </td>
     	   	  <td align="center">
     	   	  <input type="checkbox" num=${dto.num } class="del">
     	   	  </td>
     	    </tr>
     	  </c:forEach>
      	</tr>
      </table>
      

<button type="button" class="btn btn-danger" id="btnmemberdel">Delete</button>


</body>
</html>