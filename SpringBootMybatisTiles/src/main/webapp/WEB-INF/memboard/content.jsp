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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<title>Insert title here</title>
<style type="text/css">
.amod{
	color: #1e90ff;
	cursor: pointer;
}

.adel{
	color: #ff8c00;
	cursor: pointer;
}

</style>
<script type="text/javascript">
	$(function() {
		
		num=$("#num").val();
		myid="${sessionScope.myid}";
		loginok="${sessionScope.loginok}";
		//alert(myid+","+loginok);
		
		list(); //처음에 list 호출
		
		$("#btnansweradd").click(function() {
			
			var num=$("#num").val();
			var content=$("#content").text();
			
			//alert(num+","+content);
			
			if(content.length==0){
				alert("댓글을 입력해주세요!");
				return;
			}
			//입력했을때
			$.ajax({
				
				type:"post",
				dataType:"html",
				url:"/mbanswer/ainsert",
				data:{"num":num,"content":content},
				success:function(res){
					
					//alert("안녕");
					$("#content").val("");  //성공후 댓글창비우기
					//location.reload();
					list(); //성공시 리스트 호출
				}
			});
			
		});
		
		//댓글 수정창 띄우기
		$(document).on("click",".amod",function() {
    		
			var idx=$(this).attr("idx");
			var c=$("#c").val();
			alert(idx+","+c);

				$.ajax({
					
					type:"get",
					dataType:"json",
					url:"/mbanswer/adata",
					data:{"idx":idx},
					success:function(res){
						
						$("#ucontent").val(res.content);
						
					}
				});
			
				$("#mbUpadteModal").modal("show");
		});
		
		//댓글 수정
		$(document).on("click","#btnupdate",function() {
			var idx=$(".amod").attr("idx");
			
			var content=$("#ucontent").val();
			alert(idx+","+ucontent);

				$.ajax({
					
					type:"post",
					dataType:"html",
					url:"/mbanswer/aupdate",
					data:{"idx":idx,"content":content},
					success:function(){
						
						//location.reload();
						list();
						
					}
				});
			
				
		});
		
		
		
		
		//댓글 삭제
		$(document).on("click",".adel",function() {
    		
			var idx=$(this).attr("idx");
			alert(idx);
			
			var ans=confirm("정말 삭제하시겠습니까?");
			
			if(ans){
				
				$.ajax({
					
					type:"post",
					dataType:"html",
					url:"/mbanswer/adelete",
					data:{"idx":idx},
					success:function(res){
						
						location.reload();
						list(); //성공시 리스트 호출
					}
				});
			}
		});
		
	});
	
	function list() {

		
		var content=$("#content").val();
		//alert(myid+","+loginok);
		
		//alert(num);	
		
		$.ajax({
			
			type:"get",
			dataType:"json",
			url:"/mbanswer/alist",
			data:{"num":num},
			success:function(res){
			
			$("span.acount").text(res.length); //댓글갯수 확인
			
			var s="";
			$.each(res,function(i,dto){
				
				s+="<b id='c'>"+dto.name+","+dto.content+"</b>";
				s+="<span class='day'><small>"+dto.writeday+"</small></span>\t";
				
				if(loginok=="yes" && myid==dto.myid)
				{
					s+="<i class='bi bi-pen-fill amod' idx="+dto.idx+"></i>";
					s+="\t";
					s+="<i class='bi bi-trash3-fill adel' idx="+dto.idx+"></i>";
				}
				
				 s+="<br>";
		         $("div.alist").html(s);   

			});
			
				
				
			}
		});
	}
</script>
</head>

<body style="background-color: black;">
	<div style="margin: 50px 50px;">
	  <table class="table table-dark" style="width: 600px;">
	  	<tr>
	  	  <td>
	  	    <h4><b>${dto.subject } </b>
	  	      <span style="font-size: 14pt; color: gray; float: right;">
	  	      	<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/>
	  	      </span>
	  	      </h4>
	  	      <span>작성자: ${dto.name }(${dto.myid }) </span>
	  	      
	  	      <c:if test="${dto.uploadfile!='no' }">
	  	      	<span style="float: right;">
	  	    
	  	      	<a href="download?clip=${dto.uploadfile }">
	  	      	<b>${dto.uploadfile }</b>&nbsp;<i class="bi bi-download"></i></a></span>
	  	      </c:if>
	  	  </td>
	  	</tr>
	  	
	  	<tr>
	  	  <td>
	  	    <c:if test="${bupload==true }">
	  	       <img src="../savefile/${dto.uploadfile }" style="width: 200px;"> <!-- 업로드파일이 이미지형식이 아닌경우 엑박이안뜨게함 -->
	  	    </c:if>
	  	    <br><br>
	  	    <pre>
	  	     ${dto.content }
	  	    </pre>
	  	    <br>
	  	    <b>조회: ${dto.readcount }</b><br>
	  	    
	  	  </td>
	  	</tr>
	  	
	  	<!-- 댓글 -->
	  	<tr>
	  	  <td>
	  	    <div class="alist"></div>
	  	    
	  	    <input type="hidden" id="num" value="${dto.num }">
	  	    
	  	    <c:if test="${sessionScope.loginok!=null }">
	  	      <div class="aform">
                     <div class="d-inline-flex">
                        <input type="text" class="form-control" style="width: 500px;"
                        placeholder="댓글을 입력하세요" id="content">
                        
                        <button type="button" class="btn btn-info"
                        id="btnansweradd">등록</button>
                     </div>
                  </div>
	  	    </c:if>
	  	  </td>
	  	</tr>
	  	
	  	
	  	<!-- 버튼들 추가 -->
	  	<tr>
	  	  <td align="right">
	  	  <c:if test="${sessionScope.loginok!=null }">
	  	    <button type="button" class="btn btn-outline-success"
	  	    onclick="location.href='form'">글쓰기</button>
	  	  </c:if>
	  	 
	  	    <c:if test="${sessionScope.loginok!=null && sessionScope.myid==dto.myid }">
	  	      <button type="button" class="btn btn-outline-primary"
	  	      onclick="location.href='uform?num=${dto.num}&currentPage=${currentPage}'">수정</button>
	  	    
	  	      <button type="button" class="btn btn-outline-danger"
	  	      onclick="location.href='delete?num=${dto.num}&currentPage=${currentPage}'">삭제</button>
	  	    </c:if>

	  	    <button type="button" class="btn btn-outline-info"
	  	    onclick="location.href='list?currentPage=${currentPage}'">목록</button>
	  	  </td>
	  	</tr>
	  </table>
	</div>
	
	<!-- The Modal -->
<div class="modal" id="mbUpadteModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">댓글 수정</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <input type="text" id="ucontent" class="form-control">
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
      	<button type="button" class="btn btn-success" id="btnupdate">수정</button>
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
      </div>

    </div>
  </div>
</div>
</body>
</html>