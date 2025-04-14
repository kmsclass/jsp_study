<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/member/passwordForm.jsp
  로그인 한경우만 이페이지가 출력하도록 수정하기
  로그아웃상태 : 화면에 로그인하세요 메세지 출력 후 opener의 url을 loginForm.jsp로 페이지 이동하기. 
              현재 페이지 닫기 
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<body>
  <h3 align="center">비밀번호 변경</h3>
  <form action="password" method="post" name="f" onsubmit="return input_check(this)">
  <table class="table">
     <tr><th>현재비밀번호</th>
         <td><input type="password" name="pass" class="form-control"></td></tr>
     <tr><th>변경비밀번호</th>
         <td><input type="password" name="chgpass" class="form-control"></td></tr>
     <tr><th>변경비밀번호재입력</th>
         <td><input type="password" name="chgpass2" class="form-control"></td></tr>
     <tr><td colspan="2" align="center">
         <input type="submit" value="비밀번호변경" class="btn btn-primary">
         <input type="reset" value="초기화" class="btn btn-secondary"></td></tr>
   </table>  
  </form>
  <script>
    function input_check(f) {
 	   if(f.chgpass.value != f.chgpass2.value) {
		   alert("변경비밀번호 와 변경비밀번호재입력이 다릅니다.");
		   f.chgpass2.value="";
		   f.chgpass2.focus();
		   return false;
	   }
 	   return true;
    }
  </script>  
</body>
</html>