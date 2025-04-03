<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/ex10_cookie/ex01_cookie.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
   Cookie cookie = new Cookie("name","hongkildong");
   cookie.setMaxAge(600);
   response.addCookie(cookie);
%>
<h2>쿠키이름 : <%=cookie.getName() %><br>
    쿠키값 : <%=cookie.getValue() %><br>
    쿠키유효기간 : <%=cookie.getMaxAge() %><br>
</h2>
<a href="ex02_cookie.jsp">쿠키값 불러오기</a>
</body>
</html>