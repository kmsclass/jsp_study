<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/ex11_jdbc/ex01_jdbc.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jdbc예제1</title>
<%-- http://localhost:8080/jspStudy
   이클립스 폴더 : /jspStudy/src/main/wepapp 폴더를 시작으로 함
 --%>
<link rel="stylesheet" href="/jspStudy/css/main.css">
</head><body>
<%
    //JDBC Driver 클래스 로드
   Class.forName("org.mariadb.jdbc.Driver");
   //Mariadb 와 연결
   //localhost:3306 : mariadb 의 서버의 위치 
   //gdjdb : mariadb에 설정된 database 이름
   //conn 객체: mariadb 와 연결된 객체 
   Connection conn = DriverManager.getConnection
   ("jdbc:mariadb://localhost:3306/gdjdb","gduser","1234");
   // PreparedStatement : Statement 의 하위인터페이스
   //Statement는 데이터베이스에 문장을 전달하는 기능 객체
   PreparedStatement pstmt = conn.prepareStatement
		    ("select * from professor");
   //executeQuery() : 전달된 SQL명령을 실행하여 결과는 ResultSet 객체로 리턴
   ResultSet rs = pstmt.executeQuery();
   //ResultSetMetaData : 실행된 결과의 정보데이터를 저장. 컬럼명, 조회된 컬럼의 갯수,.....
   ResultSetMetaData rsmt = rs.getMetaData();
%>
<table><tr>
<%-- 컬럼명 출력 --%>
<% for(int i=1;i<=rsmt.getColumnCount();i++) {%>
    <th><%=rsmt.getColumnName(i) %></th><% } %></tr>
<% while(rs.next()) {%><tr>
 <% for(int i=1;i<=rsmt.getColumnCount();i++) {%>
 <td><%=rs.getString(i) %></td>
 <% } %></tr><% } %>
</table></body></html>