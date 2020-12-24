package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.MemberDao;

public class IdAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String email = request.getParameter("email");
		MemberDao dao = new MemberDao();
		String id = dao.idSearch(email);
		String msg = "�˼����� ���� �߻�";
		String url = "../member/idForm.me";
		if(id == null) {
			msg = "������ �´� id�� ã�� �� �����ϴ�...";
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward();
		}else {
			request.setAttribute("id", id.substring(0,2) + "**");
			msg = "id�� ã�ҽ��ϴ�!";
			url = "../member/id.me";
			return new ActionForward();
		}
	}

}
