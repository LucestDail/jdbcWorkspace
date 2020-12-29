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
		member.setMember_picture(request.getParameter("picture"));
		member.setMember_id(request.getParameter("id"));
		member.setMember_password(request.getParameter("password"));
		member.setMember_nickname(request.getParameter("nickname"));
		member.setMember_gender(Integer.parseInt(request.getParameter("gender")));
		member.setMember_age(Integer.parseInt(request.getParameter("age")));
		member.setMember_email(request.getParameter("email"));
		member.setMember_email_receive_ok(Integer.parseInt(request.getParameter("emailreceive")));
		member.setMember_introduction(request.getParameter("introduction"));
		member.setMember_genre(request.getParameter("genre"));
		member.setMember_is_admin(0);
		String msg = "ȸ������ ����";
		String url = "../member/joinform.me";
		if(new MemberDao().insert(member) > 0) {
			msg = member.getMember_nickname() + "�� ȸ������ �Ϸ��Դϴ�.";
			url = "../board/index.do";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}

}
