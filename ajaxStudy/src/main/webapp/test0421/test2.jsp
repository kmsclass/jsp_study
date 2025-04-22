<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String snum = request.getParameter("num");
   String kbn =  request.getParameter("kbn");
   int num = Integer.parseInt(snum);
   int sum=0;
   String msg = null;
   switch(kbn) {
      case "0" :  msg = "전체합계:"; break;
      case "1" :  msg = "짝수합계:"; break;
      case "2" :  msg = "홀수합계:"; break;
   }
   for(int i=1;i<=num;i++) {
	   switch(kbn) {
	   case "0" : sum += i;
	              break;
	   case "1" : if(i%2==0) sum += i;
	              break;
	   case "2" : if(i%2==1) sum += i;break;
	   }
   }
%>
<%= msg + sum%>