package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.Member;
import model.MemberDao;
/**
 * 1. 파라매터값 저장
 * 2. 데이터베이스의 정보를 읽어서 아이디와 비밀번호를 비교
 * 3. 아이디가 없는 경우는 아이디가 없습니다 메시지 출력 후 loginForm.me 페이지로 이동
 * 		비밀번호가 틀린 경우는 메시지 출력 후 loginForm.me 로 이동
 * 		아이디 비밀번호 일치하면 session 객체에 로그인 정보 저장, 이름 님이 로그인 했습니다. 메시지 출력 후 main.me 페이지로 이동
 * @author dhtmd
 *
 */
public class LoginAction implements Action{

	@SuppressWarnings("null")
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		Member member = new MemberDao().selectOne(id);
		String picture = new MemberDao().selectOne(id).getPicture();
		if(member == null) {
			request.setAttribute("msg", "아이디를 확인하세요");
			request.setAttribute("url", "loginForm.me");
		}else {
			if(pass.equals(member.getPass())) {
				request.getSession().setAttribute("login", id);
				request.getSession().setAttribute("picture", picture);
				request.setAttribute("msg", member.getName() + "님 환영합니다!");
				request.setAttribute("url","main.me");
				return new ActionForward(false,"../Movie/index.jsp");
			}else{
				request.setAttribute("msg", "비밀번호가 틀립니다");
				request.setAttribute("url", "loginForm.me");
			}
		}
		return new ActionForward(false, "../alert.jsp");
	}

}
