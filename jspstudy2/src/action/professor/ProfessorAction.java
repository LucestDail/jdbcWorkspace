package action.professor;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.Professor;
import model.ProfessorDao;

public class ProfessorAction {
	ProfessorDao dao = new ProfessorDao();
	public ActionForward list(HttpServletRequest request, HttpServletResponse response) {
		/**
		 *  1. 한페이지당 출력되는 게시글은 10개까지만 -> pageNum 파라매터값 저장, 없는 경우는 1로 설정
    		2. 최근 등록된 게시물이 가장 위에 배치
    		3. db에서 해당 페이지에 출력된 내용을 조회하여 호면에 출력, 게시물을 출력 부분, 페이지 구분 출력 부분
		 */
		int pageNum = 1;
     	try{
     		pageNum = Integer.parseInt(request.getParameter("pageNum"));
     	}catch(NumberFormatException e){
     		//없엉...
     	}
     	String column = request.getParameter("column");
     	String find = request.getParameter("find");
     	if(column == null || column.trim().equals("")||find == null || find.trim().equals("")) {
     		column = null;
     		find = null;
     	}
     	int limit = 10;
     	int boardcount = dao.professorCount(column, find); // 전체 게시물 등록 건수를 리턴
     	//pageNum에 출력될 게시물 10개를 List 객체로 리턴
     	List<Professor> list = dao.list(pageNum,limit, column, find);

     	int maxpage = (int)((double)boardcount/limit + 0.95);
     	int startpage = ((int)(pageNum/10.0 + 0.9) - 1) * 10 + 1;
     	int endpage = startpage + 9;
     	if(endpage > maxpage){
     		endpage = maxpage;
     	}
     	int boardnum = boardcount - (pageNum - 1) * limit;
     	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sf.format(new Date());
     	request.setAttribute("boardcount", boardcount);
     	request.setAttribute("list", list);
     	request.setAttribute("pageNum", pageNum);
     	request.setAttribute("maxpage", maxpage);
     	request.setAttribute("startpage", startpage);
     	request.setAttribute("endpage", endpage);
     	request.setAttribute("boardnum", boardnum);
     	request.setAttribute("today", today);
		return new ActionForward();
	}

}
