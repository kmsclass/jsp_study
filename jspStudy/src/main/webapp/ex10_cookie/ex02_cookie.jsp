<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/ex10_cookie/ex02_cookie.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키정보보기</title>
</head>
<body>
<%
	String name="";
	String value="";
	Cookie[] cookies = request.getCookies();
	for(Cookie c : cookies) {
		if(c.getName().equals("name")) {
			name = c.getName();
			value= c.getValue();
		}
	}
%>
<h2>쿠키이름 = <%=name %></h2>
<h2>쿠키값 = <%=value %></h2>
</body>
</html>