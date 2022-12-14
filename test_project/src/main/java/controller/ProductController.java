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

@WebServlet("*.po")
public class ProductController extends HttpServlet {

		
		protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			System.out.println("ProductController()");
			
			String command = request.getServletPath();
			System.out.println("현재 주소 :"+command);
			
			ActionForward forward = null;
			Action action = null;
			
			if(command.equals("/ProdcutInsertForm.po")) {
				forward = new ActionForward();
				forward.setPath("product/product_insert.jsp");
				forward.setRedirect(false);
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



