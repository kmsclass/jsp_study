<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/view/board/list.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%--
   1. 첨부파일이 존재하는 게시물의 제목 앞에 @ 표시하기
   2. 게시글번호를 보여주기 위한 번호로 변경하기
 --%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>
</head>
<body>
<h2>${boardName}</h2>
<table class="table">
 <c:if test="${boardcount == 0}"> 
 <tr><td colspan="5">등록된 게시글이 없습니다.</td></tr>
 </c:if>
 <c:if test="${boardcount > 0}"> 
<tr><td colspan="5" style="text-align:right">글개수:${boardcount}</td></tr>
<tr><th width="8%">번호</th><th width="50%">제목</th>
    <th width="14%">작성자</th><th width="17%">등록일</th>
    <th width="11%">조회수</th></tr>
<c:set var="boardnum" value="${boardnum}" />    
<c:forEach var="b" items="${list}">
 <tr><td>${boardnum}</td>
<c:set var="boardnum" value="${boardnum - 1}" />    
 <td style="text-align: left">
 <%-- 첨부파일 @로 표시하기 --%>
  <c:if test="${!empty b.file1}"><a href="../upload/board/${b.file1}">@</a></c:if>  
  <c:if test="${empty b.file1}">&nbsp;&nbsp;&nbsp;</c:if>
 <a href="info?num=${b.num}">${b.title}</a></td>
 <td>${b.writer}</td><td>${b.regdate}</td><td>${b.readcnt}</td></tr>
</c:forEach>
<%-- 페이지 처리하기 --%>
 <tr><td colspan="5" align="center">
      <c:if test="${pageNum <= 1}">[이전]</c:if>
      <c:if test="${pageNum > 1}">
        <a href="list?pageNum=${pageNum-1}">[이전]</a>
      </c:if>
      <c:forEach var="a" begin="${startpage}" end="${endpage}">
        <c:if test="${a == pageNum}">[${a}]</c:if>
        <c:if test="${a != pageNum}">
          <a href="list?pageNum=${a}">[${a}]</a>
        </c:if>
      </c:forEach>
      <c:if test="${pageNum >= maxpage}">[다음]</c:if>
      <c:if test="${pageNum < maxpage}">
        <a href="list?pageNum=${pageNum+1}">[다음]</a>
      </c:if>
 </td></tr>  
</c:if>
  <tr><td colspan="5" style="text-align:right">
	<p align="right"><a href="writeForm">[글쓰기]</a></p>
</td></tr></table>
</body></html>