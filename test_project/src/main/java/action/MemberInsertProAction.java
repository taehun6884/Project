package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MemberInsertProService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberInsertProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("MemberInsertProAction()");
		ActionForward forward = null;
		
		MemberBean vo = new MemberBean();
		vo.setId(request.getParameter("id"));
		vo.setPass(request.getParameter("pass"));
		vo.setName(request.getParameter("name"));
		vo.setEmail(request.getParameter("email"));
		vo.setAddress1(request.getParameter("address1"));
		vo.setAddress2(request.getParameter("address2"));
		vo.setMobile(request.getParameter("mobile"));
		vo.setPost_code(request.getParameter("post_code"));
		vo.setPhone(request.getParameter("phone"));
		
		MemberInsertProService service = new MemberInsertProService();
		
		boolean isInsertSucess = service.InsertMember(vo);
		
		
		return forward;
	}

}
