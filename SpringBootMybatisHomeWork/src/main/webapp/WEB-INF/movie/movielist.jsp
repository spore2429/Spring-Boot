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

<div style="margin: 50px 100px">
<button type="button" class="btn btn-info"
onclick="location.href='writeform'"><b>영화등록</b></button>
</div>
<div style="margin: 50px 100px;">
      <br><br>
      <h3 class="alert alert-success" style="width: 900px;" align="center">
        <c:if test="${totalcount==0 }">
    		<b>저장된 영화정보가 없습니다</b>
		</c:if>
		<c:if test="${totalcount>0 }">
    		<b>총${totalcount }개의 영화정보가 있습니다</b>
        </c:if>
      </h3>
	 <div align="center">
     	  <c:forEach var="dto" items="${list }" varStatus="i">
		      <figure style="float: left;">
		      	<a href="detail?mv_num=${dto.mv_num }" style="text-decoration: none;"><img alt="" src="../moviephoto/${dto.mv_poster }" 
		      	width="200" height="400"  hspace="10"></a>
		      	<figcaption style="color: white; text-align: center;"><b>${dto.mv_title }</b></figcaption>
		      </figure>
     	  </c:forEach>
     	  
     </div>

    </div> 
</body>
</html>