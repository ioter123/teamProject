<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<%@ include file="../include/header.jsp" %>
	
<!-- =========================== -->

<script>
	$(document).ready(function(){

		$("#cus_id").focus();
		
		$("#btnJoin").click(function(){
			//1. 중복체크 검사
			var dupleCk=$("#dupleCk").val();	
			if(dupleCk!="ok"){
				alert("아이디 중복확인을 해야합니다.")
				return;	
			}
			var inputId=$("#cus_id").val();
			//* 체크할 정규식
		  // 첫글자는 반드시 영문소문자, 5~16글자수, \w는 특수문자허용x 
			 var reg_ck_id = /^[a-z][\w]{5,16}/;
			 if( reg_ck_id.test(inputId)==false){
				 alert("첫글자는 반드시 영문소문자, 6~16글자수, 특수문자허용하지 않음");
				 $("#cus_id").focus();
				 return;
			 }
			 
			 //2. 비밀번호 체크
			 var pw  = $("#cus_password").val();
			 var pw1 = $("#cus_password1").val();
			 //글자수 8~16, 특수문자허용x, 대문자 1개이상 포함
			 var reg_ck_pw = /^[\w]{8,16}$/;
			 var reg_ck_pw1 = /[A-Z]/;
			 
			 if(!reg_ck_pw.test(pw)){
				 alert("비밀번호의 글자수 8~16, 특수문자허용하지 않습니다.");
				 $("#pw").val("");  //초기화  
				 $("#pw").focus();  //포커스
				 return;
			 }		 
			 if(!reg_ck_pw1.test(pw)){
				 alert("비밀번호는 대문자 1개이상 포함해야합니다.");
				 $("#pw").val("");  //초기화  
				 $("#pw").focus();  //포커스
				 return;
			 }		 
			 
			//3. 비밀번호와 비밀버호일치 여부
			if(pw != pw1){
				alert("비밀번호가 일치해야합니다");
				 $("#cus_password").val("");  //초기화  
				 $("#cus_password1").val("");  //초기화  
				 $("#cus_password").focus();  //포커스
				 return;
			}
			
			 //4. 이름체크
			 var uname = $("#cus_name").val();
			 //한글만 허용
		 	 var reg_ch_uname = /^[가-힣]{2,}$/;
			 
			 if(!reg_ch_uname.test(uname)){
				 alert("이름은 한글만 2글자 이상이어야 합니다.");
				 $("#uname").focus();  //포커스
				 return;			 
			 }
			 
			 //5. 이메일체크
			 var email = $("#cus_email1").val();
			 var email2 = $("#cus_email2").val();
			 if((email==null || email=="") ||(email2==null || email2=="")){
				 alert("이메일은 필수입력사항 입니다.");
				 $("#cus_email1").focus();  //포커스
				 return;			 
			 }
			 
			 //6. 핸드폰번호 체크
			 var phone1 = $("#cus_phone2").val();
			 var phone2 = $("#cus_phone3").val();
	 
			 if(phone1=="" || phone2==""){
				 alert("핸드폰번호는  필수입력사항 입니다.");
				 $("#cus_phone2").focus();  //포커스
				 return;			 
			 }
			 if(phone1.length<4 || phone2.length<4){
				 alert("핸드폰번호 입력 규칙에 맞게 입력해주세요.");
				 $("#cus_phone2").focus();  //포커스
				 return;			 
			 }
			
			//폼객체의 action속성값 설정
			$("#cus_email2").attr("disabled",false);
			$("#jFrm").attr("action","${path}/joinProc.do");
			$("#jFrm").submit();

		});
		
		//====================================================			

		$("#idck").click(function(e){
			var inputId=$("#cus_id").val();
			var reg_ck_id = /^[a-z][\w]{5,16}/;
			if( reg_ck_id.test(inputId)==false || inputId==null){
			  //alert("첫글자는 반드시 영문소문자, 5~16글자수, 특수문자허용하지 않음");
			  $("#chk_id").text("아이디를 규칙에 맞게 넣어주세요.");
			  return;
			}
			$("#chk_id").text("");
			
			$.ajax({
				type: "post",
				url: "${path}/joinIdCheck.do",
				data: "cus_id="+inputId,		
				dataType: "text",
				success: function(result){
					if(result == "invalid"){
						$("#dupleCk").val("duple");
						alert("이미 존재하는 아이디 입니다.");
					}
					else{
						$("#dupleCk").val("ok");
						alert("사용가능한 아이디 입니다.");
					}
				}
			});
		});
		
		$("#cus_id").on("change paste keyup", function() {
			$("#dupleCk").val("");
		});

		$("#cus_password").blur(function(e){	
			 //2. 비밀번호 체크
			 var pw  = $("#cus_password").val();
			 //글자수 8~16, 특수문자허용x, 대문자 1개이상 포함
			 var reg_ck_pw = /^[\w]{8,16}$/;
			 var reg_ck_pw1 = /[A-Z]/;
			 
			 if(!reg_ck_pw.test(pw)){
				 //alert("비밀번호의 글자수 8~16, 특수문자허용하지 않습니다.");
				 $("#cus_password").val("");  //초기화  
				 $("#chk_pw").text("비밀번호의 글자수 8~16, 특수문자허용하지 않습니다.");
				 //$("#pw").focus();  //포커스
				 return;
			 }		 
			 if(!reg_ck_pw1.test(pw)){
				 //alert("비밀번호는 대문자 1개이상 포함해야합니다");
				 $("#cus_password").val("");  //초기화  
				 $("#chk_pw").text("비밀번호는 대문자 1개이상 포함해야합니다");
				 //$("#pw").focus();  //포커스
				 return;
			 }		
			
			 $("#chk_pw").text("");  //메시지 초기화
		});
		
		$("#cus_password1").blur(function(e){	
			//3. 비밀번호와 비밀버호일치 여부
			var pw  = $("#cus_password").val();
			var pw1 = $("#cus_password1").val();
			
			if(pw != pw1){
				//alert("비밀번호가 일치해야합니다");
				 $("#cus_password1").val("");  //초기화  
				 $("#chk_pw1").text("비밀번호가 일치해야합니다.");
				 //$("#cus_password1").focus();  //포커스
				 return;
			}
			
			 $("#chk_pw1").text("");  //메시지 초기화
		});
		
		$("#cus_name").blur(function(e){	
			//4. 이름체크
			 var uname = $("#cus_name").val();
			 //한글만 허용
		 	 var reg_ch_uname = /^[가-힣]{2,}$/;
			 
			 if(!reg_ch_uname.test(uname)){
				 //alert("이름은 한글만 2글자 이상이어야 합니다.");
				 $("#cus_name").val("");  //초기화  
				 $("#chk_name").text("이름은 한글 2글자 이상이어야 합니다.");
				 //$("#cus_name").focus();  //포커스
				 return;			 
			 }
			
			 $("#chk_name").text("");  //메시지 초기화
		});		

		$("#cus_email1").blur(function(e){	
			 //5. 이메일체크
			 var email = $("#cus_email1").val();
	 
			 if(email==null || email==""){
				 //alert("이메일은 필수입력사항 입니다.");
				 $("#cus_email1").val("");  //초기화  
				 $("#chk_email").text("이메일은 필수입력사항 입니다.");
				 //$("#cus_email1").focus();  //포커스
				 return;			 
			 }
			
			 $("#chk_email").text("");  //메시지 초기화
		});	
		
		$("#cus_phone2").blur(function(e){	
			 //6. 핸드폰번호 체크
			 var phone1 = $("#cus_phone1").val();
			 var phone2 = $("#cus_phone2").val();
	 
			 if(phone1=="" || phone2==""){
				 //alert("핸들폰번호는 필수입력사항 입니다.");
				 $("#chk_phone").text("핸드폰번호는 필수입력사항 입니다.");
				 //$("#cus_email1").focus();  //포커스
				 return;			 
			 }
			
			 $("#chk_phone").text("");  //메시지 초기화
		});	
		
		//focus시 메시지 초기화
		$("#cus_id").focus(function(e){	
			$("#chk_id").text("");  //메시지 초기화
		});
		$("#cus_password").focus(function(e){	
			$("#chk_pw").text("");  //메시지 초기화
		});
		$("#cus_password1").focus(function(e){	
			$("#chk_pw1").text("");  //메시지 초기화
		});
		$("#cus_name").focus(function(e){	
			$("#chk_name").text("");  //메시지 초기화
		});
		$("#cus_email1").focus(function(e){	
			$("#chk_email").text("");  //메시지 초기화
		});
		$("#cus_phone1").focus(function(e){	
			$("#chk_phone").text("");  //메시지 초기화
		});
		$("#cus_phone2").focus(function(e){	
			$("#chk_phone").text("");  //메시지 초기화
		});
		
		$('#selectEmail').change(function(){ 
			$("#selectEmail option:selected").each(function () {
				if($(this).val()== '직접입력'){ //직접입력일 경우 
					$("#cus_email2").val("");
					$("#cus_email2").attr("disabled",false); //활성화 
					}else{ //직접입력이 아닐경우 
						$("#cus_email2").val($(this).val()); //선택값 입력 
						console.log($(this).val())
						$("#cus_email2").attr("disabled",true); //비활성화
					} 
			}); 
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
		input[type="text"], input[type="password"], #selectEmail, #cus_phone1 {
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

<h3 id="weatherjisu">회원가입</h3>
<hr/>
<h3>&nbsp;기본정보</h3>

<form id="jFrm" action="" method="post">
	<p align="right"><span style="color:red;">V</span>&nbsp;표시는 필수 입력항목</p>
	<div style="overflow-x:auto;">
	<table id="table-re">		
		<colgroup>
			<col width="25%">
			<col width="75%">
		</colgroup>
		<tr>
			<td class = "c1"><span><span style="color:red;">V</span>&nbsp;아이디</span></td>
			<td>
				<span class="hidden1"><span style="color:red;">V</span>&nbsp;아이디</span>
				<input type="hidden" id="dupleCk"/>
				<input type = "text" name = "cus_id" id = "cus_id" placeholder = "아이디입력" class="input"/>
				<button type="button" id="idck">중복확인</button>
				<br/>첫글자는 반드시 영문소문자, 6~16글자수, 특수문자 허용안함
				<div id="chk_id" style="color:red;"></div>
			</td>
		</tr>
		<tr>
			<td class = "c1"><span style="color:red;">V</span>&nbsp;비밀번호</td>
			<td>
				<span class="hidden1"><span style="color:red;">V</span>&nbsp;비밀번호</span>
			  <input type = "password" name = "cus_password" id = "cus_password" placeholder = "비밀번호입력" class="input"/>
			  <br/>글자수 8~16, 특수문자허용 안함, 대문자 1개이상 포함
			  <div id="chk_pw" style="color:red;"></div>
			</td>
		</tr>
		<tr>
			<td class = "c1"><span style="color:red;">V</span>&nbsp;비밀번호확인</td>
			<td>
				<span class="hidden1"><span style="color:red;">V</span>&nbsp;비밀번호확인</span>
				<input type = "password" name = "cus_password1" id = "cus_password1" placeholder = "비밀번호 확인" class="input"/>
				<div id="chk_pw1" style="color:red;"></div>
			</td>
		</tr>
		<tr>
			<td class = "c1"><span style="color:red;">V</span>&nbsp;이름</td>
			<td>
				<span class="hidden1"><span style="color:red;">V</span>&nbsp;이름</span>
				<input type = "text" name = "cus_name" id = "cus_name" placeholder = "이름입력" class="input"/>
				<br/>한글 2글자 이상
				<div id="chk_name" style="color:red;"></div>
			</td>
				
		</tr>
		<tr>
			<td class = "c1">성별</td>
			<td>
			<span class="hidden1">성별</span>
			
			<label><input type="radio" name="cus_sex" id="sexM" value="M" checked="checked"/>남</label>&nbsp;&nbsp;
			<label><input type="radio" name="cus_sex" id="sexF" value="F" />여</label>
			
			</td>
		</tr>
		<tr>
			<td class = "c1"><span style="color:red;">V</span>&nbsp;이메일</td>
			<td>
				<span class="hidden1"><span style="color:red;">V</span>&nbsp;이메일</span>
				<input type = "text" name = "cus_email1" id = "cus_email1" placeholder = "이메일입력" class="input2"/>
				@
				<input type = "text" name = "cus_email2" id = "cus_email2" class="input2"/>
				<select name="cus_email3" id="selectEmail" class="input2">
					<option value="직접입력" selected>직접입력</option>
					<option value="naver.com">naver.com</option>
					<option value="daum.net">daum.net</option>
					<option value="google.com">google.com</option>
					<option value="nate.com">nate.com</option>
				</select>
				<div id="chk_email" style="color:red;"></div>
			</td>
		</tr>
		<tr>
			<td class = "c1"><span style="color:red;">V</span>&nbsp;연락처</td>
			<td>
				<span class="hidden1"><span style="color:red;">V</span>&nbsp;연락처</span>
				<select name="cus_phone1" id="cus_phone1" class="input2">
					<option value="010" selected>010</option>
					<option value="011">011</option>
					<option value="011">016</option>
					<option value="011">017</option>
					<option value="011">018</option>
					<option value="011">019</option>
				</select>
				&nbsp;-
				<input type = "text" name = "cus_phone2" id = "cus_phone2" maxlength="4" class="input2"/>&nbsp;-
				<input type = "text" name = "cus_phone3" id = "cus_phone3" maxlength="4" class="input2"/>
				<br/>예) 010-0000-0000
				<div id="chk_phone" style="color:red;"></div>
			</td>
		</tr>
		<tr>
			<td class = "c1">취미</td>
			<td>
				<span class="hidden1">취미</span>
				<input type = "text" size="30" name = "cus_hobby" id = "cus_hobby" placeholder = "취미" class="input"/>
			</td>
		</tr>
		<tr>
			<td class = "c1">비고</td>
			<td>
				<span class="hidden1">비고</span>
				<textarea name="cus_note" id="cus_note" placeholder = "간략히 자기소개" width="100%" cols=55></textarea></td>
		</tr>
		<tr align="center">
			<td colspan="2">
					<input type="button" id = "btnJoin"  class="btn-primary" value="      가입하기       " />
			</td>
		</tr>
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


