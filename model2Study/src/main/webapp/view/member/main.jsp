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
<h3>${sessionScope.login}님이 로그인 하셨습니다.</h3>
<h3><a href="logout">로그아웃</a></h3>
<h3><a href="info?id=${sessionScope.login}">회원정보보기</a></h3>
<%-- 관리자로 로그인 된경우 : 회원 목록 조회 --%>
<c:if test="${sessionScope.login == 'admin'}">
 <h3><a href="list">회원목록보기</a></h3>
</c:if> 
</body>
</html>