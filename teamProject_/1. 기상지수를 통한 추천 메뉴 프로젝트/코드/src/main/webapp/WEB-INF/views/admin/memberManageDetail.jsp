<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>회원 상세 조회</title>
	<%@ include file="../include/header.jsp" %>
	<script>
	$(document).ready(function(){		
		$("#cbtn").hide();
		$("#pwck").hide();
		$("#phoneck").hide();
		$("#emailck").hide();
		
		$("#cus_phone1").keyup(function(){
			$("#phoneck").text("");
			$("#phoneck").hide();
		});
		$("#cus_phone2").keyup(function(){
			$("#phoneck").text("");
			$("#phoneck").hide();
		});
		$("#cus_phone3").keyup(function(){
			$("#phoneck").text("");
			$("#phoneck").hide();
		});
		$("#cus_email1").keyup(function(){
			$("#emailck").text("");
			$("#emailck").hide();
		});
		$("#cus_email2").keyup(function(){
			$("#emailck").text("");
			$("#emailck").hide();
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
			
		$('#wbtn').click(function(){
			$("#cus_name").attr("disabled",false);
			$("#cus_password").attr("disabled",false);
			$("#cus_phone1").attr("disabled",false);
			$("#cus_phone2").attr("disabled",false);
			$("#cus_phone3").attr("disabled",false);
			$(".cus_sex").attr("disabled",false);
			$("#cus_email1").attr("disabled",false);
			$("#selectEmail").attr("disabled",false);
			$("#cus_note").attr("disabled",false);
			$("#cus_class").attr("disabled",false);
			$("#cus_out").attr("disabled",false);
			$("#cbtn").show();
			$('#wbtn').hide();
		});
		
		$("#cus_password").keyup(function(){
			var password = $("#cus_password").val();
			var cnt=password.length;
			var checkNumber = password.search(/[0-9]/g);
		    var checkEnglish = password.search(/[a-z]/ig);
		    if((cnt!=0&&(checkNumber <0 || checkEnglish <0)) && (cnt>=4 || cnt<=12)){
		    	$("#pwck").show();
		        $("#pwck").text("숫자와 영문자를 조합하여 4글자이상 12글자이하 여야 합니다.");
		        
		    }
			else{
				$("#pwck").text("");
				$("#pwck").hide();
			}
		});
		
		$('#cbtn').click(function(){
			$("#cus_email2").attr("disabled",false);
			var reg_ck_pw=/^[\w]{8,20}$/;
			var pw=$("#cus_password").val();
			var email = $("#cus_email1").val();
			var email2 = $("#cus_email2").val();
			var phone = $("#cus_phone1").val();
			var phone2 = $("#cus_phone2").val();
			var phone3 = $("#cus_phone3").val();
			var pwcnt=pw.length;
			var emailcnt=email.length;
			var email2cnt=email2.length;
			var phonecnt=phone.length;
			var phone2cnt=phone2.length;
			var phone3cnt=phone3.length;
			var ckmsg = $(".error").text()
			if(pwcnt==0){
				$("#pwck").show();
				$("#pwck").text("비밀번호는 필수 입력사항입니다.");
				$("#cus_password").focus();
			}else if(emailcnt==0){
				$("#emailck").show();
				$("#emailck").text("이메일은 필수 입력사항입니다.");
				$("#cus_email1").focus();;
			}else if(email2cnt==0){
				$("#emailck").show();
				$("#emailck").text("이메일은 필수 입력사항입니다.");
				$("#cus_email2").focus();;
			}else if(phonecnt==0){
				$("#phoneck").show();
				$("#phoneck").text("전화번호는 필수 입력사항입니다.");
				$("#cus_phone1").focus();;
			}else if(phone2cnt==0){
				$("#phoneck").show();
				$("#phoneck").text("전화번호는 필수 입력사항입니다.");
				$("#cus_phone2").focus();;
			}else if(phone3cnt==0){
				$("#phoneck").show();
				$("#phoneck").text("전화번호는 필수 입력사항입니다.");
				$("#cus_phone3").focus();;
			}else if( ckmsg != "" ){
				alert("오류 없이 입력바랍니다.");
			}else{
				$("#memFrm").submit();
			}
						
		});
		
		
	});
	</script>
	<style>
	#m6 > a{
		color: #fff !important;
	}
	td{
		text-align:left;
		padding:10px;
	}
	.inputwidth{
		width:50%;
	}
	 .input2{
	 	width:25%;
	 }
	 .hidden1{
	 	display:none;
	 }
	 .table{
	 	width:100%;
	 }
	 textarea{
	 	width:100%;
	 }
	 @media ( max-width: 480px ) {
		 td{
		 	padding:10px;
		 }
		 .inputwidth{
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
		 .hidden2{
		 	display:none;
		 }
	}
	
	 #weatherjisu {
		font-weight: bold;
		text-align:center;
		color:#000;
		font-size:30px;
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
		margin:auto;
	}
	
	tr{
		border-bottom:1px solid #FDD9B5;
	}	 
	
	.btn1{
		background-color: white;
		color: sandyBrown;
		border-radius:20px;
		border:2px solid sandyBrown;
		padding:5px 10px 5px 10px; 
		margin-top:10px;
		margin-left:10px;
	}
	
	.btn1:hover{
		border:1px solid sandyBrown;
		background-color:sandyBrown;
		color:white;
	}
	
	#Btn1{
		padding:9px 10px 9px 10px; 
	}

	</style>
