<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>제목</title>
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
		 <h4>회원님의 메일로 임시 비밀번호를 발송하였습니다. </h4>
		 <h4>임시 비밀번호로 로그인 하신 후에 비밀번호를 변경 해주세요.</h4>
		 <a href="loginFrm.do" class="btn btn-info" >로그인</a>
		</div>		
	</div>
	<%@ include file="../include/footer.jsp" %>
	</div>

</body>
</html>


