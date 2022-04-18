<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
</head>

<body>

<div class="content">
	<h1 class="tit">${member.userName }의 회원 탈퇴페이지</h1>
			
	<div class="login_wrap">
		<form role="form" method="post" autocomplete="off">
 		<fieldset>
 			<legend>회원 탈퇴</legend>
 					
			<label for="userId">아이디</label>
			<p><input type="text" id="userId" name="userId" value="${member.userId }" readOnly="readOnly"/></p>

			<label for="userPass">비밀번호</label>
			<p><input type="password" id="userPass" name="userPass" /></p>

			<button type="submit">회원탈퇴</button>
			<button type="button"><a href="/">처음으로</a></button>
		</fieldset>
		</form>


<c:if test="${msg == false }">
	<p>비밀번호가 틀려서 회원탈퇴 진행이 불가능합니다.</p>
</c:if>

</div>

</body>

</html>