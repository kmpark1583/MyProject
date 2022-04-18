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
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta charset="utf-8">
<title>게시물 수정</title>
</head>
<body>
<div class="container">
<h1 class="head">${member.userName }님 글을작성해주세요.</h1>
	<form method="post" class="form-horizontal">
		<div class="form-group">
			<label class="col-sm-2 control-label">제목</label>
			<div class="col-sm-10">
			<input type="text" class="form-control" name="title" value="${view.title }"><br>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label">작성자</label>
			<div class="col-sm-10">
			<input type="text" class="form-control" name="writer" readonly="readonly" value="${view.writer }"><br>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label">내용</label>
			<div class="col-sm-10">
			<textarea cols="50" rows="5" class="form-control" name="content">${view.content }</textarea><br>
		</div>
		
		<button type="submit">수정완료</button>
	</form>
</div>
</body>
</html>