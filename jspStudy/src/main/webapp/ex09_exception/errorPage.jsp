<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/ex09_exception/errorPage.jsp --%>
<%@ page isErrorPage="true" %>   <%-- 현재 페이지는 오류페이지임. exception 객체 추가 --%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>입력값을 확인해 주세요</h1>
<h3>숫자만 입력가능합니다.</h3>
<%= exception.getMessage() %><br>
<%  //오류메세지 브라우저의 화면에 출력하기
 // exception.printStackTrace(response.getWriter()); %>
</body>
</html>