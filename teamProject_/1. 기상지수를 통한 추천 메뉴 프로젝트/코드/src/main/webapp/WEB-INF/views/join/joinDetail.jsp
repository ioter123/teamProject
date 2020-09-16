<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>내정보 관리</title>
	<%@ include file="../include/header.jsp" %>
	
<!-- =========================== -->
		 
<script>
	$(document).ready(function(){
		//성별: radio
    var sex = "${vo.cus_sex}"; 
		if(sex=="M"){
			$("#sexM").attr("checked", "checked")
		}else{
			$("#sexF").attr("checked", "checked")			
		}
		
		//이메일:list
		$("#cus_email2").val("${vo.cus_email2}").prop("selected", true);

		//회원정보 수정
		$("#btnUpdate").click(function(){
			 //1. 이름체크
			 var uname = $("#cus_name").val();
			 //한글만 허용
		 	 var reg_ch_uname = /^[가-힣]{2,}$/;
			 
			 if(!reg_ch_uname.test(uname)){
				 alert("이름은 한글만 2글자 이상이어야 합니다.");
				 $("#uname").val("");  //초기화  
				 $("#uname").focus();  //포커스
				 return;			 
			 }
			 
			 //2. 이메일체크
			 var email = $("#cus_email1").val();
	 
			 if(email==null || email==""){
				 alert("이메일은 필수입력사항 입니다.");
				 $("#cus_email1").val("");  //초기화  
				 $("#cus_email1").focus();  //포커스
				 return;			 
			 }
			 
			 //3. 핸드폰번호 체크
			 var phone1 = $("#cus_phone2").val();
			 var phone2 = $("#cus_phone3").val();
	 
			 if(phone1=="" || phone2==""){
				 alert("핸드폰번호는  필수입력사항 입니다.");
				 $("#cus_phone2").focus();  //포커스
				 return;			 
			 }
			
			 //4. 비밀번호 체크
			 var password = $("#cus_password").val();
	 
			 if(password==""){
				 alert("회원정보를 수정하기 위해서는 현재비밀번호를 입력해야 합니다.");
				 $("#cus_password").focus();  //포커스
				 return;			 
			 }
			 
			 $.ajax({
					type: "post",
					url: "${path}/joinPwCheck.do",
					data: "cus_password="+password,		
					dataType: "text",
					success: function(result){
						if(result == "invalid"){
							alert("비밀번호를 바르게 입력하세요.")
						}
					}
				});
			 
			//폼객체의 action속성값 설정
			$("#jFrm").attr("action","${path}/joinUpdate.do");
			$("#jFrm").submit();

		});
		
		//메인화면(홈)으로 가기
		$("#btnHome").click(function(){
			document.location.href = "${path}/main.do";	
		});
		
		$('#selectEmail').change(function(){ 
			$("#selectEmail option:selected").each(function () {
				if($(this).val()== '직접입력'){ //직접입력일 경우 
					$("#cus_email2").attr("disabled",false); //활성화 
					}else{ //직접입력이 아닐경우 
						$("#cus_email2").val($(this).text()); //선택값 입력 
						$("#cus_email2").attr("disabled",true); //비활성화
					} 
			}); 
		});
		
		$('#btnUpdateFrm').click(function(){
			$("#cus_name").attr("disabled",false);
			$("#cus_password").attr("disabled",false);
			$("#cus_phone1").attr("disabled",false);
			$("#cus_phone2").attr("disabled",false);
			$("#cus_phone3").attr("disabled",false);
			$(".cus_sex").attr("disabled",false);
			$("#cus_email1").attr("disabled",false);
			$("#selectEmail").attr("disabled",false);
			$("#cus_note").attr("disabled",false);
			$(".updateCk").show();
			$('#btnUpdateFrm').hide();
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
 tr{
 	padding:5px;
 	border-style:solid;
 	border-width:0.3px 0px 0.3px 0px;
 }
 td{
 	padding:20px;
 }
 .input{
 	width:50%;
 }
 .input2{
 	width:25%;
 }
 #table-re{
 	width:80%;
 	margin:auto;
 }
 .hidden1{
 	display:none;
 }
 textarea{
 	width:100%;
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
	 .input2{
	 	width:25%;
	 }
	 tr{
	 	padding:5px;
	 	border-width:0;
	 }
	 .hidden1{
	 	display:block;
	 }
 }
 #weatherjisu {
		font-weight: bold;
		text-align:center;
		color:#000;
		font-size:30px;
	}
	
	#idck{
		color:#EA9215;
		border-radius:0px;
		padding:3px;
		text-align:center;
	
		border:0;
		background-color:white;
	}
	
	#idck:hover{
		color:white;
		border-radius:0px;
		border:0;
		background-color:sandyBrown;
		
	}
	
	#cus_note{
		border:hidden;
	}
	
	#btnJoin{
		width:150px;
		text-align:center;
	}
	
	 #selectEmail{
	 	height:33px;
	 }
	
input{
			width: 100%;
			margin: 5px 0;
			box-sizing: border-box;
		}
		input[type="text"], input[type="password"], #selectEmail {
			border: solid 2px #FFE4B5;
			-webkit-transition: 0.5s;
			transition: 0.5s;
			outline: none;
		}
		input[type="text"]:focus { border: solid 2px sandyBrown; }
		input[type="password"]:focus { border: solid 2px sandyBrown; }
		#selectEmail:focus{ border: solid 2px #FFD9B5; 
												color:white;
												background-color:#FFD9B5;}
					
 #table-re{
	border-top:1px solid #FDD9B5;
	border-bottom:hidden;
}

