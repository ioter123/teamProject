<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<%@ include file="../include/header.jsp" %>
	<title>찾을수 없습니다.</title>
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>-->

	<%@ include file="../include/header.jsp" %>
	<style>
	#m5 > a{
		color: #fff !important;
	}
	
	</style>
</head>
<body>
<div class="fh5co-loader"></div>
	<div id="page">
	<%@ include file="../include/menu.jsp" %>
	
	<div id="fh5co-explore" class="fh5co-bg-section">
		<div class="container">		 
		 <h4>일치하는 정보가 없습니다.</h4>
		 <a href="#" class="btn btn-info" >회원가입</a>
		 <a href="pwSearch.do" class="btn btn-info" >비밀번호 찾기</a>
		</div>		
	</div>
	<%@ include file="../include/footer.jsp" %>
	</div>
</body>
</html>


