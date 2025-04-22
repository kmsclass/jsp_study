package controller;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gdu.mskim.MskimRequestMapping;
import gdu.mskim.RequestMapping;

@WebServlet(urlPatterns= {"/ajax/*"},
 initParams= {@WebInitParam(name="view",value="/view/")})
public class AjaxController extends MskimRequestMapping{
  @RequestMapping("select")
  public String select (HttpServletRequest request,HttpServletResponse response) {
	BufferedReader fr = null;
	//path : sido.txt 파일의 절대 경로
	String path =request.getServletContext().getRealPath("/")+ "file/sido.txt";
	try {
		fr = new BufferedReader(new FileReader(path));
	}catch (IOException e) {
		e.printStackTrace();
	}
	//LinkedHashSet : 중복불가. 순서유지. 인덱스사용불가 
	Set<String> set = new LinkedHashSet<>();
	String data = null;
	try {
	  while((data=fr.readLine()) != null) {
		  // \\s+ : 정규식표현. 공백한개이상
			String[] arr = data.split("\\s+");
			if(arr.length >=3) set.add(arr[0].trim());
	  }
	} catch(IOException e) {
		e.printStackTrace();
	}
	request.setAttribute("list", new ArrayList<String>(set));
	request.setAttribute("len", set.size());
	return "ajax/select";
  }
}
