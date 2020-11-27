package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.MemberDao;

public class PwAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		MemberDao dao = new MemberDao();
		String pass = dao.pwSearch(id,email,tel);
		String msg = "�˼����� ���� �߻�";
		String url = "pwForm.me";
		if(id == null) {
			msg = "������ �´� id�� ã�� �� �����ϴ�...";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward();
		}else {
			request.setAttribute("pass", "**" + pass.substring(pass.length()-2,pass.length()));
			msg = "pw�� ã�ҽ��ϴ�!";
			url = "pw.me";
			return new ActionForward();
		}
	}

}
