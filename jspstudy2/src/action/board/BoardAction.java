package action.board;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import action.ActionForward;
import model.Board;
import model.BoardDao;

public class BoardAction {
	BoardDao dao = new BoardDao();
	public ActionForward hello(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("hello", "Hello World do");
		return new ActionForward();
	}

	/**
	 * 1. �Ķ���� ���� model.Board ��ü ���� -> MultipartRequest ��ü ��� -> useBean ��� �Ұ���! 2.
	 * �Խù� ��ȣ num ���� ��ϵ� num�� �ִ밪�� ��ȸ �ִ밪 + 1 ��ϵ� �Խù����� ��ȣ db���� maxnum ���ؼ� +1 ������
	 * num ���� 3. board ������ db�� ����ϱ� ��ϼ��� : list.do ������ �̵� ��� ���� : �޽���
	 * ���.writeForm.do ������ �̵�
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	public ActionForward write(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getServletContext().getRealPath("/") + "model2/board/file/";
		File f = new File(path);
		if (!f.exists()) {
			f.mkdirs();
		}
		int size = 10 * 1024 * 1024;
		MultipartRequest multi;
		try {
			multi = new MultipartRequest(request, path, size, "euc-kr");
			String noticecheck = multi.getParameter("notice");
			Board board = new Board();
			board.setName(multi.getParameter("name"));
			board.setPass(multi.getParameter("pass"));
			board.setSubject(multi.getParameter("subject"));
			if (noticecheck != null) {
				board.setSubject("<b>[NOTICE]</b>" + multi.getParameter("subject"));
			}
			board.setContent(multi.getParameter("content"));
			board.setFile1(multi.getFilesystemName("file1"));
			int num = dao.maxnum();
			board.setNum(++num);
			board.setGrp(num);
			if (noticecheck != null) {
				board.setGrp(9999);
			}
			if (dao.insert(board)) {
				return new ActionForward(true, "list.do");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String msg = "�Խù� ��� ����";
		String url = "writeForm.do";
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
	
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
     	int limit = 10;
     	int boardcount = dao.boardCount(); // ��ü �Խù� ��� �Ǽ��� ����
     	//pageNum�� ��µ� �Խù� 10���� List ��ü�� ����
     	List<Board> list = dao.list(pageNum,limit);
     	/*
     	startpage : ȭ�鿡 ��µ� ���� ������ ��ȣ
     	���� ������ ����������
     		2	:	1
     	2/10.0 => 0.2 + 0.9 => (int)(1.1) - 1 => 0 * 10 => 0+1 => 1
     		505	:	501
     	505/10.0 => 50.5 + 0.9 => (int)(51.4) - 1 => 50*10 => 500 + 1
     	
     	
     	÷�������� �ִ� ��� @ ǥ���ϱ� -> @ ������ ���� ǥ��
     	���� ��ϵ� �Խù��� ��:��:�ʷ� ����ϱ�
     	���� ����� �ƴ� ���� ��-��-�� ��:������ ����ϱ�
     	
     	����� ��� �鿩���� �� ���� 6�� ��
     	
     	*/
     	int maxpage = (int)((double)boardcount/limit + 0.95);
     	int startpage = ((int)(pageNum/10.0 + 0.9) - 1) * 10 + 1;
     	int endpage = startpage + 9;
     	if(endpage > maxpage){
     		endpage = maxpage;
     	}
     	int boardnum = boardcount - (pageNum - 1) * limit;
     	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sf.format(new Date());
		SimpleDateFormat todayFormat = new SimpleDateFormat("HH:mm:ss");
		SimpleDateFormat notTodayFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
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
	
	public ActionForward info(HttpServletRequest request, HttpServletResponse response) {
    	String num = request.getParameter("num");
    	BoardDao dao = new BoardDao();
    	Board infoBoard = dao.selectOne(num);
    	dao.readcntAdd(num);
    	request.setAttribute("infoBoard", infoBoard);
		return new ActionForward();
	}
	
	
	public ActionForward replyForm(HttpServletRequest request, HttpServletResponse response){
		String num = request.getParameter("num");
		BoardDao dao = new BoardDao();
		Board b = dao.selectOne(num);
		request.setAttribute("b", b);
		return new ActionForward();
	}
	
