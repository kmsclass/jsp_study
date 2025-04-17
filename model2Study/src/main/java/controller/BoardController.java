package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import gdu.mskim.MskimRequestMapping;
import gdu.mskim.RequestMapping;
import model.board.Board;
import model.board.BoardDao;

@WebServlet(urlPatterns= {"/board/*"},
    initParams= {@WebInitParam(name="view",value="/view/")})
public class BoardController extends MskimRequestMapping{
	private BoardDao dao = new BoardDao();
	
	@RequestMapping("write")
	public String write(HttpServletRequest request,
			HttpServletResponse response) {
		//파일업로드 되는 폴더설정
	   String path=request.getServletContext().getRealPath("/") +"/upload/board/";
	   File f = new File(path);
	   if(!f.exists()) f.mkdirs(); //폴더 생성.
	   //mkdir()   : 한단계 폴더만 생성
	   //mkdirs()  : 여러단계 폴더만 생성
	   
	   int size=10*1024*1024; //10M. 업로드파일의 최대 크기
	   MultipartRequest multi = null;
	   try {
		   multi = new MultipartRequest(request,path,size,"UTF-8");
	   } catch(IOException e) {
		   e.printStackTrace();
	   }
	   //파라미터값 저장
	   Board board = new Board();
	   board.setWriter(multi.getParameter("writer"));
	   board.setPass(multi.getParameter("pass"));
	   board.setTitle(multi.getParameter("title"));	   
	   board.setContent(multi.getParameter("content"));
	   board.setFile1(multi.getFilesystemName("file1")); //업로드된 파일이름
	   //시스템에서 필요한 정보를 저장
	   String boardid = (String)request.getSession().getAttribute("boardid");
	   if(boardid==null) boardid="1"; //공지사항 기본 게시판 설정
	   board.setBoardid(boardid); //게시판 종류 : 1:공지사항, 2: 자유게시판
	   if(board.getFile1()==null) board.setFile1(""); //업로드 파일이 없는 경우
	   
	   int num = dao.maxnum();  //등록된 게시글의 최대 num값
	   board.setNum(++num); //게시글키값. 게시글번호.
	   board.setGrp(num);   //그룹번호. 원글인 경우 그룹번호와 게시글번호가 같다
	   String msg = "게시물 등록 실패";
	   String url = "writeForm";
	   if(dao.insert(board)) { //게시글 등록 성공
		   return "redirect:list?boardid="+boardid;
	   }
	   //게시글 등록 실패
	   request.setAttribute("msg", msg);
	   request.setAttribute("url", url);
	   return "alert";
	}
	/*
	 * 1. 한페이지당 10건의 게시물 출력하기. 
	 *    pageNum 파라미터값 => 없는 경우 1로 설정
	 *    boardid 파라미터값 => 있는 경우 session에 boardid값으로 등록
	 * 2. 최근 등록된 게시물이 가장 위쪽에 출력함
	 * 3. db에서 해당페이지에 출력될 내용만 조회하여 화면에 출력함
	 */
	@RequestMapping("list")
	public String list(HttpServletRequest request,
			HttpServletResponse response) {
		int pageNum = 1;
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		} catch (NumberFormatException e) {}
		String boardid = request.getParameter("boardid");
		if(boardid == null || boardid.trim().equals("")) {
			boardid = "1";
		} else {
			request.getSession().setAttribute("boardid", boardid);
		}
		boardid = (String)request.getSession().getAttribute("boardid");
		int limit = 10;
		int boardcount = dao.boardCount(boardid); //등록된 게시물 건수 
		List<Board> list = dao.list(boardid,pageNum,limit);
	    int maxpage = (int)((double)boardcount/limit + 0.95);
	    int startpage=((int)(pageNum/10.0 + 0.9) - 1) * 10 + 1;
	    int endpage = startpage + 9; 
	    if(endpage > maxpage) endpage = maxpage;
	    String boardName = "공지사항";
	    if (boardid.equals("2")) 
			boardName = "자유게시판";
	    request.setAttribute("boardName", boardName);
	    request.setAttribute("boardcount", boardcount);
	    request.setAttribute("boardid", boardid);
	    request.setAttribute("pageNum", pageNum);
	    request.setAttribute("list", list);
	    request.setAttribute("startpage", startpage);
	    request.setAttribute("endpage", endpage);
	    request.setAttribute("maxpage", maxpage);
	    return "board/list";
	}
}
