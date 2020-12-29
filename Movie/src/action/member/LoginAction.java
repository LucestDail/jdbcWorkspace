package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.Member;
import model.MemberDao;
/**
 * 1. �Ķ���Ͱ� ����
 * 2. �����ͺ��̽��� ������ �о ���̵�� ��й�ȣ�� ��
 * 3. ���̵� ���� ���� ���̵� �����ϴ� �޽��� ��� �� loginForm.me �������� �̵�
 * 		��й�ȣ�� Ʋ�� ���� �޽��� ��� �� loginForm.me �� �̵�
 * 		���̵� ��й�ȣ ��ġ�ϸ� session ��ü�� �α��� ���� ����, �̸� ���� �α��� �߽��ϴ�. �޽��� ��� �� main.me �������� �̵�
 * @author dhtmd
 *
 */
public class LoginAction implements Action{

	@SuppressWarnings("null")
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		Member member = new MemberDao().selectOne(request.getParameter("id"));
		String picture = new MemberDao().selectOne(id).getMember_picture();
		if(member == null) {
			request.setAttribute("msg", "���̵� Ȯ���ϼ���");
			request.setAttribute("url", "loginForm.me");
		}else {
			if(password.equals(member.getMember_password())) {
				request.getSession().setAttribute("login", id);
				request.getSession().setAttribute("picture", picture);
				request.setAttribute("msg", member.getMember_nickname() + "�� ȯ���մϴ�!");
				request.setAttribute("url","../board/index.do");
				if(member.getMember_is_admin() == 1) {
					request.setAttribute("msg", "�����ڴ� ȯ���մϴ�!");
					request.getSession().setAttribute("admin", id);
				}
			}else{
				request.setAttribute("msg", "��й�ȣ�� Ʋ���ϴ�");
				request.setAttribute("url", "loginForm.me");
			}
		}
		return new ActionForward(false, "../alert.jsp");
	}

}
