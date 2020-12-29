package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.Member;
import model.MemberDao;

public class DeleteAction extends UserLoginAction{

	@Override
	public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(id.equals("admin")) {
			request.setAttribute("msg", "�����ڴ� Ż�� �Ұ����մϴ�...");
			request.setAttribute("url", "../board/index.do");
			return new ActionForward(false, "../alert.jsp");
		}
		
		String pass = request.getParameter("password");
		System.out.println(id + "," + pass);
		String msg = null;
		String url = null;
		
		if(login.equals("admin")) {
			url = "../member/list.me";
		}else {
			url = "../Movie/index.jsp";
		}
		
		MemberDao dao = new MemberDao();
		Member dbmember =null;
		dbmember = dao.selectOne(login);
		
		if(pass.equals(dbmember.getMember_password())) {
			if(dao.delete(id) > 0) {
				if(login.equals("admin")) {
					msg = id + " ����� ���� Ż�� ����";
				}else {
					msg = id + " ���� ȸ��Ż�� �Ϸ�Ǿ����ϴ�.";
					request.getSession().invalidate();
				}
			}else {
				msg = id + "���� Ż��� ���� �߻�...";
				if(!login.equals("admin")) {
					url = "../member/info.me?id=" + id;
				}
			}
		}else {
			msg = login + "���� ��й�ȣ�� Ʋ���ϴ�...";
			url = "../member/deleteForm.me?id="+id;
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}

}
