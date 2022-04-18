<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <!-- 태그 라이브러리 사용 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style>
	.head{text-align:center}
</style>
<title>게시판 목록</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta charset="utf-8">
<title>게시물 작성</title>
</head>
<body>
<c:if test="${msg != false }">
<h1 class="head">${member.userName }님 글을작성해주세요.</h1>
</c:if>

<c:if test="${msg == false }">
<div class="container">
<h1 class="head">로그인을 해주세요.</h1>
<p>로그인을 하셔야 글을 작성할수 있습니다.</p>
<p><a href="/">홈으로</a></p>
</div>
</c:if>


<c:if test="${msg == null }">
<div class="container">
	<form method="post" class="form-horizontal">
		<div class="form-group">
			<label class="col-sm-2 control-label">제목</label>
			<div class="col-sm-10">
			<input type="text" class="form-control" name="title"><br>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label">작성자</label>
			<div class="col-sm-10">
		<input type="text" name="writer" class="form-control" value="${member.userName }" readonly="readonly"><br>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label">내용</label>
			<div class="col-sm-10">
			<textarea cols="50" rows="5" class="form-control" name="content"></textarea><br>
		</div>
		
		<button type="submit">작성</button><br><br>
		<p> ${member.userName } 님 오늘도 좋은하루 되세요~ </p>
	</form><br><br>

	</div>

</c:if>


</div>
</body>
</html>