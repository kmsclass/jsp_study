<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- /webapp/view/member/mailForm.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<title>메일작성</title>
<script type="text/javascript">
function inputchk(f) {
	   if(f.googleid.value == "") {
		   alert("구글 아이디를 입력하세요");
		   f.googleid.focus();
		   return false;
	   }
	   if(f.googlepw.value == "") {
		   alert("구글 비밀번호를 입력하세요");
		   f.googlepw.focus();
		   return false;
	   }
	   return true;
}
</script>
</head>
<body>
<div class="container">
<H2 id="center">메일 보내기</H2>
<form name="form1" method="post" action="mailSend" 
	onsubmit="return inputchk(this)">
<table class="table">
<tr><td>보내는사람</td>
<td>본인구글ID : <input type="text" name="googleid" class="form-control"
                value="">
    본인구글비밀번호 : 
  <input type="password" name="googlepw" class="form-control" value=""></td>
</tr>
<tr><td>받는사람</td>
	<td><input type="text" name="recipient"  class="form-control"
value=
"<c:forEach items="${list}" var="m" >${m.name} &lt;${m.email}&gt;,</c:forEach>">
<%-- 테스트1 <test1이메일>,테스트2 <test2이메일>, --%>
</td></tr>
<tr><td>제 목</td>
	<td><input type="text" name="title" class="form-control"></td>
</tr><tr><td>메시지 형식</td>
	<td><select name="mtype" class="form-control">
	    <%-- 수신메일에서 html태그 인식 --%>
		<option value="text/html;charset=UTF-8">HTML 
		<%-- 수신메일에서 html태그를 문자열로 인식.  --%>
		<option value="text/plain;charset=UTF-8">TEXT
	</select></td></tr>
<tr><td colspan="2">
<textarea name="content" cols="40" rows="10" class="form-control" 
did="summernote"></textarea></td>
</tr><tr><td colspan="2" id="center">
	  <button type="submit" class="btn btn-primary">전송</button></td>
</table></form></div>
</body></html>