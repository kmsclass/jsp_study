<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/ex09_idlist.jsp --%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource var="conn" driver="org.mariadb.jdbc.Driver"
  url="jdbc:mariadb://localhost:3306/gdjdb"
  user="gduser" password="1234"/>
<sql:query var="rs" dataSource="${conn}">
   select id from member where id like ? 
 <sql:param>${param.id}%</sql:param> <%-- id 파라미터로 시작하는 레코드들을 조회 --%>
</sql:query>
<ul>
<c:forEach var="data" items="${rs.rows}">
  <li>${data.id}</li>
</c:forEach></ul>