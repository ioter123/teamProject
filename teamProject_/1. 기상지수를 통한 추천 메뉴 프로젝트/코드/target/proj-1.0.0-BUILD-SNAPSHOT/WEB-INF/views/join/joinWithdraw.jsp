<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>회원탈퇴</title>
	<%@ include file="../include/header.jsp" %>
	
<!-- =========================== -->
		 
<script>
	$(document).ready(function(){
		$("#cus_password").focus();
		
		$("#btnCfm").click(function(){
			 
			if(confirm("정말 탈퇴 하시겠습니까?")){
				var password = $("#cus_password").val();
				
				 $.ajax({
						type: "post",
						url: "${path}/joinPwCheck.do",
						data: "cus_password="+password,		
						dataType: "text",
						success: function(result){
							if(result == "invalid"){
								alert("비밀번호를 바르게 입력하세요.");
								$("#cus_password").focus();
								return;
							}else{							
								//폼객체의 action속성값 설정
								$("#jFrm").attr("action","${path}/joinWithdraw.do");
								$("#jFrm").submit();
							}
						}
				 });		
			}
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
 .input{
 	width:100%;
 }
 #table-re{
 	width:40%;
 	margin:auto;
 }
 .hidden1{
 	display:none;
 }
 @media ( max-width: 480px ) {
	.c1{
		display:none;
	 }
	 #table-re{
		width:100%;
		margin:auto;
	 }
	 colgroup{
	 	display:none;
	 }
	 .hidden1{
	 	display:block;
	 }
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
<h2>&nbsp;회원탈퇴</h2>

<H4>&nbsp;&nbsp;아이디 재사용 및 복구불가 안내 </H4>
<ul>
	<li>회원탈퇴 진행 시 본인을 포함한 타인 모두 아이디 재상용나 복구가 불가합니다.</li>
	<li>신중히 선택하신 후 결정해 주세요..</li>
</ul><br/>



<form id="jFrm" action="" method="post">
	<td><input type = "hidden" name = "cus_id" id = "cus_id" value = "${sessionScope.UID}" /></td>
	<table id="table-re">		
		<colgroup>
			<col width="35%">
			<col width="65%">
		</colgroup>	
		<tr><td colspan="2"><p style="text-align:center;">안전한 회원탈퇴를 위해, 
					<span style="color:red;">비밀번호를 확인해 주세요. </span></p></td></tr>	
		<tr><td colspan="2"><hr/></td></tr>	
		<tr>
			<th class = "c1">아이디</th>
			<td><div class="hidden1">아이디</div>${sessionScope.UID}</td>
		</tr>
		<tr><td colspan="2"><hr/></td></tr>	
		<tr>
			<th class = "c1">비밀번호</th>
			<td>
			<div class="hidden1">비밀번호</div>
			<input type = "password" name = "cus_password" id = "cus_password" placeholder = "비밀번호" class="input"/></td>
		</tr>
		
		<tr><td colspan="2"><hr/></td></tr>	
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


