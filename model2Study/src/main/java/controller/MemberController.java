package controller;

import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gdu.mskim.MskimRequestMapping;
import gdu.mskim.RequestMapping;
import model.member.Member;
import model.member.MemberDao;
//http://localhost:8080/model2Study/member/joinForm
@WebServlet(urlPatterns= {"/member/*"},
initParams= {@WebInitParam(name="view",value="/view/")})
public class MemberController extends MskimRequestMapping{
	private MemberDao dao = new MemberDao();
	/*
	   1. 파라미터 정보를 Member 객체에 저장. 인코딩 필요(Filter 이용)
	   2. Member 객체를 이용하여 db에 insert (member 테이블) 저장
	   3. 가입성공 : 성공 메세지 출력 후 loginForm 페이지 이동
	      가입실패 : 실패 메세지 출력 후 joinForm 페이지 이동
	 	 */
		@RequestMapping("join") //http://localhot:8080/model2Study/member/join
		public String join(HttpServletRequest request,
				HttpServletResponse response) {
			Member mem = new Member();
			mem.setId(request.getParameter("id"));
			mem.setPass(request.getParameter("pass"));
			mem.setName(request.getParameter("name"));
			mem.setGender(Integer.parseInt(request.getParameter("gender")));
			mem.setTel(request.getParameter("tel"));
			mem.setEmail(request.getParameter("email"));
			mem.setPicture(request.getParameter("picture"));
			if(dao.insert(mem)) {
				request.setAttribute("msg", mem.getName()+"님 회원 가입 되었습니다.");
				request.setAttribute("url", "loginForm");
			} else {
				request.setAttribute
				("msg", mem.getName()+"님 회원가입시 오류 발생했습니다.");
	 	        request.setAttribute("url", "joinForm");
			}
			return "alert"; //view의 이름
		}	
}
