<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/member/joinForm.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
<%--
  onsubmit : form 내부의 submit 버튼 클릭 되면, form 태그에 이벤트 발생
  return input_check(this) : input_check() 함수 호출. 매개변수 this(form 객체를 의미)
 --%>
<form action="join.jsp" name="f" method="post" onsubmit="return input_check(this)">
  <input type="hidden" name="picture" value=""> <%-- 업로드된 이미지의이름 --%>
  <table>
    <tr><td rowspan="4" valign="bottom">
       <img src="" width="100" height="120" id="pic"><br>
       <%--  href="url 정보"
             href="javascript:win_upload()" => javascript 의 win_upload() 함수 호출 
       --%>
       <font size="1"><a href="javascript:win_upload()">사진등록</a></font>
    </td><th>아이디</th>
    <td><input type="text" name="id">
    <button type="button" onclick="idchk()">중복검색</button>
    </td></tr>
    <tr><th>비밀번호</th><td><input type="password" name="pass"></td></tr>
    <tr><th>이름</th><td><input type="text" name="name"></td></tr>
    <tr><th>성별</th>
    <td><label for="gender1">남</label>
      <input type="radio" id="gender1" name="gender" value="1">
      <label for="gender2">여</label>
      <input type="radio" id="gender2" name="gender" value="2">
    </td></tr>
    <tr><th>전화번호</th><td colspan="2"><input type="text" name="tel"></td></tr>
    <tr><th>이메일</th><td colspan="2"><input type="text" name="email"></td></tr>
    <%-- button 태그의 기본 type은 submit임. --%>
    <tr><td colspan="3"><button>회원가입</button></tr>
  </table></form>
  <script type="text/javascript">
   /* 입력값 검증을 위한 자바스크립트 */  
     function input_check(f) {
	     //f : <form ...> 태그 
	     //f.id : <input name="id"....>. name 속성의 값이 id인 태그 
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
	   open("pictureForm.jsp","",op);
   }
   function isValidEmail(email) {
	   // 이메일 형식 정규식
	   const regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	   return regex.test(email);
    }
   function isValidTel(tel) {
	   const regex = /^(02|01[016789])-?\d{3,4}-?\d{4}$/;
	   return regex.test(tel);
    }

	 // 테스트용 예시
	 const testEmails = [
	   "example@example.com",
	   "user.name123@domain.co.kr",
	   "invalid-email@",
	   "@no-user.com",
	   "user@domain",
	   "user@domain.c",
	   "1234"
	 ];
	 const testTels = [
		   "02-1234-5678",
		   "010-123-5678",
		   "02-123-9875",
		   "123-5678",
		   "1234"
		 ];

	 
	 testEmails.forEach(email => {
	   console.log(email,"=>",isValidEmail(email));
	 });   
	 testTels.forEach(tel => {
		   console.log(tel,"=>",isValidTel(tel));
	 });   
	 
   
  </script>
  </body></html>