package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
/**
 * 1. �α��� ���� ����
 * 2. �α׾ƿ� �ϼ̽��ϴ� �޽��� ��� �� loginForm.me �������� �̵�
 * @author dhtmd
 *
 */
public class LogoutAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.getSession().invalidate();
		request.setAttribute("msg", "�α׾ƿ��ϼ̽��ϴ�");
		request.setAttribute("url", "../board/index.do");
		return new ActionForward(false,"../board/index.do");
	}

}
