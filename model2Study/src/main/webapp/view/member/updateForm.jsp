<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%-- /webapp/view/member/updateForm.jsp --%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 전 화면 조회</title>
</head>
<body>
<form action="update" method="post" onsubmit="return input_check(this)" 
    name="f">
 <input type="hidden" name="picture" value="${mem.picture}">
 <h3>회원정보 수정</h3>
<table class="table">
<tr><td rowspan="4" valign="bottom" align="center" width="20%">
  <img src="../picture/${mem.picture}"  width="100%" id="pic"><br>
  <font size="1"><a href="javascript:win_upload()">사진수정</a></font>
</td><th>아이디</th>
     <td><input type="text" value="${mem.id}" name="id" readonly class="form-control"></td></tr>
<tr><th>비밀번호</th><td><input type="password" name="pass" class="form-control"></td></tr>
<tr><th>이름</th><td><input type="text" name="name" value="${mem.name}" class="form-control"></td></tr>
<tr><th>성별</th><td>
     <div class="form-check form-check-inline">
           <input type="radio" id="gender1" name="gender" value="1" 
             class="form-check-input" ${mem.gender == 1?"checked":""}>
           <label for="gender1" class="form-check-label">남</label>&nbsp;&nbsp;
     </div>
     <div class="form-check form-check-inline">
           <input type="radio" id="gender2" name="gender" value="2" 
             class="form-check-input" ${mem.gender == 2?"checked":""}>
           <label for="gender2" class="form-check-label">여</label>
     </div>        
</td></tr>
<tr><th>전화번호</th><td colspan="2">
<input type="text" name="tel" value="${mem.tel}" class="form-control"></td></tr>
<tr><th>이메일</th><td colspan="2">
<input type="text" name="email" value="${mem.email}" class="form-control"></td></tr>
<tr><td colspan="3"  align="center"><button class="btn btn-primary">회원수정</button>
<c:if test="${param.id == sessionScope.login }">
<button type="button" onclick="win_passchg()"  class="btn btn-danger">비밀번호수정</button>
</c:if>
</td></tr>
</table></form>
<script type="text/javascript">
   function  inputcheck(f) {
       if(f.pass.value == "") {
		   alert("비밀번호를 입력하세요");
		   f.pass.focus();
		   return false;
	   }
	   return true;
   }   
   function win_passchg() {
	  var op = "width=500, height=250, left=50,top=150";
	  open("passwordForm","",op);
   }
   function win_upload(){
	   var op = "width=500,height=150,left=50, top=150";
	   open("pictureForm","",op);
   }
</script>
</body></html>
