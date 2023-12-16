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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<title>Insert title here</title>
</head>
<script>
	$(function(){
		
		$("#lf").on("click",function(){  //추가버튼

			var cnt=$("input.cl:last-of-type").attr("idx");	
			var cnt=pa
			var s="";
			
			$.ajax({
				data:{"cnt":cnt},
				dataType:"json",
				url:"level",
				type:"get",
				success:function(res){
					s+="<input type='text' class='form-control cl' idx='"+res.cnt+"'><i class='bi bi-x-circle-fill cldel' style='cursor: pointer; font-size: 50px;'></i>
					s+="<i class='bi bi-box-arrow-in-left cladd' style='cursor: pointer; font-size: 50px;'></i>";
					
					$("#out").append(s);
				}
			});			
		});

		$(document).on("click","i.cldel",function(){  //생성된 삭제버튼
			
			var lastidx=$("input.cl:last-of-type").attr("idx");
			var curidx=$(this).prev().attr("idx");
			//alert(curidx+","+lastidx);
			
			if(lastidx!=0){
				for(var i=curidx;i<=lastidx;i++){
					$("input.cl:eq("+i+")").attr("idx",$("input.cl:eq("+i+")").attr("idx")-1);
				}
				$(this).prev().remove();
				$(this).next().remove();
				$(this).remove();
			}
		});
		
		$(document).on("click","i.cladd",function(){  //생성된 추가버튼 
			
			var lastidx=$("input.cl:last-of-type").attr("idx");
			var curidx=$(this).prev().prev().attr("idx");
			//alert(typeof curidx);

			for(var i=curidx;i<=lastidx;i++){
				$("input.cl:eq("+i+")").attr("idx",$("input.cl:eq("+i+")").attr("idx")+1);
				//$("input.cl:eq("+i+1+")").val($("input.cl:eq("+i+")").val());
				//$("input.cl:eq("+i+1+")").val(); -> 사라지기 전에 변경, 혹은 val,text 아닌다른거 있는지 확인
			}
			//입력창의 현재idx-1의 다음 다음에 입력창,삭제버튼과,사이에 추가하는 버튼을 생성한다
			$("input.cl:eq("+curidx-1+")").next().next().append("<input type='text' class='form-control cl' idx='"+curidx+"'> 
			<i class='bi bi-x-circle-fill cldel' style='cursor: pointer; font-size: 50px;'></i>
			<i class='bi bi-box-arrow-in-left cladd' style='cursor: pointer; font-size: 50px;'></i>");
			
		});
		
		//$("#btn").on("click",function(){
		//	$("button.sub").click();
		//});
	
		
	});

	/*function del(){
		$(this).prev().remove();
		$(this).remove();
	}*/
</script>
<body>
	
<div style="margin: 100px 100px;width: 300px" id="out">
	<input type='text' class='form-control cl' idx='0' style="width: 300px;">
	<i class="bi bi-x-circle-fill cldel" style="cursor: pointer; font-size: 50px;"></i>
	<i class="bi bi-box-arrow-in-left cladd" style="cursor: pointer; font-size: 50px;"></i> <!-- 사이 추가버튼 -->
	
</div>

		<!-- <form action="levelinsert" method="post">
			<input type="hidden" name="company" value="영환기업">
			<input type="hidden" name="step" value="1" class="step">
			<input type="text" name="clevel" class="form-control cl" idx="1">
			<button type="submit" style="visibility: hidden" class="sub"></button>
		</form> -->
	<i class="bi bi-plus-circle" style="margin-left: 50px;cursor: pointer; font-size: 50px;" id="lf"></i><br> +버튼 클릭하면 입력창생성
	<button type="button" class="btn btn-info">저장</button>
	
	

	
	
	<form action="levelinsert" method="post">
		<input type="hidden" name="company" value="영환기업">
		<input type="hidden" name="clevel" class="form-control">
		
		<button type="submit" style="visibility: hidden" id="sub"></button>
	</form>
	<!-- <form action="levelinsert" method="post">
		<input type="hidden" name="company" value="영환기업">
		<input type="hidden" name="step" value="1" class="step">
		<input type="text" name="clevel" class="form-control cl" idx="0">
		<button type="submit" class="btn btn-info"></button>
	</form>
	<i class="bi bi-plus-circle" style="margin-left: 50px;cursor: pointer; font-size: 50px;" id="lf"></i> -->
	
</body>
</html>