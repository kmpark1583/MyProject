<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <!-- 태그 라이브러리 사용 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<meta charset="UTF-8">
<title>게시물 조회</title>
</head>
<body>
<h1 class="head">자유롭게 봐주세요.</h1>
<div class="container">
	<form method="post" class="form-horizontal">
	<div class="form-group">
		<label class="col-sm-2 control-label">글 번호</label>
		<div class="col-sm-10">
		<input type="text" class="form-control" name="title" value="${view.bno }" readonly="readonly"><br>
		</div>
	</div>
		
		
	<div class="form-group">
		<label class="col-sm-2 control-label">제목</label>
		<div class="col-sm-10">
		<input type="text" class="form-control" name="title" value="${view.title }" readonly="readonly"><br>
		</div>
	</div>
		
	<div class="form-group">	
		<label class="col-sm-2 control-label">작성자</label>
		<div class="col-sm-10">
		<input type="text" class="form-control" name="writer" value="${view.writer }" readonly="readonly"><br>
		</div>
	</div>
		
	<div class="form-group">	
		<label class="col-sm-2 control-label">내용</label>
		<div class="col-sm-10">
		<textarea cols="50" rows="5" class="form-control" name="content" readonly="readonly">${view.content } </textarea><br>
		</div>
	</div>
	
	</form>

	

	<button type="submit">
	<a href="/board/list">목록으로 돌아가기</a>
	</button>

	<button type="submit">
		<a href="/board/modify?bno=${view.bno}">게시물 수정하기</a>
	</button>

	<button type="submit">
		<a href="/board/delete?bno=${view.bno }">게시물 삭제하기</a>
	</button>


	</div>
</body>
</html>