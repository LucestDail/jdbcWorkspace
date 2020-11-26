package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.Member;
import model.MemberDao;

public class UpdateAction extends UserLoginAction{

	@Override
	public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Member member = new Member();
		member.setId(request.getParameter("id"));
		member.setPass(request.getParameter("pass"));
		member.setName(request.getParameter("name"));
		member.setGender(Integer.parseInt(request.getParameter("gender")));
		member.setTel(request.getParameter("tel"));
		member.setEmail(request.getParameter("email"));
		member.setPicture(request.getParameter("picture"));
		
		String msg = "비밀번호가 틀렸습니다...";
		String url = "updateForm.me?id=" + member.getId();
		
		MemberDao dao = new MemberDao();
		Member dbmember = dao.selectOne(login);
		
		if(member.getPass().equals(dbmember.getPass())) {
			int result = dao.update(member);
			if(result > 0) {
				return new ActionForward(true, "info.me?id="+member.getId());
			}else {
				msg = "수정 실패";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
}
