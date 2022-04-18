<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>회원정보 수정페이지</title>
</head>
<body>

<div class="content">
	<h1 class="tit">${member.userName } 님 정보를 수정해주세요.</h1>
			
	<div class="login_wrap">
		<form role="form" method="post" autocomplete="off">
 		<fieldset>
 			<legend>회원 정보 수정</legend>
 					
			<label for="userName">닉네임</label>
			<p><input type="text" id="userName" name="userName" value="${member.userName }" readOnly="readOnly"/></p>

			<label for="userPass">신규 패스워드</label>
			<p><input type="password" id="userPass" name="userPass" /></p>

			<button type="submit">수정 완료</button>
			<button type="button"><a href="/">처음으로</a></button>
		</fieldset>
		</form>



</body>
</html>