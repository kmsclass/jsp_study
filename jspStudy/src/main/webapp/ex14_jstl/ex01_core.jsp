<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/ex14_jstl/ex1_core.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL : core 태그</title>
</head>
<body>
<h3>속성관련 태그 : set,remove, out 태그</h3>
<%--  <c:set var="test" value="${'Hello JSTL'}" scope="session" />
  => set 태그 : session 영역에 test라는 이름으로 Hello JSTL 값을 등록.
               scope 속성 생략시 기본값 page임
     out 태그 : test 속성값을 화면에 출력. EL과 동일. excape xml 처리됨.
               EL보다 보안성이 좋음
               excape xml : &lt;script&gt;location.href="악성페이지"&lt;/script&gt;
     remove 태그 : 등록된 속성 제거           
--%>
<% session.setAttribute("test", "<h3>Hello JSTL</h3>"); %>
test 속성 : ${sessionScope.test }<br>
test 속성 : <c:out value="${test}" /><br>
test 속성 : ${test}<br>
<c:remove var="test" />
test 속성 : ${test}<br>
</body>
</html>