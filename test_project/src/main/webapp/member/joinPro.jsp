<%@page import="test_project.MemberDAO"%>
<%@page import="test_project.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

	MemberDTO dto = new MemberDTO();
%>
	<c:set var="dto" value="<%=dto %>" scope="request"/>
	<c:set target="${dto }" property="id" value="${param.id }"/>
	<c:set target="${dto }" property="pass" value="${param.pass }"/>
	<c:set target="${dto }" property="name" value="${param.name }"/>
	<c:set target="${dto }" property="email" value="${param.email }"/>
	<c:set target="${dto }" property="post_code" value="${param.post_code }"/>
	<c:set target="${dto }" property="address1" value="${param.address }"/>
	<c:set target="${dto }" property="address2" value="${param.address2 }"/>
	<c:set target="${dto }" property="phone" value="${param.phone }"/>
	<c:set target="${dto }" property="mobile" value="${param.mobile }"/>
	<c:out value="${dto} "/>
<%	
	MemberDAO dao = new MemberDAO();
	int insertCount = dao.insertMember(dto);

	if(insertCount > 0){
		response.sendRedirect("../main/main.jsp");
	}else{
%>
	<script>
		alert("회원 가입 실패!");
		history.back();
	</script>
<%
	}
%>