</head>
<body>
<div class="fh5co-loader"></div>
	
	<div id="page">
	<%@ include file="../include/menu.jsp" %>
	<div id="fh5co-explore" class="fh5co-bg-section">
		<div class="container">
			<h3 id = "weatherjisu">회원 상세정보</h3>
			<%--	목록 보여주고 --%>
			<form name="memFrm" id="memFrm"  action="memberManageUpdateProc.do?cus_no=${vo1.cus_no}&nowPage=${nowPage}" method="POST">
			<table id="table-re">
			<colgroup class="hidden2">
				<col width="30%" />
				<col width="70%" />
			</colgroup>
				<tr>
					<th class="hidden2">아이디</th>
					<td>
					<span class="hidden1">아이디</span>
					<input type="text"  value="${vo1.cus_id}" name="cus_id" class="inputwidth" id="cus_id" disabled/></td>	
				</tr>
				<tr>
					<th class="hidden2">이름</th>
					<td>
					<span class="hidden1">이름</span>
					<input type="text"  value="${vo1.cus_name}" name="cus_name" class="inputwidth" id="cus_name" disabled/></td>					
				</tr>
				<tr>
					<th class="hidden2">비밀번호</th>
					<td>
					<span class="hidden1">비밀번호</span>
					<input type="text"  value="${vo1.cus_password}" name="cus_password"  id="cus_password" class="inputwidth" placeholder="비밀번호 입력" disabled/>
					<p id="pwck" class="error"></p>
					</td>						
				</tr>
				<tr>
					<th class="hidden2">전화번호</th>
					<td>
					<span class="hidden1">전화번호</span>
					<select name="cus_phone1" id="cus_phone1" class="input2" disabled>
						<option value="010" <c:if test="${fn:substring(vo1.cus_phone,0,3) eq 010}">selected</c:if>>010</option>
						<option value="011" <c:if test="${fn:substring(vo1.cus_phone,0,3) eq 011}">selected</c:if>>011</option>
						<option value="011" <c:if test="${fn:substring(vo1.cus_phone,0,3) eq 016}">selected</c:if>>016</option>
						<option value="011" <c:if test="${fn:substring(vo1.cus_phone,0,3) eq 017}">selected</c:if>>017</option>
						<option value="011" <c:if test="${fn:substring(vo1.cus_phone,0,3) eq 018}">selected</c:if>>018</option>
						<option value="011" <c:if test="${fn:substring(vo1.cus_phone,0,3) eq 019}">selected</c:if>>019</option>
					</select>
					-
					<input type="text"  value="${fn:substring(vo1.cus_phone,3,7)}" name="cus_phone2"  id="cus_phone2" class="input2" disabled/>-
					<input type="text"  value="${fn:substring(vo1.cus_phone,7,11)}" name="cus_phone3"  id="cus_phone3" class="input2" disabled/>
					<p id="phoneck" class="error"></p>
					</td>	
				</tr>
				<tr>
					<th class="hidden2">성별</th>
					<td>
					<span class="hidden1">성별</span>
					<input type="radio"  value="F" name="cus_sex" class="cus_sex" disabled <c:if test="${vo1.cus_sex eq 'F' }">checked</c:if> /> F
					<input type="radio"  value="M" name="cus_sex" class="cus_sex" disabled <c:if test="${vo1.cus_sex eq 'M' }">checked</c:if> /> M
					</td>	
				</tr>
				<tr>
					<th class="hidden2">이메일</th>
					<td>
					<span class="hidden1">이메일</span>
					<input type="text"  value="${fn:substring(vo1.cus_email,0,fn:indexOf(vo1.cus_email,'@'))}" name="cus_email1"  id="cus_email1" placeholder="이메일 입력" class="input2" disabled/>@
					<input type="text"  value="${fn:substring(vo1.cus_email,fn:indexOf(vo1.cus_email,'@')+1,fn:length(vo1.cus_email))}" name="cus_email2"  id="cus_email2" class="input2" disabled/>					
					<select id="selectEmail" name="selectEmail" class="input2" disabled>
						<option value="직접입력">직접입력</option> 
						<option value="naver.com" <c:if test="${fn:substring(vo1.cus_email,fn:indexOf(vo1.cus_email,'@')+1,fn:length(vo1.cus_email)) eq  naver.com}">selected</c:if> >naver.com</option>
						<option value="daum.net" <c:if test="${fn:substring(vo1.cus_email,fn:indexOf(vo1.cus_email,'@')+1,fn:length(vo1.cus_email)) eq  daum.net}">selected</c:if> >daum.net</option>
						<option value="gmail.com" <c:if test="${fn:substring(vo1.cus_email,fn:indexOf(vo1.cus_email,'@')+1,fn:length(vo1.cus_email)) eq  gmail.com}">selected</c:if> >gmail.com</option>
						<option value="hanmail.net" <c:if test="${fn:substring(vo1.cus_email,fn:indexOf(vo1.cus_email,'@')+1,fn:length(vo1.cus_email)) eq  hanmail.net}">selected</c:if> >hanmail.net</option>
					</select>
					<p id="emailck" class="error"></p>
					</td>	
				</tr>
				<tr>
					<th class="hidden2">비고</th>
					<td>
					<span class="hidden1">비고</span>
					<textarea name="cus_note" id="cus_note" disabled>${vo1.cus_note}</textarea></td>
				</tr>
				<tr>
					<th class="hidden2">회원등급</th>
					<td>
					<span class="hidden1">회원등급</span>
					<select id="cus_class" name="cus_class" disabled>
						<option value="0" <c:if test="${vo1.cus_class eq 0 }">selected</c:if>>0</option>
						<option value="1" <c:if test="${vo1.cus_class eq 1 }">selected</c:if>>1</option>
					</select>
					</td>
				</tr>
				<tr>
					<th class="hidden2">가입날짜</th>
					<td>
					<span class="hidden1">가입날짜</span>
					<input type="text"  value="${vo1.cus_date2}" name="date"  id="date"  class="inputwidth" disabled/></td>	
				</tr>
				<tr>
					<th class="hidden2">탈퇴 여부</th>
					<td>
					<span class="hidden1">탈퇴여부</span>
					<select id="cus_out" name="cus_out" disabled>
						<option value="Y" <c:if test="${vo1.cus_out eq 'Y' }">selected</c:if>>Y</option>
						<option value="N" <c:if test="${vo1.cus_out eq 'N' }">selected</c:if>>N</option>
					</select>
					</td>	
				</tr>
			</table>
			</form>
			<div style="text-align:center;">
			<a href="memberManage.do?nowPage=${nowPage}" class = "btn1" id = "Btn1">목록보기</a>
			<button type="button" id="wbtn" class = "btn1">수정</button>
			<button type="button" id="cbtn" class = "btn1">완료</button>
			</div>
		</div>		
	</div>
	
	<%@ include file="../include/footer.jsp" %>
	
	</div>


</body>
</html>

