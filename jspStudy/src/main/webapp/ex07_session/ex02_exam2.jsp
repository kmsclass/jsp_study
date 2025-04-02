<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/ex07_session/ex02_exam2.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>session에 등록된 날짜를 조회하고, 
    session속성에서 제거하기<br>
    등록된 날짜가 없는 경우 ex02_exam1.jsp
    페이지로 이동하기<br>
<%
   Date date = (Date)session.getAttribute("today");
   if(date == null) {
	   response.sendRedirect("ex02_exam1.jsp");
   } else {
%>	   
   등록된 날짜 : <%=date %>
<%  session.removeAttribute("today"); 
   }   %>    
</h3>
</body>
</html>