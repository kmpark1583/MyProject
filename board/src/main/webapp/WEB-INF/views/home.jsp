<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>

<body>
<!-- 첫 화면 -->
<c:if test="${member.userName == null}">
	<div class="content">
 		<h1 class="tit">LOGIN</h1>
 		<p class="p-txt-1">회원이 되시면 다양한 혜택을 누리실 수 있습니다</p>
			
		<div class="login_wrap">
			<form role="form" method="post" autocomplete="off" action="/member/login">
 			<fieldset>
 				<legend>로그인 입력 폼</legend>
 					
				<label for="userId">아이디</label>
				<p><input type="text" id="userId" name="userId" /></p>

				<label for="userPass">비밀번호</label>
				<p><input type="password" id="userPass" name="userPass" /></p>

				<button type="submit">로그인</button>
				<button type="button"><a href="/member/register">회원가입</a></button>
			</fieldset>
			</form>
</c:if>

<!-- 로그인에 성공하였을때 -->
<c:if test="${member.userName != null }">
	<h1>${member.userName } 님 환영합니다!!</h1>
		<a href="/board/list">게시물 목록</a> &nbsp;&nbsp;
		
		<a href="/board/write">게시물 작성</a> &nbsp;&nbsp;
		
		<a href="member/logout">로그아웃</a> &nbsp;&nbsp;
		
		<a href="member/modify">회원정보 수정</a> &nbsp;&nbsp;
		
		<a href="member/deleteuser">회원 탈퇴</a>
</c:if>

<!-- 로그인에 실패하였을때 -->
<c:if test="${msg == false }">
	<p style="color:#f00;"> 로그인에 실패하였습니다. 아이디 또는 패스워드를 확인해주세요. </p>
</c:if>

</body>
</html>
