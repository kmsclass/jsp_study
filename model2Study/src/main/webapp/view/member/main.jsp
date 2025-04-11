<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%-- /webapp/view/member/main.jsp--%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
</head>
<body>
<div class="card">
  <div class="card-header">${sessionScope.login}님이 로그인 하셨습니다.</div>
  <div class="card-body">로그아웃</div>
  <div class="card-footer"><a href="info?id=${sessionScope.login}">회원정보보기</a>
   <c:if test="${sessionScope.login == 'admin'}">
       <br><a href="list">회원목록보기</a>
   </c:if> 
  </div>
</div>
</body>
</html>