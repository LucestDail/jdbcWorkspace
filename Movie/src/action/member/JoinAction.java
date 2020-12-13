package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.Member;
import model.MemberDao;
/**
 * 1. 파라매터 정보를 Member 객체에 저장
 * 		model.Member
 * 
 * 
 * 2. Member 객체 정보를 db에 추가.
 * 		member 테이블 데이터 저장
 * 
 * 
 * 3. 가입성공 : loginForm.me 페이지 이동
 * 	  가입실패 : joinForm.me 페이지 이동
 * @author dhtmd
 *
 */
public class JoinAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 맴버 객체 생성하기!
		Member member = new Member();
		member.setId(request.getParameter("id"));
		member.setPass(request.getParameter("pass"));
		member.setName(request.getParameter("name"));
		member.setGender(Integer.parseInt(request.getParameter("gender")));
		member.setTel(request.getParameter("tel"));
		member.setEmail(request.getParameter("email"));
		member.setPicture(request.getParameter("picture"));
		String msg = "회원가입 실패";
		String url = "joinForm.me";
		if(new MemberDao().insert(member) > 0) {
			msg = member.getName() + "님 회원가입 완료입니다.";
			url = "loginForm.me";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}

}
