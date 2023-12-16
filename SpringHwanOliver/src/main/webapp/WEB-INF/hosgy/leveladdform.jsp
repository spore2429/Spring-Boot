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
		
		$("#lf").on("click",function(){

			var cnt=$("input.cl:last-of-type").attr("idx");			
			var s="";
			
			$.ajax({
				data:{"cnt":cnt},
				dataType:"json",
				url:"level",
				type:"get",
				success:function(res){
					s+="<input type='text' class='form-control cl' idx='"+res.cnt+"'><i class='bi bi-x-circle-fill cldel' style='cursor: pointer; font-size: 50px;'></i><i class='bi bi-box-arrow-in-left cladd' style='cursor: pointer; font-size: 50px;'></i>";
					
					$("#out").append(s);
				}
			});			
		});

		$(document).on("click","i.cldel",function(){
			
			var lastidx=$("input.cl:last-of-type").attr("idx");
			var curidx=$(this).prev().attr("idx");
			
			if(lastidx!=0){
				for(var i=curidx;i<=lastidx;i++){
					$("input.cl:eq("+i+")").attr("idx",$("input.cl:eq("+i+")").attr("idx")-1);
				}
				$(this).prev().remove();
				$(this).next().remove();
				$(this).remove();
			}
		});
		
		$(document).on("click","i.cladd",function(){
			
			var lastidx=$("input.cl:last-of-type").attr("idx");
			var curidx=$(this).prev().prev().attr("idx");
			var cnt=0;
			var s="";
			var cidx=parseInt(curidx);

			for(var i=curidx;i<=lastidx;i++){
				$("input.cl:eq("+i+")").attr("idx",parseInt($("input.cl:eq("+i+")").attr("idx"))+1);
			}
			$.ajax({
				data:{"cnt":cnt},
				dataType:"json",
				url:"level",
				type:"get",
				success:function(res){
					s+="</i><input type='text' class='form-control cl' idx='"+cidx+"'><i class='bi bi-x-circle-fill cldel' style='cursor: pointer; font-size: 50px;'></i>";
					s+="<i class='bi bi-box-arrow-in-left cladd' style='cursor: pointer; font-size: 50px;'>";
					
					if(cidx!=0){$("input.cl:eq("+(cidx-1)+")").next().next().after(s);}
					else{$("input.cl:eq("+cidx+")").before(s);}
				}
			});
		});
		
		$("#btn").on("click",function(){
			var lastidx=$("input.cl:last-of-type").attr("idx");
			var s="";
			var idx="";
			
			for(var i=0;i<=lastidx;i++){
				s+=$("input.cl:eq("+i+")").val()+",";
				idx+=$("input.cl:eq("+i+")").attr("idx")+",";
			}
			$("#hi").val(s);
			$("#hello").val(idx);
			
			$("#sub").click();
		});
	});
</script>
<body>
	
<div style="margin: 100px 100px;width: 300px" id="out">
	<input type='text' class='form-control cl' idx='0' style="width: 300px;"><i class="bi bi-x-circle-fill cldel" style="cursor: pointer; font-size: 50px;"></i><i class="bi bi-box-arrow-in-left cladd" style="cursor: pointer; font-size: 50px;"></i>
	
</div>

	<i class="bi bi-plus-circle" style="margin-left: 50px;cursor: pointer; font-size: 50px;" id="lf"></i><br>
	<button type="button" class="btn btn-info" id="btn">저장</button>
	
	<form action="levelinsert" method="post">
		<input type="hidden" name="company" value="스성실업">
		<input type="hidden" name="clevel" id="hi">
		<input type="hidden" name="step" id="hello">
		
		<button type="submit" style="visibility: hidden" id="sub"></button>
	</form>
	
</body>
</html>