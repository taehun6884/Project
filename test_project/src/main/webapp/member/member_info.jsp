<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/join.jsp</title>
<link href="css/default.css" rel="stylesheet" type="text/css">
<link href="css/subpage.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="wrap">
		<!-- 헤더 들어가는곳 -->
		<jsp:include page="/inc/top.jsp"></jsp:include>
		<!-- 헤더 들어가는곳 -->
		  
		<!-- 본문들어가는 곳 -->
		  <!-- 본문 메인 이미지 -->
		  <div id="sub_img_member"></div>
		  <!-- 왼쪽 메뉴 -->
		  <nav id="sub_menu">
		  	<ul>
		  		<li><a href="#">Join us</a></li>
		  		<li><a href="#">Privacy policy</a></li>
		  	</ul>
		  </nav>
		  <!-- 본문 내용 -->
		  <article>
		  	<h1>Join Us</h1>
		  	<form action="joinPro.jsp" method="post" id="join" name="fr">
		  		<fieldset>
		  			<legend>Basic Info</legend>
		  			<label>User Id</label>
		  			<input type="text" name="id" class="id" id="id" value="${vo.id }"><br>
		  			
		  			<label>Password</label>
		  			<input type="password" name="pass" id="pass"><br> 			
		  			
		  			<label>Name</label>
		  			<input type="text" name="name" id="name" value="${vo.name }"><br>
		  			
		  			<label>E-Mail</label>
		  			<input type="email" name="email" id="email" value="${vo.email }"><br>
		  			
		  		</fieldset>
		  		
		  		<fieldset>
		  			<legend>Optional</legend>
		  			<label>Post Code</label>
		  			<input type="text" name="post_code" id="post_code" placeholder="우편번호" value="${vo.post_code }">
		  			<input type="button" value="주소 검색"><br>
		  			<label>Address</label>
		  			<input type="text" name="address1" value="${vo.address1 }"> -
		  			<input type="text" name="address2" value="${vo.address2 }"><br>
		  			<label>Phone Number</label>
		  			<input type="text" name="phone" value="${vo.phone }"><br>
		  			<label>Mobile Phone Number</label>
		  			<input type="text" name="mobile" value="${vo.mobile }"><br>
		  		</fieldset>
		  		<div class="clear"></div>
		  		<div id="buttons">
		  			<input type="button" value="뒤로가기" class="cancel" onclick="history.back()">
		  		</div>
		  	</form>
		  </article>
		  
		<div class="clear"></div>  
		<!-- 푸터 들어가는곳 -->
		<jsp:include page="/inc/bottom.jsp"></jsp:include>
		<!-- 푸터 들어가는곳 -->
	</div>
</body>
</html>


