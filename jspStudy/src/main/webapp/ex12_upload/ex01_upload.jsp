<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>upload 결과보기</title>
</head>
<body>
<%
//request.getServletContext() : application 객체
//  String realPath = request.getServletContext().getRealPath("upload");
  //realPath : ...\org.eclipse.wst.server.core\tmp0\wtpwebapps\jspStudy\\upload\
  //           업로드 되는 폴더 설정
  String realPath = application.getRealPath("upload");
  File dir = new File(realPath);
  //!dir.exists() : 업로드 되는 폴더가 없으면.
  if(!dir.exists()) 
	   dir.mkdirs(); //폴더 생성
  //MultipartRequest : upload를 위한 클래스.	   
  MultipartRequest multi = new MultipartRequest(
		  request,   //요청 정보. 파라미터정보,파일정보
		  realPath,  //업로드되는 폴더설정=> 폴더에 파일저장함 => 업로드
		  1024*1024*10, //10M => 업로드 되는 파일의 최대 크기 지정 
		  "UTF-8",   //인코딩 설정
		  new DefaultFileRenamePolicy() //파일명 중복시 이름변경 => 파일 뒤에 숫자를 붙임
		  );
	   
  String uploader = multi.getParameter("uploader"); //파라미터 정보 조회 
  //파일 정보 조회 <input type="file" name="filename" >
  String originName = multi.getOriginalFileName("filename");  //원래 파일명.
  String fileSystemName = multi.getFilesystemName("filename");//업로드 완료된 파일명
  File file = multi.getFile("filename"); //업로드된파일정보를 File 객체 생성
  String name = file.getName(); //파일의 이름
  String parent = file.getParent(); //폴더 이름
  //file.lastModified() : 파일 최종 수정일자
  String lastModified = 
		    new SimpleDateFormat("yyyy-MM-dd").format(file.lastModified());
  //#,##0 : 숫자 출력시 3자리마다 , 표시 하도록 형식 지정
  //file.length() : 파일의 바이트 크기 
  //file.length() / 1024 : 파일을 KB로 환산
  String size = new DecimalFormat("#,##0").format(file.length() / 1024 +
		            (file.length() % 1024 == 0?0:1));
%>
<ul style="list-style-type: circle; font-size:24px">
  <li>작성자:<%=uploader %></li>
  <li>원래업로드파일명:<%=originName %></li>
  <li>저장된업로드파일명:<%=fileSystemName %></li>
  <li>파일명:<%=name %></li>  
  <li>최종수정일:<%=lastModified %></li>
  <li>파일크기:<%=size %>KB</li></ul>
  <img src="/jspStudy/upload/<%=fileSystemName%>">
</body></html>