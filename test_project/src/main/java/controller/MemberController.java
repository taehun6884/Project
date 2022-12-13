package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.MemberInfoAction;
import action.MemberInsertProAction;
import action.MemberListAction;
import action.MemberLoginMemberProAction;
import action.MemberLogoutAction;
import vo.ActionForward;

@WebServlet("*.mo")
public class MemberController extends HttpServlet{
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberController()");
		
		String command = request.getServletPath();
		System.out.println("현재 주소 :"+command);
		
		ActionForward forward = null;
		Action action = null;
		
		if(command.equals("/MemberInsertForm.mo")) {
			forward = new ActionForward();
			forward.setPath("member/join.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/MemberInsertPro.mo")) {
			action = new MemberInsertProAction();
			forward = action.execute(request, response);
		}else if(command.equals("/LoginMember.mo")) {
			forward = new ActionForward();
			forward.setPath("member/login.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/LogintMemberPro.mo")) {
			action = new MemberLoginMemberProAction();
			forward = action.execute(request, response);
			
		}else if(command.equals("/MemberLogout.mo")) {
			action = new MemberLogoutAction();
			forward = action.execute(request, response);
		}else if(command.equals("/MemberList.mo")) {
			action = new MemberListAction();
			forward = action.execute(request, response);
		}else if(command.equals("/MemberInfo.mo")) {
			action = new MemberInfoAction();
			forward = action.execute(request, response);
		}
		
		if(forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		}
}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}

