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
<c:set var="root" value="<%=request.getContextPath() %>"/>

<!-- 로그인 안하면 기본사진,로그인 하면 자기사진으로 변경 -->

<div align="center">
  <br>
  <c:if test="${sessionScope.loginok==null }">
   <img alt="" src="${root }/image/gta1.png" 
  style="width: 170px; height: 300px; border: 1px solid black;" >
  <br><br>
  <b style="color: white;">이름: 운영자</b><br>
  <b style="color: white;">전화번호: 010-0000-0000</b><br>
  <b style="color: white;">주소: 지구</b><br>
  </c:if>
  
  <c:if test="${sessionScope.loginok!=null }">
   <img alt="" src="${root }/save/${sessionScope.loginphoto}" 
  style="width: 170px; height: 300px; border: 1px solid black;" >
  <br><br>
  <b style="color: white;">이름: ${sessionScope.loginname }</b><br>
  <b style="color: white;">전화번호: ${sessionScope.loginhp }</b><br>
  <b style="color: white;">주소: ${sessionScope.loginaddr }</b><br>
  </c:if>

  
</div>
</body>
</html>