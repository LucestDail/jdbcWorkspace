package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
/**
 * 1. �α׾ƿ� ���� : �α����� �ʿ��մϴ�. �޽��� ���
 * -> loginForm.me �������� �̵�
 * 
 * 2. �α��� ����
 * -> �Ϲ� ����� : �����ڸ� ������ �ŷ��Դϴ�. �޼��� ���. main.me
 * 
 * 3. ������ �α��� ����
 * doExecute() �޼ҵ� ȣ��
 * @author dhtmd
 *
 */
public abstract class AdminLoginAction implements Action{
	protected String login;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		login = (String)request.getSession().getAttribute("login");
		if(login == null) {
			request.setAttribute("msg", "�α��� �ϼ���...");
			request.setAttribute("url", "../member/loginForm.me");
			return new ActionForward(false,"../alert.jsp");
		}else if(!login.equals("admin")) {
			request.setAttribute("msg", "�����ڸ� Ȯ�� �����մϴ�...");
			request.setAttribute("url", "../board/index.do");
			return new ActionForward(false,"../alert.jsp");
		}else {
			return doExecute(request,response);
		}
	}
	protected abstract ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
