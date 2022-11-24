<%@page import="test_project.BoardDTO"%>
<%@page import="test_project.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>

<%
request.setCharacterEncoding("UTF-8");

BoardDAO dao = new BoardDAO();
// 글쓰기 작업 (InsertBoard)
// write 창에서 파라미터를 통해 받아온 뒤 boardDTO에 저장한 뒤 삽입.
BoardDTO dto = new BoardDTO();
// dto.setName(request.getParameter("name"));
// dto.setPass(request.getParameter("pass"));
// dto.setSubject(request.getParameter("subject"));
// dto.setContent(request.getParameter("content"));

%>



<c:set var ="dto" value ="<%=dto %>" scope ="request"/>

<%-- <c:set target="${dto }" property="idx" value ="${param.idx }"></c:set> --%>
<c:set target="${dto }" property="name" value ="${param.name }"></c:set>
<c:set target="${dto }" property="pass" value ="${param.pass }"></c:set>
<c:set target="${dto }" property="subject" value ="${param.subject }"></c:set>
<c:set target="${dto }" property="content" value ="${param.content }"></c:set>
<%-- <c:set target="${dto }" property="date" value ="${param.date }"></c:set> --%>
<%-- <c:set target="${dto }" property="readcount" value ="${param.readcount }"></c:set> --%>

<%
int insertCount = dao.insertBoard(dto);

if(insertCount > 0){%>
	<script>
	alert("게시글이 등록되었습니다.");
	location.href = "notice.jsp";
	</script>
<%}else{ %>
	<script>
	alert("게시글 등록에 실패했습니다.");
	history.back();
	</script>
<%} %>