tr{
	border-bottom:1px solid #FDD9B5;
}
 
 
 #btnUpdate, #btnHome, #btnUpdateFrm{
 	background-color: white;
		color: sandyBrown;
		border-radius:20px;
		border:2px solid sandyBrown;
		padding:5px 10px 5px 10px;
		margin-top:10px;
 }
 
 #btnUpdate:hover, #btnHome:hover, #btnUpdateFrm:hover{
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
<h4>&nbsp;내정보를 최신 정보로 관리해 주세요.</h4>
<form id="jFrm" action="" method="post">
	<div style="overflow-x:auto;">
	<table id="table-re">		
		<colgroup>
			<col width="15%">
			<col width="85%">
		</colgroup>		
		<tr>
			<th class = "c1">아이디</th>
			<td><div class="hidden1">아이디</div>${vo.cus_id}</td>
		</tr>
		<tr>
			<th class = "c1">이름</th>
			<td>
			<div class="hidden1">이름</div>
			<input type = "text" name = "cus_name" id = "cus_name" value="${vo.cus_name}" class="input" disabled/>&nbsp;(필수)</td>
		</tr>
		<tr>
			<th class = "c1">성별</th>
			<td>
				<div class="hidden1">성별</div>
				<label><input type="radio" name="cus_sex" id="sexM" class="cus_sex" value="M" disabled/>남</label>&nbsp;&nbsp;
				<label><input type="radio" name="cus_sex" id="sexF" class="cus_sex" value="F" disabled/>여</label>				
			</td>
		</tr>
		<tr>
			<th class = "c1">이메일</th>			
			<td>
				<div class="hidden1">이메일</div>
				<input type = "text" name = "cus_email1" id = "cus_email1" value="${vo.cus_email1}" class="input2" disabled/>
				@
				<input type = "text" name = "cus_email2" id = "cus_email2" value="${vo.cus_email2}" class="input2" disabled/>
				<select name="cus_email3" id="selectEmail" class="input2" disabled>
					<option value="직접입력">직접입력</option>
					<option value="naver.com" <c:if test="${vo.cus_email2 eq 'naver.com'}">selected</c:if>>naver.com</option>
					<option value="daum.net" <c:if test="${vo.cus_email2 eq 'daum.net'}">selected</c:if>>daum.net</option>
					<option value="google.com" <c:if test="${vo.cus_email2 eq 'google.com'}">selected</c:if>>google.com</option>
					<option value="nate.com" <c:if test="${vo.cus_email2 eq 'nate.com'}">selected</c:if>>nate.com</option>
				</select>&nbsp;(필수)
			</td>
		</tr>
		<tr>
			<th class = "c1">전화번호</th>
			<td>
				<div class="hidden1">전화번호</div>
				<select name="cus_phone1" id="cus_phone1" class="input2" disabled>
					<option value="010" <c:if test="${vo.cus_phone1 eq 010}">selected</c:if>>010</option>
					<option value="011" <c:if test="${vo.cus_phone1 eq 011}">selected</c:if>>011</option>
					<option value="011" <c:if test="${vo.cus_phone1 eq 016}">selected</c:if>>016</option>
					<option value="011" <c:if test="${vo.cus_phone1 eq 017}">selected</c:if>>017</option>
					<option value="011" <c:if test="${vo.cus_phone1 eq 018}">selected</c:if>>018</option>
					<option value="011" <c:if test="${vo.cus_phone1 eq 019}">selected</c:if>>019</option>
				</select>
				-
				<input type = "text" size="4" name = "cus_phone2" id = "cus_phone2" value="${vo.cus_phone2}" class="input2" disabled/>-
				<input type = "text" size="4" name = "cus_phone3" id = "cus_phone3" value="${vo.cus_phone3}" class="input2" disabled/>&nbsp;(필수)
			</td>
		</tr>
		<tr>
			<th class = "c1">비고</th>
			<td>
			<div class="hidden1">비고</div>
			<textarea name="cus_note" id="cus_note" placeholder = "간략히 자기소개" disabled>${vo.cus_note}</textarea></td>
		</tr>
		<tr class="updateCk" hidden><td class = "c1">&nbsp;</td><td>위의 정보를 수정하려면 현재비밀번호를 입력하고 수정버튼을 누르세요.</td></tr>
		<tr class="updateCk" hidden>
			<th class = "c1">비밀번호</th>
			<td>
				<div class="hidden1">비밀번호</div>
				<input type = "password" name = "cus_password" id = "cus_password" class="input" placeholder = "현재 비밀번호 입력"/>&nbsp;&nbsp;&nbsp;
				<button type="button" id = "btnUpdate">수정완료</button>
					
			</td>
		</tr>
		<tr><td colspan="2" align="right">
		<button type="button" id = "btnUpdateFrm">수정하기</button>
		<button type="button" id = "btnHome">Home</button>
		</td></tr>
		
	</table>
	</div>
</form>		 

	 
<!-- =========================== -->
				
		</div>		
	</div>
	<%@ include file="../include/footer.jsp" %>
	</div>

</body>
</html>


