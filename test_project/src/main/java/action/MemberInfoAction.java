package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MemberInfoService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		String id = request.getParameter("id");
		System.out.println(id);
		MemberInfoService service = new MemberInfoService();
		MemberBean vo = service.getMemberInfo(id);
		
		request.setAttribute("vo", vo);
		
		forward = new ActionForward();
		forward.setPath("member/member_info.jsp");
		forward.setRedirect(false);
		
		
		return forward;
	}

}
