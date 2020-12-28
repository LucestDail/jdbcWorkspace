package action.board;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import action.ActionForward;
import model.Board;
import model.BoardDao;
import model.Comment;
import model.CommentDao;


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
		String path = request.getServletContext().getRealPath("/") + "movie/board/file/";
		File f = new File(path);
		if (!f.exists()) {
			f.mkdirs();
		}
		int size = 10 * 1024 * 1024;
		MultipartRequest multi;
		try {
			multi = new MultipartRequest(request, path, size, "euc-kr");
			int board_type = Integer.parseInt((String)request.getSession().getAttribute("board_type"));
			String member_id = (String) request.getSession().getAttribute("login");
			System.out.println("request board type : " + board_type);
			Board board = new Board();
			int num = dao.maxnum(board_type);
			board.setBoard_num(++num);
			board.setMember_id(member_id);
			board.setBoard_notice_able(Integer.parseInt(multi.getParameter("board_notice_able")));
			board.setBoard_subject(multi.getParameter("board_subject"));
			board.setBoard_content(multi.getParameter("board_content"));
			board.setBoard_attached_file(multi.getFilesystemName("board_attached_file"));
			//regdate : now()
			//readcnt : default 0
			board.setBoard_type(board_type);
			//board.setActivity_able(Integer.parseInt(multi.getParameter("activity_able")));
			board.setActivity_type(multi.getParameter("activity_type"));
			//board.setGive_state(Integer.parseInt(multi.getParameter("give_state")));
			//board.setGive_type(Integer.parseInt(multi.getParameter("give_type")));
			//board.setInformation_type(Integer.parseInt("information_type"));
			//board.setGive_information_type(Integer.parseInt(multi.getParameter("give_information_type")));
			board.setArea_name(multi.getParameter("area_name"));
			board.setArea_xpoint(multi.getParameter("area_xpoint"));
			board.setArea_ypoint(multi.getParameter("area_ypoint"));
			board.setArea_name_specific(multi.getParameter("area_name_specific"));
			/*
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			try {
				board.setDate_start_date(sf.parse(multi.getParameter("date_start_date")));
				board.setDate_end_date(sf.parse(multi.getParameter("date_end_date")));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			*/
			//board.setScore_category_a(Integer.parseInt(multi.getParameter("score_category_a")));
			//board.setScore_category_b(Integer.parseInt(multi.getParameter("score_category_b")));
			//board.setScore_category_c(Integer.parseInt(multi.getParameter("score_category_c")));
			//board.setScore_category_d(Integer.parseInt(multi.getParameter("score_category_d")));
			//board.setAlert_count(Integer.parseInt(multi.getParameter("alert_count")));
			//board.setRecommand_count(Integer.parseInt(multi.getParameter("recommand_count")));
			//board.setNot_recommand_count(Integer.parseInt(multi.getParameter("not_recommand_count")));
			board.setMovie_subject(multi.getParameter("movie_subject"));
			//board.setMovie_id(Integer.parseInt(multi.getParameter("movie_id")));
			if (dao.insert(board)) {
				dao.addPoint(member_id, board_type, 10);
				return new ActionForward(true, "list.do?board_type="+request.getSession().getAttribute("board_type"));
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String msg = "�Խù� ��� ����";
		String url = "writeForm.do?board_type="+request.getSession().getAttribute("board_type");
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
		String board_type = request.getParameter("board_type");
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
     	int boardcount = dao.boardCount(column, find, board_type); // ��ü �Խù� ��� �Ǽ��� ����
     	//pageNum�� ��µ� �Խù� 10���� List ��ü�� ����
     	List<Board> list = dao.list(pageNum,limit, column, find, board_type);
     	System.out.println(list);
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
     	request.setAttribute("boardcount", boardcount);
     	request.setAttribute("list", list);
     	request.setAttribute("pageNum", pageNum);
     	request.setAttribute("maxpage", maxpage);
     	request.setAttribute("startpage", startpage);
     	request.setAttribute("endpage", endpage);
     	request.setAttribute("boardnum", boardnum);
     	request.setAttribute("today", today);
     	request.getSession().setAttribute("board_type",board_type);
     	System.out.println("current board type : " + board_type);
		return new ActionForward();
	}
	
	public ActionForward info(HttpServletRequest request, HttpServletResponse response) {
    	String board_num = request.getParameter("board_num");
    	System.out.println("info Action activated -> " + board_num);
    	BoardDao dao = new BoardDao();
    	Board infoBoard = dao.selectOne(board_num);
    	dao.readcntAdd(board_num);
    	request.setAttribute("infoBoard", infoBoard);
    	
    	
    	CommentDao cdao = new CommentDao();
    	List<Comment> listComment = cdao.select(board_num);
    	request.setAttribute("listComment", listComment);
		return new ActionForward();
	}
	
	
	public ActionForward replyForm(HttpServletRequest request, HttpServletResponse response){
		String num = request.getParameter("num");
		BoardDao dao = new BoardDao();
		Board b = dao.selectOne(num);
		request.setAttribute("b", b);
		return new ActionForward();
	}
	/*
	public ActionForward reply(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String path = request.getServletContext().getRealPath("/") + "movie/board/file/";
		File f = new File(path);
		if(!f.exists()){
			f.mkdirs();
		}
		int size = 10*1024*1024;
		MultipartRequest multi = new MultipartRequest(request, path, size, "euc-kr");
		Board board = new Board();
		String boardname = multi.getParameter("boardname");
		board.setNum(Integer.parseInt(multi.getParameter("num")));
		board.setName(multi.getParameter("name"));
		board.setPass(multi.getParameter("pass"));
		board.setSubject(multi.getParameter("subject"));
		board.setContent(multi.getParameter("content"));
		board.setFile1(multi.getFilesystemName("file1"));
		board.setGrp(Integer.parseInt(multi.getParameter("grp")));
		board.setGrplevel(Integer.parseInt(multi.getParameter("grplevel")));
		board.setGrpstep(Integer.parseInt(multi.getParameter("grpstep")));
		dao.grpStepAdd(board.getGrp(),board.getGrpstep(), boardname);
		int grplevel = board.getGrplevel();
		int grpstep = board.getGrpstep();
		int num = dao.maxnum(boardname);
		String msg = "�亯��Ͻ� ���� �߻�";
		String url = "replyForm.do?num="+board.getNum() + "&&boardname=" + boardname;
		
		board.setNum(++num);
		board.setGrplevel(grplevel + 1);
		board.setGrpstep(grpstep + 1);
		if(dao.insert(board,boardname)){
			msg = "�亯��� �Ϸ�";
			url = "list.do" + "?boardname=" + boardname;
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}
	*/
	
	public ActionForward updateForm(HttpServletRequest request, HttpServletResponse response){
		System.out.println("updateForm ActionForward activated");
		String num = request.getParameter("num");
		BoardDao dao = new BoardDao();
		Board b = dao.selectOne(num);
		request.setAttribute("b", b);
		return new ActionForward();
	}
	
	public ActionForward update(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Board board = new Board();
		String path = request.getServletContext().getRealPath("/") + "movie/board/file/";
		File f = new File(path);
		if(!f.exists()){
			f.mkdirs();
		}
		
		int size = 10*1024*1024;
		MultipartRequest multi = new MultipartRequest(request, path, size, "euc-kr");
		String board_num = multi.getParameter("board_num");
		System.out.println("update activated -> " + board_num + " from " + (String) request.getSession().getAttribute("board_type"));
		board.setBoard_num(Integer.parseInt(board_num));
		String member_id = (String) request.getSession().getAttribute("login");
		board.setMember_id(member_id);
		board.setBoard_notice_able(Integer.parseInt(multi.getParameter("board_notice_able")));
		board.setBoard_subject(multi.getParameter("board_subject"));
		board.setBoard_content(multi.getParameter("board_content"));
		board.setBoard_attached_file(multi.getFilesystemName("board_attached_file"));
		if(board.getBoard_attached_file() == null || board.getBoard_attached_file().equals("")){
			board.setBoard_attached_file(multi.getParameter("board_attached_file_temp"));
		}
		BoardDao dao = new BoardDao();
		Board dbBoard = dao.selectOne(board_num);
		int board_type = dbBoard.getBoard_type();
		String msg = "�Խù� ���� ����.";
		String url = "updateForm.do?board_num="+board_num;
		if(dao.update(board)){
			msg = "�Խù� ���� �Ϸ�";
			url = "info.do?board_num=" + board_num + "&&board_type=" + board_type;
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}
	
	public ActionForward deleteForm(HttpServletRequest request, HttpServletResponse response){
		String num = request.getParameter("board_num");
		BoardDao dao = new BoardDao();
		Board b = dao.selectOne(num);
		request.setAttribute("b", b);
		return new ActionForward();
	}
	
	public ActionForward delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("euc-kr");
		String board_type = request.getParameter("board_type");
		String board_num = request.getParameter("board_num");
		BoardDao dao = new BoardDao();
		String msg = "�Խñ� ���� ����";
		String url = "info.do?board_num="+board_num + "&&board_type=" + board_type;
		if(dao.delete(board_num)){
			msg = "�Խñ� ���� ����!";
			url = "list.do?board_type=" + board_type;
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}
	
	public ActionForward imgupload(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String path = request.getServletContext().getRealPath("/") + "movie/board/imgfile/";
		File f = new File(path);
		if(!f.exists()){
			f.mkdirs();
		}
		int size = 10*1024*1024;
		MultipartRequest multi = new MultipartRequest(request, path, size, "euc-kr");
		//upload : ckeditor ���� �����Ͽ���!
		String fileName = multi.getFilesystemName("upload");
		request.setAttribute("fileName",  fileName);
		request.setAttribute("CKEditorFuncNum", request.getParameter("CKEditorFuncNum"));
		return new ActionForward(false, "ckeditor.jsp");
	}
	
	public ActionForward graph(HttpServletRequest request, HttpServletResponse response) throws IOException{
		System.out.println("BoardAction - graph activated");
		List<Map<String, Object>> list = dao.boardgraph();
		System.out.println(list);
		StringBuilder json = new StringBuilder("[");
		int i = 0;
		for(Map<String,Object> m : list) {
			for(Map.Entry<String, Object> map : m.entrySet()) {
				if(map.getKey().equals("name")) {
					json.append("{\"name\":\"" + map.getValue() + "\"");
				}
				if(map.getKey().equals("cnt")) {
					json.append("\"cnt\":" + map.getValue() + "}");
				}
				i++;
				if(i/2 < list.size()) {
					json.append(",");
				}
				
			}
			
		}
		json.append("]");
		request.setAttribute("json", json.toString().trim());
		return new ActionForward();
	}
	
	public ActionForward commentwrite(HttpServletRequest request, HttpServletResponse response) {
		Comment comment = new Comment();
		String member_id = request.getParameter("member_id");
		String board_num = request.getParameter("board_num");
		int board_type = Integer.parseInt(request.getParameter("board_type"));
		System.out.println("commentwrite function -> " + member_id + " : " + board_num);
		comment.setBoard_num(Integer.parseInt(board_num));
		comment.setMember_id(member_id);
		comment.setComment_content(request.getParameter("comment_content"));
		
		String msg = "��� ��� ����";
		String url = "info.do?board_num="+board_num+"&&board_type="+board_type;
		
		if(new CommentDao().insert(comment)) {
			new CommentDao().addPoint(member_id, board_type, 5);
			msg = "��� ��� ����";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
	
	public ActionForward updateComment(HttpServletRequest request, HttpServletResponse response) {
		Comment comment = new Comment();
		String comment_num = request.getParameter("comment_num");
		String comment_content = request.getParameter("comment_content");
		System.out.println("commentUpdate function -> " + comment_num + " : " + comment_content);
		comment.setComment_num(Integer.parseInt(comment_num));
		comment.setComment_content(comment_content);
		Comment curComment = new CommentDao().selectOne(Integer.parseInt(comment_num));
		String msg = "��� ���� ����";
		String url = "info.do?board_num=" + curComment.getBoard_num();
		if(new CommentDao().update(comment)) {
			msg = "��� ���� ����";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
	
	public ActionForward deleteComment(HttpServletRequest request, HttpServletResponse response) {
		Comment comment = new Comment();
		String comment_num = request.getParameter("comment_num");
		System.out.println("commentDelete function -> " + comment_num);
		Comment curComment = new CommentDao().selectOne(Integer.parseInt(comment_num));
		String msg = "��� ���� ����";
		String url = "info.do?board_num=" + curComment.getBoard_num();
		if(new CommentDao().delete(comment_num)) {
			msg = "��� ���� ����";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
}
