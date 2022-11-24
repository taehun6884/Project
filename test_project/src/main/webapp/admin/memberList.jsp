<%@page import="test_project.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="test_project.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
MemberDTO dto = new MemberDTO();
MemberDAO dao = new MemberDAO();
List<MemberDTO> list = dao.memberList(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

</script>
</head>
<body>
	<table border="1">
		<tr>
			<th>아이디</th><th>이름</th><th>E-Mail</th><th>Mobile</th><th>가입일</th><th>기타</th>
		</tr>
	<c:forEach var="list" items="<%=list %>">	
		<tr>
			<td>${list.id }</td>
			<td>${list.name }</td>
			<td>${list.email }</td>
			<td>${list.mobile }</td>
			<td>${list.date }</td>
			<td>${list.address1 }</td>
			<td>
				<input type="button" value="상세조회" name="info_detail" onclick="location.href='../member/member_info.jsp?${list.id}'">
				<input type="button" value="삭제" name="member_delete" onclick="">
			</td>
		</tr>
		<tr><td colspan="6" align="right"><input type="button" value="메인 페이지로 이동" name="" onclick="location.href='../main/main.jsp'">
	</c:forEach>
	</table>

</body>
</html>