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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
  $(function(){
	  
	  $(".btnnewphoto").click(function(){
		  
		  $("#newphoto").trigger("click");
	  });
	  
	  
	  $("#newphoto").change(function(){
		  
		  var num=$(this).attr("num");
		  console.log(num);
		  
		  var form=new FormData();
		  form.append("photo",$(this)[0].files[0]); //선책한 1개만 추가
		  form.append("num",num);
		  
		  console.dir(form);
		  
		  
		  $.ajax({
			  
			  type:"post",
			  dataType:"html",
			  url:"updatephoto",
			  processData:false,
			  contentType:false,
			  data:form,
			  success:function(){
				  
				  location.reload();
			  }
			  
		  });
	  });
	  
	  
	  
	  //탈퇴
	  $(".btndelete").click(function(){
		  
		  var num=$(this).attr("num");
		  //alert(num);
		  
		  var ans=confirm("정말 탈퇴하시겠습니까?");
		  
		  if(ans){
			  
			  $.ajax({
				  
				  type:"get",
				  dataType:"html",
				  url:"deleteme",
				  data:{"num":num},
				  success:function(){
					  
					  alert("삭제되었습니다");
					  location.href="/";
				  }
			  });
		  }
	  });
	  
	  //수정버튼 클릭시 모달에 데이타 넣기
	  $(".btnupdate").click(function(){
			 updatenum=$(this).attr("num");
			//alert(updatenum);
			$.ajax({
				type:"get",
				dataType:"json",
				url:"updateform",				
				data:{"num":updatenum},
				success:function(res){
					console.dir(res);
					$("#updatename").val(res.name); //업데이트폼에 value값 불러옴
					$("#updatehp").val(res.hp);
					$("#updateemail").val(res.email);
					$("#updateaddr").val(res.addr);				
				}
			});
		});
		

	  //수정
	  $("#btnupdateok").click(function(){
		  
		  
			//alert(updatenum);
		  
			var updatename=$("#updatename").val();
			var updatehp=$("#updatehp").val();
			var updateemail=$("#updateemail").val();
			var updateaddr=$("#updateaddr").val();
			
			var data="num="+updatenum+"&name="+updatename+"&hp="+updatehp+"&email="+updateemail+"&addr="+updateaddr;
			console.log(data);
			 $.ajax({
				type:"post",
				dataType:"html",
				url:"update",				
				data:data,
				success:function(res){
					location.reload();		
				}
			}); 
		});

	  
	  
	  
  });


</script>
</head>
<body style="background-color: black;">
<div style="margin:50px 100px;">
<table class="table table-dark" >


	<c:forEach var="dto"  items="${list}">
	    <c:if test="${sessionScope.loginok!=null and sessionScope.myid==dto.id }">
		<tr>
			<td style="width: 250px"  align="center" rowspan="5">
				<img src="../save/${dto.photo}" width="230" height="250" border="1">
				<br>
				<input type="file" style="display: none;" num=${dto.num}  id="newphoto"><!-- 사진 수정시 호출 -->
				<br>
				<button type="button" class="btn btn-info btnnewphoto">사진수정</button>
			</td>
			<td style="width: 300px">회원명 : ${dto.name}</td>	
			<td rowspan="5" align="center" valign="bottom" style="width: 200px; vertical-align: middle;">	
				<button type="button" class="btn btn-outline-primary btnupdate"
				num=${dto.num } data-bs-target="#myUpdateModal" data-bs-toggle="modal">정보수정</button>
				<br><br>
				<button type="button" class="btn btn-outline-danger btndelete" num=${dto.num }>회원탈퇴</button>			
			</td>	
		</tr>
		<tr>
			<td>아이디:${dto.id}</td>
		</tr>
		<tr>
			<td>이메일:${dto.email}</td>
		</tr>
		<tr>
			<td>핸드폰:${dto.hp}</td>
		</tr>
		<tr>
			<td>주소:${dto.addr}</td>
		</tr>
		</c:if>
	</c:forEach>
	
</table></div>

<!-- 수정모달 -->
<!-- The Modal -->
<div class="modal" id="myUpdateModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">회원정보수정</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <div class="form-group">
			   <label for="updatename">이름:</label>
			   <input type="text" class="form-control" id="updatename">
			</div>
			<div class="form-group">
			  <label for="updatehp">연락처:</label>
			  <input type="text" class="form-control" id="updatehp">
			</div>
			<div class="form-group">
			   <label for="updateemail">이메일:</label>
			   <input type="text" class="form-control" id="updateemail">
			</div>
			<div class="form-group">
			  <label for="updateaddr">주소:</label>
			  <input type="text" class="form-control" id="updateaddr">
			</div>

      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-success" data-dismiss="modal" id="btnupdateok">수정</button>
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>

</body>
</html>