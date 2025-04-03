<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- errorPage="errorPage.jsp" : 현재 페이지에서 오류 발생하면 errorPage.jsp 호출 --%>    
<%@ page errorPage="errorPage.jsp" %>      
<%-- /webapp/ex09_exception/ex01_error.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오류 발생 페이지</title>
</head>
<body>
<% int num = Integer.parseInt("abc"); %>
</body>
</html>