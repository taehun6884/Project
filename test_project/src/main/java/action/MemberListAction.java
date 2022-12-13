package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MemberListService;
import vo.ActionForward;
import vo.MemberBean;
import vo.PageInfo;

public class MemberListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		int listLimit = 10;
		int pageNum = 1;
		
		if(request.getParameter("pageNum")!= null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		
		int startRow = (pageNum - 1) * listLimit;
		
		
		
		MemberListService service = new MemberListService();
		List<MemberBean> list = service.getMembmerList(startRow,listLimit);
		
		int listCount = service.getMemberListCount();
		
		int pageListLimit = 10;
		
		int maxPage = listCount / listLimit + (listCount % listLimit == 0 ? 0 : 1);
		
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		
		int endPage = startPage + pageListLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo(listCount,pageListLimit,maxPage, startPage,endPage);
		
		request.setAttribute("memberList", list);
		request.setAttribute("pageInfo", pageInfo);
		
		forward = new ActionForward();
		forward.setPath("admin/memberList.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
