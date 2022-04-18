<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>

<div class="content">
	<h1 class="tit">회원가입 페이지</h1>
			
	<div class="login_wrap">
		<form role="form" method="post" autocomplete="off">
 		<fieldset>
 			<legend>회원 탈퇴</legend>

			<label for="userId">아이디</label>
  			<input type="text" id="userId" name="userId" />
  			<button type="button" class="idCheck">중복 확인</button>
  			<p class="result"><span class="msg">아이디를 확인해주세요.</span></p>
  		
			<p><label for="userPass">패스워드</label></p>
			<input type="password" id="userPass" name="userPass" />

			<p><label for="userName">닉네임</label></p>
			<input type="text" id="userName" name="userName" />
			
			<p><label for="userEmail">이메일</label></p>
			<p><input type="text" id="userEmail" name="userEmail" /></p>
			
			<button type="submit" id="submit" disabled="disabled">가입하기</button>
			<button type="button"><a href="/">처음으로</a></button>
		</fieldset>
		</form>

<script> 
$(".idCheck").click(function(){
 
 var query = {userId : $("#userId").val()};
 
 $.ajax({
  url : "/member/idCheck",
  type : "post",
  data : query,
  success : function(data) {
  
   if(data == 1) {
    $(".result .msg").text("사용 불가");
    $(".result .msg").attr("style", "color:#f00");  
    
    $("#submit").attr("disabled", "disabled");
   } else {
    $(".result .msg").text("사용 가능");
    $(".result .msg").attr("style", "color:#00f");
    $("#submit").removeAttr("disabled");
   }
  }
 });  // ajax 끝
});
</script>

</div>
</body>
</html>