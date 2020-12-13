package action.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.Member;
import model.MemberDao;
/**
 * 1. db ���� ��� ȸ�� ������ ��ȸ�Ͽ� List<Member> ��ü�� ����...
 * List<Member> MemberDao().list()
 * 
 * 2. list ��ü�� request.setAttribute() �޼ҵ�� ����Ͽ� view ������ �����ݴϴ�...
 * @author dhtmd
 *
 */
public class ListAction extends AdminLoginAction{

	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Member> list = new MemberDao().list();
		request.setAttribute("list", list);
		return new ActionForward();
	}

}
