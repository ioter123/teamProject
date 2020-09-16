<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>입력하신 아이디는</title>
	<%@ include file="../include/header.jsp" %>
	<!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>-->
	<script>
	$(document).ready(function(){
	});
	</script>
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
		 <h4>${cus_name}님의 아이디는 ${cus_id} 입니다.</h4>
		 <a href="loginFrm.do" class="btn btn-info" >로그인</a>
		</div>		
	</div>
	<%@ include file="../include/footer.jsp" %>
	</div>
</body>
</html>


