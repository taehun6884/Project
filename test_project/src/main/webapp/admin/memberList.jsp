<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<th>아이디</th><th>이름</th><th>E-Mail</th><th>Mobile</th><th>가입일</th><th>기타</th><th></th>
		</tr>
	<c:forEach var="list" items="${memberList }">	
		<tr>
			<td>${list.id }</td>
			<td>${list.name }</td>
			<td>${list.email }</td>
			<td>${list.mobile }</td>
			<td>${list.date }</td>
			<td>${list.address1 }</td>
			<td>
				<input type="button" value="상세조회" name="info_detail" onclick="location.href='MemberInfo.mo?id=${list.id}'">
				<input type="button" value="삭제" name="member_delete" onclick="">
			</td>
		</tr>
		<tr><td colspan="6" align="right"><input type="button" value="메인 페이지로 이동" name="" onclick="location.href='index.jsp'">
	</c:forEach>
	</table>
	<c:choose>
			<c:when test="${pageNum > 1}">
				<input type="button" value="이전" onclick="location.href='MemberList.mo?pageNum=${pageNum - 1}'">
			</c:when>
			<c:otherwise>
				<input type="button" value="이전">
			</c:otherwise>
		</c:choose>
			
		<!-- 페이지 번호 목록은 시작 페이지(startPage)부터 끝 페이지(endPage) 까지 표시 -->
		<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
			<!-- 단, 현재 페이지 번호는 링크 없이 표시 -->
			<c:choose>
				<c:when test="${pageNum eq i}">
					${i }
				</c:when>
				<c:otherwise>
					<a href="MemberList.mo?page=${i }">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<!-- 현재 페이지 번호(pageNum)가 총 페이지 수보다 작을 때만 [다음] 링크 동작 -->
		<c:choose>
			<c:when test="${pageNum < pageInfo.maxPage}">
				<input type="button" value="다음" onclick="location.href='MemberList.mo?page=${pageNum + 1}'">
			</c:when>
			<c:otherwise>
				<input type="button" value="다음">
			</c:otherwise>
		</c:choose>
</body>
</html>