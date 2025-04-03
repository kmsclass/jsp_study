<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/ex09_exception/ex02_error.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오류 발생 페이지</title>
</head>
<body>
<%  String str = null; %>
<%= str.trim() %>

<%
  int num = Integer.parseInt("abc"); 
%>
<%--
- error 처리 방식
 1. 해당 페이지에 errorPage="errorPage.jsp" 처리
 2. HTML error code : 404, 500 오류 발생시
 3. 예외객체별 : NumberFormatException
 4. error 처리를 안한경우 

ex01_error.jsp : Integer.parseInt("abc");
    예외객체 : NumberFormatException
    예외코드 : 500
    errorPage로 설정 - 호출

ex02_error.jsp : Integer.parseInt("abc");
    예외객체 : NumberFormatException - 호출
    예외코드 : 500

ex02_error.jsp : str.trim() , str null값
    예외객체 : NullPointerException
    예외코드 : 500   -- 호출

 ================================
 error 페이지 설정시 우선 순위
 
 1. 해당페이지에서 오류 페이지 설정 : <%@ page errorPage="error.jsp" %>
 2. web.xml에서 예외클래스 별로 설정
    <error-page><exception-type>....
 3. web.xml에서 HTTP 오류 코드로 설정
    <error-page><error-code>....
 4. WAS에서 제공해주는 에러 페이지      
 --%>
</body>
</html>