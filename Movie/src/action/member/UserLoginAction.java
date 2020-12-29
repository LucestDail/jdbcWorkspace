package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
/**
 * �α��� �Ǿ��ִ� ��� doExecute ȣ��
 * �α׾ƿ� ������ ���� �ٷ� login �ϼ��� �޽��� ��� �� loginForm.me �� ������ �̵�
 * �α����� �Ǿ�������, �Ķ���� id ������ ��쿡�� �α��� �Ǿ����ϴ� (�α��� ����, �Ķ���� ���� ��) �ٸ� ���(�����ڰ� �ƴ� ���)���� ������ ��ȸ �����մϴ�... -> main.me �� �̵�
 * @author dhtmd
 *
 */
public abstract class UserLoginAction implements Action {
	protected String login;
	protected String id;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		login = (String)request.getSession().getAttribute("login");
		id = request.getParameter("id");
		if(login == null) {
			request.setAttribute("msg", "�α��� �ϼ���...");
			request.setAttribute("url", "../member/loginForm.me");
			return new ActionForward(false,"../alert.jsp");
		}
		if(id != null && !id.equals(login) && !login.equals("admin")) {
			request.setAttribute("msg", "���θ� Ȯ�� �����մϴ�...");
			request.setAttribute("url", "../board/index.do");
			return new ActionForward(false,"../alert.jsp");
		}
		return doExecute(request, response);
	}
	public abstract ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
