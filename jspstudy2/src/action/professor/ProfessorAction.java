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
		 *  1. ���������� ��µǴ� �Խñ��� 10�������� -> pageNum �Ķ���Ͱ� ����, ���� ���� 1�� ����
    		2. �ֱ� ��ϵ� �Խù��� ���� ���� ��ġ
    		3. db���� �ش� �������� ��µ� ������ ��ȸ�Ͽ� ȣ�鿡 ���, �Խù��� ��� �κ�, ������ ���� ��� �κ�
		 */
		int pageNum = 1;
     	try{
     		pageNum = Integer.parseInt(request.getParameter("pageNum"));
     	}catch(NumberFormatException e){
     		//����...
     	}
     	String column = request.getParameter("column");
     	String find = request.getParameter("find");
     	if(column == null || column.trim().equals("")||find == null || find.trim().equals("")) {
     		column = null;
     		find = null;
     	}
     	int limit = 10;
     	int boardcount = dao.professorCount(column, find); // ��ü �Խù� ��� �Ǽ��� ����
     	//pageNum�� ��µ� �Խù� 10���� List ��ü�� ����
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
