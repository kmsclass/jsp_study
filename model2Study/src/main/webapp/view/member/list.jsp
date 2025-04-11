<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html><head>
<meta charset="UTF-8">
<title>회원목록</title>
</head>
<body>
<h2>회원목록</h2>
<form name="f" method="post" action="mailForm" onsubmit="return input_check(this)">
<table>
<tr><th>아이디</th><th>사진</th><th>이름</th><th>성별</th><th>전화</th>
    <th>&nbsp;</th><th><input type="checkbox" name="alchk" 
    onchange="allchkbox(this)">전체선택</th></tr>
<c:forEach var="m" items="${list}">    
<tr><td><a href="info?id=${m.id}">${m.id}</a></td>
<td><img src="picture/${m.picture}" width="30" height="30"></td>
<td>${m.name}</td><td>${m.gender==1?"남":"여"}</td>
<td>${m.tel}</td>
<td><a href="updateForm?id=${m.id}">수정</a>
   <c:if test="${m.id != 'admin'}">
    <a href="deleteForm?id=${m.id}">강제탈퇴</a>
    </c:if>
 </td>
 <td><input type="checkbox" name="idchks" class="idchk" value="${m.id}"></td></tr>
</c:forEach>
 <tr><td colspan="7" id="center">
 <button type="submit" class="btn btn-dark">메일보내기</button>
</td></tr></table></form>
<script type="text/javascript">
   function input_check(f) {
	   let cnt = 0;
       document.querySelectorAll(".idchk").forEach((idchk)=>{
    	   if (idchk.checked) cnt++;
       })
	   if (cnt == 0) {
		   alert("이메일 전송 아이디를 선택하세요")
		   return false;
	   }
	   return true;  
	}
   function allchkbox(chk) {
       document.querySelectorAll(".idchk").forEach((idchk)=>{
              idchk.checked = chk.checked;
       })
   }
</script>
</body></html>