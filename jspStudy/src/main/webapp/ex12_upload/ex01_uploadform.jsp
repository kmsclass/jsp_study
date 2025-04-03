<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/ex12_upload/ex01_uploadform.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일업로드</title>
</head>
<body>
<div>
<%--
   enctype="multipart/form-data" : 파일 업로드시 선택된 파일의 내용도 함께 서버로 전송하도록 설정
                  method="post"로 무조건 설정해야 함.
   => 파일업로드시 <form  enctype="multipart/form-data" method="post"....>
      로 설정해야 함
   => 서버에서는 request를 이용하여 파라미터값을 가져올 수 없다.                    
 --%>
<%--
  ex01_upload.jsp 요청시 multipart/form-data 설정인 경우 request 객체 파라미터 처리 못함
    1개의 파라미터의 1개의 파일 정보를 가지고 요청
    uploader 파라미터
    filename 파일정보 + 파일의 내용
 --%> 
 <form id="frm_upload" action="ex01_upload.jsp" 
       method="post" enctype="multipart/form-data">
	<div><label for="uploader">작성자</label>
		<input type="text" id="uploader" name="uploader"></div>
	<div><label for="filename">파일첨부</label>
		<input type="file" id="filename" name="filename"></div>
		<%-- <button> 태그의 기본 타입은 submit --%>
    <div><button>첨부하기</button>
		<input type="reset" value="다시작성">
	</div>
</form></div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
  $("#filename").on("change",function(){
	  let filename = $(this).val();
	  let extname = filename.substring(filename.lastIndexOf(".") + 1).toLowerCase();
	  let acceptList= ["jpg","jpeg","png","gif","tif"];
	  if($.inArray(extname,acceptList) == -1) {
		  alert("이미지만 첨부 가능합니다.")
		  $(this).val("");
		  return;
	  }
  })
</script>
</body></html>