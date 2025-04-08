<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/member/picture.jsp
   1. request 객체로 이미지 업로드 불가 => cos.jar  
   2. 이미지 업로드 폴더 : 현재폴더/picture 설정 
   3. opener 화면에 이미지 볼수 있도록 결과 전달 => javascript
   4. 현재 화면 close 하기                   => javascript
--%>    
<%
   //업로드되는 폴더 설정
   String path = application.getRealPath("") + "member/picture/";
   String fname = null;
   File f = new File(path); //업로드되는 폴더 정보
   if(!f.exists()) f.mkdirs(); //폴더 생성
   //request : 이미지 데이터 저장
   //path : 업로드 폴더
   //10*1024*1024 : 최대 업로드 크기. 10M
   //utf-8 : 인코딩 설정
   // => 업로드 완료
   MultipartRequest multi = new MultipartRequest(request,path, 10*1024*1024,"utf-8");
   fname = multi.getFilesystemName("picture"); //선택된 파일의 이름
%>
<script>
  /*
  opener : 현재 창을 open한 window 객체. => joinForm.jsp 페이지의 window 객체
  */
   img = opener.document.getElementById("pic"); //<img id="pic" ...> 이미지객체 
   img.src = "picture/<%=fname%>"; //=> opener 페이지의 이미지 보임.
   // <input type="hidden" name="picture" value="fname">
   /*
   BOM : window : 최상위 객체
            document : 문서객체
              form : <form name="f" .... >
                  input : <input type="hidden" value="fileName" ...>
            location : 현재페이지의 url 저장
            history  : 현재페이지의 과거부터 현재까지의 url 정보
            ..
   */
   opener.document.f.picture.value = "<%=fname%>";
   //self : 현재페이지의 window 객체
   self.close();
</script>