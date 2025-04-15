<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/member/picture.jsp--%>    
<script>
   img = opener.document.getElementById("pic"); 
   img.src = "../picture/${fname}";
   /*
      info.jsp : picture => ../picture
      updateForm.jsp : picture => ../picture
   */
   opener.document.f.picture.value = "${fname}";
   self.close();
</script>