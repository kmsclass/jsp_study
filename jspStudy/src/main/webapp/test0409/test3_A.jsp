<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%-- /webapp/test0409/test3_A.jsp --%>   
<!DOCTYPE html>
<html><head>
<meta charset="UTF-8">
<title>jstl을 이용한 간단한 연산</title>
</head>
<body>
<form method="post" name="f">
  x:<input type="text" name="x" value="${param.x}" size="5">
  <select name="op">
     <option>+</option><option>-</option>
     <option>*</option><option>/</option>
  </select>
  <script>
       var op = '${param.op}'
       if(op == '') op = '+';
       document.f.op.value= op;
  </script>
  y:<input type="text" name="y" value="${param.y}" size="5">
  <input type="submit" value="=">
</form>
<h3>${param.x} ${param.op} ${param.y}  
<c:choose>
  <c:when test="${param.op == '+'}">
    =${param.x + param.y}
  </c:when>
  <c:when test="${param.op == '-'}">
    =${param.x - param.y}
  </c:when>
  <c:when test="${param.op == '*'}">
    =${param.x * param.y}
  </c:when>
  <c:when test="${param.op == '/'}">
    =${param.x / param.y}
  </c:when></c:choose></h3></body></html>