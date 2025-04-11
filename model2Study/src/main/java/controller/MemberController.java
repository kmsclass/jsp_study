package controller;

import java.util.List;

import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gdu.mskim.MSLogin;
import gdu.mskim.MskimRequestMapping;
import gdu.mskim.RequestMapping;
import model.member.Member;
import model.member.MemberDao;
/*
http://localhost:8080/model2Study/member/joinForm
http://localhost:8080/model2Study/member/loginForm
=> @RequestMapping("joinForm") => 필요
   구현되지 않은 경우 
   /member/joinForm url 정보를 이용하여 /wepapp/view/member/joinForm.jsp 페이지가 
    View 로 설정되도록 구현 
   /member/loginForm url 정보를 이용하여 /wepapp/view/member/loginForm.jsp 페이지가 
    View 로 설정되도록 구현 
*/

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
		@RequestMapping("login")
		public String login(HttpServletRequest request, HttpServletResponse response) {
			String id = request.getParameter("id");
			String pass = request.getParameter("pass");
			Member mem = dao.selectOne(id);
			String msg = null;
			String url = null;
			if (mem == null) {
				msg = "아이디를 확인하세요";
				url = "loginForm";
			} else if (!pass.equals(mem.getPass())) {
				msg = "비밀번호를 확인하세요";
				url = "loginForm";
			} else {
				msg = mem.getName()+"님 반갑습니다";
				url = "main";
				request.getSession().setAttribute("login", id);
			}
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return "alert";
		}
		@RequestMapping("main")
		public String main(HttpServletRequest request, HttpServletResponse response) {
			String login = (String)request.getSession().getAttribute("login");
			if(login == null || login.trim().equals("")) {
				request.setAttribute("msg", "로그인 하세요");
				request.setAttribute("url", "loginForm");
				return "alert";
			}
			return "member/main"; //forward 됨
		}
		@RequestMapping("logout")
		public String logout
		   (HttpServletRequest request, HttpServletResponse response) {
			request.getSession().invalidate();
			return "redirect:loginForm"; //redirect 하도록 설정
		}
		/*
   1. 로그인 상태 검증 => @MSLogin("loginIdCheck")
      loginIdCheck() 함수를 호출하여 검증실행
      리턴값이 null인 경우 info() 호출함
      로그아웃상태 : 로그인하세요 메세지, loginForm 페이지로 이동
      로그인 상태 :
         - 다른 id를 조회할 수 없음. 단 관리자는 다른 id 조회가능함
           내정보만 조회 가능합니다. 메세지 출력. main 페이지 이동
   2. id 파라미터 조회
   3. id에 해당하는 레코드를 조회하여 Member 객체에 저장(mem)   
		 */
		@RequestMapping("info")
		@MSLogin("loginIdCheck")
		public String info(HttpServletRequest request, HttpServletResponse response) {
			//실행되는 경우는 로그인 검증이 완료된 경우
			String id = request.getParameter("id");
			Member member = dao.selectOne(id);
			request.setAttribute("mem", member);
			return "member/info";
		}
		@RequestMapping("updateForm")
		@MSLogin("loginIdCheck")
		public String updateForm(HttpServletRequest request, HttpServletResponse response) {
			String id = request.getParameter("id");
			Member member = dao.selectOne(id);
			request.setAttribute("mem", member);
			return "member/updateForm";
		}
		/*
   1. 모든 파라미터를 Member 객체에 저장하기
   2. 입력된 비밀번호와 db에 저장된 비밀번호 비교.
       관리자로 로그인 한 경우 관리자비밀번호로 비교
       본인 정보 수정시 본인의 비밀번호로 비교
       불일치 : '비밀번호 오류' 메세지 출력후 updateForm 페이지 이동 
   3. Member 객체의 내용으로 db를 수정하기 : boolean MemberDao.update(Member)
       - 성공 : 회원정보 수정 완료 메세지 출력후 info로 페이지 이동
       - 실패 : 회원정보 수정 실패 메세지 출력 후 updateForm 페이지 이동     
		 */
		@RequestMapping("update")
		@MSLogin("loginIdCheck")
		public String update(HttpServletRequest request, HttpServletResponse response) {
		   Member mem = new Member();
		   mem.setId(request.getParameter("id"));
		   mem.setPass(request.getParameter("pass"));
		   mem.setName(request.getParameter("name"));
		   mem.setGender(Integer.parseInt(request.getParameter("gender")));
		   mem.setTel(request.getParameter("tel"));
		   mem.setEmail(request.getParameter("email"));
		   mem.setPicture(request.getParameter("picture"));
		   //2 비밀번호를 위한 db의 데이터 조회. : login 정보로 조회하기
		   String login = (String)request.getSession().getAttribute("login");
		   Member dbMem = dao.selectOne(login);
		   String msg = "비밀번호가 틀립니다.";
		   String url = "updateForm?id=" + mem.getId();
		   if(mem.getPass().equals(dbMem.getPass())) {
			   if(dao.update(mem)) {
				   msg = "회원정보 수정완료";
				   url = "info?id=" + mem.getId();
			   } else {
				   msg = "회원정보 수정실패";
			   }
		   }
		   request.setAttribute("msg", msg);
		   request.setAttribute("url", url);
		   return "alert";
		}
		@RequestMapping("deleteForm")
		@MSLogin("loginIdCheck")
		public String deleteForm(HttpServletRequest request,
				HttpServletResponse response) {
			String id = request.getParameter("id");
			if (id.equals("admin")) {
				request.setAttribute("msg", "관리자는 탈퇴할 수 없습니다.");
				request.setAttribute("url", "info?id="+id);
				return "alert";
			}
			return "member/deleteForm";
		}
		/*
  1. 2개의 파라미터 정보 변수 저장
  2. 로그인정보 검증
     - 로그아웃상태 : 로그인하세요. loginForm.jsp로 페이지 이동
     - 본인만 탈퇴가능(관리자는 제외) : 본인만 탈퇴 가능합니다. main.jsp 페이지 이동
     - 관리자가 탈퇴는 불가 : 관리자는 탈퇴불가합니다. list.jsp로 페이지 이동
  3. 비밀번호 검증
     - 로그인 정보로 비밀번호 검증. 
     - 비밀번호 불일치 : 비밀번호 오류 메세지 출력. deleteForm.jsp로 페이지 이동
  4. db에서 id에 해당하는 회원정보 삭제하기
     boolean MemberDao.delete(id)
     탈퇴 성공 
       - 일반사용자 : 로그아웃실행. 탈퇴메세지 출력, loginForm.jsp로 페이지 이동
       - 관리자    : 탈퇴메세지 출력. list.jsp로 페이지 이동
     탈퇴 실패      
       - 일반사용자 : 탈퇴실패메세지 출력, main.jsp로 페이지 이동
       - 관리자    : 탈퇴실패메세지 출력. list.jsp로 페이지 이동
		 */
		@RequestMapping("delete")
		@MSLogin("loginIdCheck")
		public String delete(HttpServletRequest request,
				HttpServletResponse response) {
			String id = request.getParameter("id");
			String pass = request.getParameter("pass");
			String login = (String)request.getSession().getAttribute("login");
			if (id.equals("admin")) {
				request.setAttribute("msg", "관리자는 탈퇴할 수 없습니다.");
				request.setAttribute("url", "info?id="+id);
				return "alert";
			}
			Member dbMem = dao.selectOne(login);
			String msg = "비밀번호 오류 입니다.";
			String url = "deleteForm?id=" + id;
			if(pass.equals(dbMem.getPass())) {
				if(login.equals("admin")) url = "list";
				if(dao.delete(id)) {
					msg = id + "회원 탈퇴 성공";
					if(!login.equals("admin")) {
						request.getSession().invalidate();
						url = "loginForm";
					}					
				} else {
					msg = id + "회원 탈퇴 실패";
					if(!login.equals("admin")) {
						url = "main";
					}					
				}
			}
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return "alert";
		}
	   @RequestMapping("list")
	   @MSLogin("loginAdminCheck")
	   public String list(HttpServletRequest request,
			   HttpServletResponse response) {
		   //관리자로 로그인한 경우만 실행
		   List<Member> list = dao.list();
		   request.setAttribute("list", list);
		   return "member/list";
	   }		
//================================================
		public String loginAdminCheck(HttpServletRequest request,
				HttpServletResponse response) {
			String login=(String)request.getSession().getAttribute("login");
			if(login==null) {
				request.setAttribute("msg", "로그인 하세요");
				request.setAttribute("url", "loginForm");
				return "alert";
			} else if (!login.equals("admin")) {
				request.setAttribute("msg", "관리자만 가능한 업무입니다.");
				request.setAttribute("url", "main");
				return "alert";			
			}
			return null;
		}
		public String loginIdCheck
		   (HttpServletRequest request, HttpServletResponse response) {
			String id = request.getParameter("id");
			String login=(String)request.getSession().getAttribute("login");
			if(login==null) {
				request.setAttribute("msg", "로그인 하세요");
				request.setAttribute("url", "loginForm");
				return "alert";
			} else if (!login.equals("admin") && !id.equals(login)) {
				request.setAttribute("msg", "본인만 거래 가능합니다.");
				request.setAttribute("url", "main");
				return "alert";			
			}
			return null; //정상인 경우
		}
		
}
