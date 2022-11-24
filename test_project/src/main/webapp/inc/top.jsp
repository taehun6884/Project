<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
  
  
  <c:choose>
  	<c:when test="${not empty sessionScope.sId and sessionScope.sId eq 'admin' }">
  	  <div id="login">${sId }  || <a href="../member/logout.jsp">로그아웃</a> || <a href="../admin/memberList.jsp">회원관리</a></div>
  <div class="clear"></div>
  	</c:when>
  	<c:when test="${not empty sessionScope.sId }">
  	<div id="login">${sId }  || <a href="../member/logout.jsp">로그아웃</a></div>
  <div class="clear"></div>
  	</c:when>
  	<c:otherwise>
  	<div id="login"><a href="../member/login.jsp">login</a>  || <a href="../member/join.jsp">join</a></div>
  	</c:otherwise>
  </c:choose>
  <!-- login join -->

  <div class="clear"></div>
  <!-- 로고들어가는 곳 -->
  <div id="logo"><img src="../images/logo.gif"></div>
  <!-- 메뉴들어가는 곳 -->
  <nav id="top_menu">
  	<ul>
  		<li><a href="../main/main.jsp">HOME</a></li>
  		<li><a href="../company/welcome.jsp">COMPANY</a></li>
  		<li><a href="../company/welcome.jsp">SOLUTIONS</a></li>
  		<li><a href="../center/notice.jsp">CUSTOMER CENTER</a></li>
  		<li><a href="../mail/mailForm.jsp">CONTACT US</a></li>
  	</ul>
  </nav>
</header>