<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/member/update.jsp 
   1. 모든 파라미터를 Member 객체에 저장하기
   2. 입력된 비밀번호와 db에 저장된 비밀번호 비교.
       관리자인 경우 관리자비밀번호로 비교
       불일치 : '비밀번호 오류' 메세지 출력후 updateForm.jsp 페이지 이동 
   3. Member 객체의 내용으로 db를 수정하기 : boolean MemberDao.update(Member)
       - 성공 : 회원정보 수정 완료 메세지 출력후 info.jsp로 페이지 이동
       - 실패 : 회원정보 수정 실패 메세지 출력 후 updateForm.jsp 페이지 이동     
--%>    
