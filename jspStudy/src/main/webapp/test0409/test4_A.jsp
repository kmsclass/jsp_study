<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
이름:${param.name}<br>
나이:${param.age}<br>
성별:${param.gender == 1?"남":"여" }<br>
출생년도:${param.year}<br>
나이:만${2025 - param.year}<br>
</body></html>