<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/view/member/joinForm.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<form action="join" name="f" method="post" onsubmit="return input_check(this)">
  <input type="hidden" name="picture" value=""> <%-- 업로드된 이미지의이름 --%>
  <table class="table">
    <tr><td rowspan="4"  class="align-bottom text-center">
       <div class="text-center">
       <img src=""  class="rounded" id="pic"><br>
       </div>
       <font size="1"><a href="javascript:win_upload()">사진등록</a></font>
    </td><th>아이디</th>
    <td><input type="text" name="id" class="form-control">
    <button type="button" onclick="idchk()" class="btn btn-primary">중복검색</button>
    </td></tr>
    <tr><th>비밀번호</th><td><input type="password" name="pass" class="form-control"></td></tr>
    <tr><th>이름</th><td><input type="text" name="name" class="form-control"></td></tr>
    <tr><th>성별</th>
    <td><div class="form-check form-check-inline">
       <input type="radio" id="gender1" name="gender" value="1" class="form-check-input">
        <label for="gender1" class="form-check-label">남</label>&nbsp;&nbsp;
        </div>
      <div class="form-check form-check-inline">
      <input type="radio" id="gender2" name="gender" value="2" class="form-check-input">
      <label for="gender2" class="form-check-label">여</label>
      </div>
    </td></tr>
    <tr><th>전화번호</th><td colspan="2">
         <input type="text" name="tel" class="form-control"></td></tr>
    <tr><th>이메일</th><td colspan="2">
        <input type="text" name="email" class="form-control"></td></tr>
    <%-- button 태그의 기본 type은 submit임. --%>
    <tr><td colspan="3"><button class="btn btn-success">회원가입</button></tr>
  </table></form>
  <script type="text/javascript">
     function input_check(f) {
    	 if (f.id.value.trim() == "") {
    		 alert("아이디를 입력하세요");
    		 f.id.focus();
    		 return false;  //기본 이벤트 취소 
    	 }
    	 if (f.pass.value.trim() == "") {
    		 alert("비밀번호를 입력하세요");
    		 f.pass.focus();
    		 return false;  //기본 이벤트 취소 
    	 }
    	 if (f.name.value.trim() == "") {
    		 alert("이름을 입력하세요");
    		 f.name.focus();
    		 return false;  //기본 이벤트 취소 
    	 }
    	 if (!isValidEmail(f.email.value)) {
    		 alert("이메일 형식이 아닙니다");
    		 f.email.focus();
    		 return false; 
    	 }
    	 if (!isValidTel(f.tel.value)) {
    		 alert("전화번호 형식이 아닙니다");
    		 f.tel.focus();
    		 return false; 
    	 }

    	 return true;
     }
   function win_upload() {
	   let op = "width=500,height=500,left=50,top=150";
	   open("pictureForm","",op);
   }
   function isValidEmail(email) {
	   const regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	   return regex.test(email);
    }
   function isValidTel(tel) {
	   const regex = /^(02|01[016789])-?\d{3,4}-?\d{4}$/;
	   return regex.test(tel);
    }
   function idchk() {
	   if (document.f.id.value == '') {
		   alert("아이디를 입력하세요")
		   document.f.id.focus()
	   } else {
	     let op = "width=500,height=200,left=50,top=150"
	     open("idchk?id="+document.f.id.value,"",op)
	   }
   }
  </script>
  </body></html>