	public ActionForward reply(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String path = request.getServletContext().getRealPath("/") + "model1/board/file/";
		File f = new File(path);
		if(!f.exists()){
			f.mkdirs();
		}
		int size = 10*1024*1024;
		MultipartRequest multi = new MultipartRequest(request, path, size, "euc-kr");
		Board board = new Board();
		board.setNum(Integer.parseInt(multi.getParameter("num")));
		board.setName(multi.getParameter("name"));
		board.setPass(multi.getParameter("pass"));
		board.setSubject(multi.getParameter("subject"));
		board.setContent(multi.getParameter("content"));
		board.setFile1(multi.getFilesystemName("file1"));
		board.setGrp(Integer.parseInt(multi.getParameter("grp")));
		board.setGrplevel(Integer.parseInt(multi.getParameter("grplevel")));
		board.setGrpstep(Integer.parseInt(multi.getParameter("grpstep")));
		dao.grpStepAdd(board.getGrp(),board.getGrpstep());
		int grplevel = board.getGrplevel();
		int grpstep = board.getGrpstep();
		int num = dao.maxnum();
		String msg = "�亯��Ͻ� ���� �߻�";
		String url = "replyForm.do?num="+board.getNum();
		
		board.setNum(++num);
		board.setGrplevel(grplevel + 1);
		board.setGrpstep(grpstep + 1);
		if(dao.insert(board)){
			msg = "�亯��� �Ϸ�";
			url = "list.do";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}
	
	public ActionForward updateForm(HttpServletRequest request, HttpServletResponse response){
		String num = request.getParameter("num");
		BoardDao dao = new BoardDao();
		Board b = dao.selectOne(num);
		request.setAttribute("b", b);
		return new ActionForward();
	}
	
	public ActionForward update(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Board board = new Board();
		String path = request.getServletContext().getRealPath("/") + "model1/board/file/";
		File f = new File(path);
		if(!f.exists()){
			f.mkdirs();
		}
		
		int size = 10*1024*1024;
		MultipartRequest multi = new MultipartRequest(request, path, size, "euc-kr");
		
		board.setNum(Integer.parseInt(multi.getParameter("num")));
		board.setName(multi.getParameter("name"));
		board.setPass(multi.getParameter("pass"));
		board.setSubject(multi.getParameter("subject"));
		board.setContent(multi.getParameter("content"));
		board.setFile1(multi.getFilesystemName("file1"));
		
		if(board.getFile1() == null || board.getFile1().equals("")){
			board.setFile1(multi.getParameter("file2"));
		}
		BoardDao dao = new BoardDao();
		String numString = board.getNum() + "";
		Board dbBoard = dao.selectOne(numString);
		String msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�.";
		String url = "updateForm.do?num="+board.getNum();
		if(board.getPass().equals(dbBoard.getPass())){
			if(dao.update(board)){
				msg = "�Խù� ���� �Ϸ�";
				url = "info.do?num=" + board.getNum();
			}else{
				msg = "�Խù� ���� ����";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}
	
	public ActionForward deleteForm(HttpServletRequest request, HttpServletResponse response){
		String num = request.getParameter("num");
		BoardDao dao = new BoardDao();
		Board b = dao.selectOne(num);
		request.setAttribute("b", b);
		return new ActionForward();
	}
	
	public ActionForward delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("euc-kr");
		String num = request.getParameter("num");
		String pass = request.getParameter("pass");
		Board board = new Board();
		BoardDao dao = new BoardDao();
		String msg = "�Խñ� ���� ����";
		String url = "info.do?num="+num;
		Board curBoard = dao.selectOne(num);
		if(!pass.equals(curBoard.getPass())){
			msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�.";
			url = "info.do?num="+num;
		}else{
			if(dao.delete(num)){
				msg = "�Խñ� ���� ����!";
				url = "list.do";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}
}