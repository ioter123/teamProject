<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>비밀번호수정</title>
	<%@ include file="../include/header.jsp" %>
	
<!-- =========================== -->
		 
<script>
	$(document).ready(function(){
		
		$("#cus_password").focus();
			
		$("#btnCfm").click(function(){
			 
			 //1. 새 비밀번호 체크
			 var pw  = $("#new_password").val();
			 var pw1 = $("#new_password1").val();
			 //글자수 8~16, 특수문자허용x, 대문자 1개이상 포함
			 var reg_ck_pw = /^[\w]{8,16}$/;
			 var reg_ck_pw1 = /[A-Z]/;
			 
			 if(!reg_ck_pw.test(pw)){
				 alert("새 비밀번호의 글자수 8~16, 특수문자허용하지 않습니다.");
				 $("#pw").val("");  //초기화  
				 $("#pw").focus();  //포커스
				 return;
			 }		 
			 if(!reg_ck_pw1.test(pw)){
				 alert("새 비밀번호는 대문자 1개이상 포함해야합니다.");
				 $("#pw").val("");  //초기화  
				 $("#pw").focus();  //포커스
				 return;
			 }		 
			 
			//2. 비밀번호와 비밀버호일치 여부
			if(pw != pw1){
				alert("새 비밀번호가 일치해야합니다.");
				 $("#new_password").val("");   //초기화  
				 $("#new_password1").val("");  //초기화  
				 $("#new_password").focus();   //포커스
				 return;
			}
			

			 
			//폼객체의 action속성값 설정
			$("#jFrm").attr("action","${path}/joinPwUpdate.do");
			$("#jFrm").submit();

		});
		
			 //현재비밀번호 체크
		$("#cus_password").blur(function(e){	
			 var password = $("#cus_password").val();
	
			 $.ajax({
					type: "post",
					url: "${path}/joinPwCheck.do",
					data: "cus_password="+password,		
					dataType: "text",
					success: function(result){
						if(result == "invalid"){
							//alert("현재 비밀번호를 바르게 입력하세요.")
							$("#chk_cpw").text("현재 비밀번호가 일치하지 않습니다.");
						}else{
							 $("#chk_cpw").text("");
						}
					}
			 });

		});
			 
		$("#btnCnc").click(function(){
			document.location.href = "${path}/main.do";				 
		});
			 
					 
	});	

</script>

<style>
#m5 > a{
	color: #fff !important;
}
 .c1{
 	font-weight:bold;
 }
 td{
 	padding:20px;
 }
 .input{
 	width:100%;
 }
 #table-re{
 	width:42%;
 	margin:auto;
 }
 .hidden1{
 	display:none;
 }
 @media ( max-width: 480px ) {
	.c1{
		display:none;
	 }
	 td{
	 	padding:10px;
	 }
	 #table-re{
		width:100%;
		margin:auto;
	 }
	 colgroup{
	 	display:none;
	 }
	 .input{
	 	width:100%;
	 }
	 .hidden1{
	 	display:block;
	 }
 }
 
 
 #btnCnc, #btnCfm {
		background-color: white;
		color: sandyBrown;
		border-radius:20px;
		border:2px solid sandyBrown;
		padding:5px 10px 5px 10px;
		margin-top:10px;
	}
	
	#btnCnc:hover, #btnCfm:hover{
		background-color: sandyBrown;
		color: white;
	}
 

.input{
			width: 100%;
			margin: 5px 0;
			box-sizing: border-box;
		}
		.input[type="password"]{
			border: solid 2px #FFE4B5;
			-webkit-transition: 0.5s;
			transition: 0.5s;
			outline: none;
		}
 .input[type="password"]:focus { border: solid 2px sandyBrown; }
 
</style> 
<!-- =========================== -->
	
</head>
<body>
<div class="fh5co-loader"></div>
	<div id="page">
	<%@ include file="../include/menu.jsp" %>
	
	<div id="fh5co-explore" class="fh5co-bg-section">
		<div class="container">
		 
<!-- =========================== -->

<h1>회원 정보관리</h1>
<hr/>
<h2>&nbsp;비밀번호변경</h2>

<H4>&nbsp;&nbsp;안전한 비밀번호로 내정보를 보호하세요.</H4>
<ul>
  <li>새로 사용하실 비밀번호를 입력해 주세요.</li>
	<li>비밀번호의 글자수 8~16, 특수문자허용하지 않습니다.</li>
	<li>비밀번호는 대문자 1개이상 포함해야합니다.</li>
</ul>



<form id="jFrm" action="" method="post">
	<table id="table-re">		
		<colgroup>
			<col width="35%">
			<col width="65%">
		</colgroup>	
		<tr>
			<th class = "c1">현재 비밀번호</th>
			<td>
			<div class="hidden1">현재 비밀번호</div>
			<input type = "password" name = "cus_password" id = "cus_password" placeholder = "현재 비밀번호" class="input"/>
			<div id="chk_cpw" style="color:red;"></div>
			</td>
		</tr>
		<tr>
			<th class = "c1">새 비밀번호</th>
			<td>
			<div class="hidden1">새 비밀번호</div>
			<input type = "password" name = "new_password" id = "new_password" placeholder = "새 비밀번호" class="input"/>
			<div id="chk_pw" style="color:red;"></div>
			</td>
		</tr>
		<tr>
			<th class = "c1">새 비밀번호확인</th>
			<td>
			<div class="hidden1">새 비밀번호확인</div>
			<input type = "password" name = "new_password1" id = "new_password1" placeholder = "새 비밀번호 확인" class="input"/>
			<div id="chk_pw1" style="color:red;"></div>
			</td>
		</tr>
		<tr align="center">
			<td colspan="2">
					<input type="button" id = "btnCfm" value="   확인    " />&nbsp;
					<input type="button" id = "btnCnc" value="   취소    " />
			</td>
		</tr>
	</table>
</form>		 

	 
<!-- =========================== -->
				
		</div>		
	</div>
	<%@ include file="../include/footer.jsp" %>
	</div>

</body>
</html>


