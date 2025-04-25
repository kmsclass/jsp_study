<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/test0424/test1.jsp --%>    
<%-- 키움히어로즈의 내야수 사진 가져오기 --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
  String url = "https://heroesbaseball.co.kr/players/infielder/list.do";
  String line = "";
  Document doc = null;  
  try {
	   doc = Jsoup.connect(url).get(); //url을 접속하여 문서를 지정
	   Elements imgs = doc.select("img.nail"); //img 태그들 
	   Elements names = doc.select("strong.name"); //선수이름들  
	   for(int i=0;i<imgs.size();i++) {
		   Element img = imgs.get(i);  //img : <img class="nail"... > 한개
		   Element name = names.get(i); //name : <strong class="name">이름</strong>
		   if (!img.toString().trim().equals("")) {
			   line += img.toString().replace
					   ("src=\"/files","src=\"https://heroesbaseball.co.kr/files");
			   line += "<span>"+name.toString() + "</span><br>";
		   }
	   }
   } catch(IOException e) {
	   e.printStackTrace();
   }  
%>
<%=line %>
</body>
</html>