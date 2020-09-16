<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>비밀번호 찾기</title>
<%@ include file="../include/header.jsp" %>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script>
$(document).ready(function(){
	$("#findPw").click(function(){
		 var regx = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		 var name = $("#cus_name").val();
		 var id = $("#cus_id").val();
		 var email = $("#cus_email").val();
		 if (name.length == 0 || name==null) {
		  alert("이름을 입력하시오");
		 }
		 else if (id.length == 0 || id==null) {
		  alert("아이디를 입력하시오");
		 }
		 else if (email.length == 0 || email==null) {
			  alert("이메일를 입력하시오");
		}
		 else if (!regx.test(email)){
		  alert("이메일 형식에 맞춰서 작성해주세요.");
		 }else{ 
			$("#pwFrm").submit();
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
	
	.tr1{
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
				<h3 id="weatherjisu">비밀번호 찾기</h3>
				<form name="pwFrm" id="pwFrm"  action="pwSearchProc.do">
			 	<table border="1" align="center" width="350">
			 		<tr class = "tr1">
			 			<th width="100">이름</th>
			 			<td><input type="text" name="cus_name" id="cus_name" class="input"></td>
			 		</tr>	
			 		<tr class = "tr1">
			 			<th width="100">아이디</th>
			 			<td><input type="text" name="cus_id" id="cus_id" class="input"></td>
			 		</tr>	
			 		<tr>
			 			<th width="100">이메일</th>
			 			<td><input type="text" name="cus_email" id="cus_email" class="input"></td>
			 		</tr>				 		
			 	</table>
				</form>
				<br/>
				<div id="id_login" style="text-align:center">
			 		<button id="findPw" class="btn-primary" style="width:300px; height:45px;">비밀번호 찾기</button>
			 	</div>
			</div>
		</div>
		
	<%@ include file="../include/footer.jsp" %>
	</div>
</body>
</html>
</html>
		