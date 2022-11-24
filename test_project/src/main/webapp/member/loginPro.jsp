<%@page import="test_project.MemberDAO"%>
<%@page import="test_project.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
MemberDTO dto = new MemberDTO();

MemberDAO dao = new MemberDAO();

boolean result = dao.loginMember(request.getParameter("id"), request.getParameter("pass"));

if(result == true){
	response.sendRedirect("../main/main.jsp");
	session.setAttribute("sId", request.getParameter("id"));
}else{
%>
	<script>
		alert("로그인 실패!");
		history.back();
	</script>
	
<%
}
%>	