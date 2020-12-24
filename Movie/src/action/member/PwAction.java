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
		MemberDao dao = new MemberDao();
		String pass = dao.pwSearch(id,email);
		String msg = "�˼����� ���� �߻�";
		String url = "../member/pwForm.me";
		if(id == null) {
			msg = "������ �´� id�� ã�� �� �����ϴ�...";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward();
		}else {
			request.setAttribute("password", "**" + pass.substring(pass.length()-2,pass.length()));
			msg = "pw�� ã�ҽ��ϴ�!";
			url = "../member/pw.me";
			return new ActionForward();
		}
	}

}
