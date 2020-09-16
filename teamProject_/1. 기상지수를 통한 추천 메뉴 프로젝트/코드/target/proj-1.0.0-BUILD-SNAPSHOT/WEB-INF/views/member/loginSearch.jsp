<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>아이디 찾기</title>
<%@ include file="../include/header.jsp" %>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script>
$(document).ready(function(){
	$("#lbtn").click(function(){
		 var regx = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; 
		 var name = $("#cus_name").val();
		 var email = $("#cus_email").val();
		 if (name.length == 0|| name == null) {
		  alert("이름을 입력하시오");
		 }
		 else if (email.length == 0|| email == null) {
		  alert("이메일을 입력하시오");
		 }
		 else if (!regx.test(email)){
		  alert("이메일 형식에 맞춰서 작성해주세요.");
		 }
		 else{$("#idFrm").submit();
		 }
	});
})
</script>
	<style>
	#m5 > a{
		color: #fff !important;
	}
	#weatherjisu {
		font-weight: bold;
		text-align:center;
		color:#000;
		font-size:30px;
	}
	table{
	 	border:hidden;	
	 }
	 input{
	 	border:0px;
	 }
	th{
		color:sandyBrown;
		/* background-color:sandyBrown; */
	}
	#tr1{
		border-bottom:1px solid sandyBrown;
	}
	
	td{
		padding:5px;
		text-align:center;
	}
	.input{
		width:100%;
	}

	</style>
</head>
<body>	
	<div id="page">
	<%@ include file="../include/menu.jsp" %>
		<div id="fh5co-blog">
			<div class="container">
				<h3 id="weatherjisu">아이디찾기</h3>
				
				<form name="idFrm" id="idFrm"  action="loginSearchProc.do">
			 	<table border="1" align="center" width="350">
			 		<tr id = "tr1">
			 			<th width="100">이름</th>
			 			<td><input type="text" name="cus_name" id="cus_name" class="input"  placeholder="이름을 입력하세요"/></td>
			 		</tr>	
			 		<tr>
			 			<th width="100">이메일</th>
			 			<td><input type="text" name="cus_email" id="cus_email" class="input" placeholder="이메일을 입력하세요"/></td>
			 		</tr>				 		
			 	</table>
				</form>
				<br/>
				<div id="id_login" style="text-align:center">
			 	<button id="lbtn" class="btn-primary" style="width:300px; height:45px;">아이디 찾기</button>
			 	</div>
			</div>
		</div>
	<%@ include file="../include/footer.jsp" %>
	</div>
</body>
</html>