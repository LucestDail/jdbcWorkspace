package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.Member;
import model.MemberDao;
/**
 * 1. �Ķ���� ������ Member ��ü�� ����
 * 		model.Member
 * 
 * 
 * 2. Member ��ü ������ db�� �߰�.
 * 		member ���̺� ������ ����
 * 
 * 
 * 3. ���Լ��� : loginForm.me ������ �̵�
 * 	  ���Խ��� : joinForm.me ������ �̵�
 * @author dhtmd
 *
 */
public class JoinAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// �ɹ� ��ü �����ϱ�!
		Member member = new Member();
		member.setId(request.getParameter("id"));
		member.setPass(request.getParameter("pass"));
		member.setName(request.getParameter("name"));
		member.setGender(Integer.parseInt(request.getParameter("gender")));
		member.setTel(request.getParameter("tel"));
		member.setEmail(request.getParameter("email"));
		member.setPicture(request.getParameter("picture"));
		String msg = "ȸ������ ����";
		String url = "joinForm.me";
		if(new MemberDao().insert(member) > 0) {
			msg = member.getName() + "�� ȸ������ �Ϸ��Դϴ�.";
			url = "loginForm.me";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}

}
