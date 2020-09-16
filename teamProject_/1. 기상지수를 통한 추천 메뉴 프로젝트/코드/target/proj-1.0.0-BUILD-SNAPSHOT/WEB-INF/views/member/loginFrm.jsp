<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>로그인</title>
	<%@ include file="../include/header.jsp" %>
	<script> 
	$(document).ready(function(){
		$("#lbtn").click(function(){
			 var id = $("#cus_id").val();
			 var pw = $("#cus_password").val();
			 if (id.length == 0 || id == null) {
			  alert("아이디를 입력하시오");
			  return;
			 }
			 else if (pw.length == 0|| pw == null) {
			  alert("비밀번호를 입력하시오");
			  return;
			 }
			 else{ 
				$("#loginFrm").submit();
			 }
			 			 
		});
		var loginck=$("#ck").val();
		if(loginck=="no"){
			alert("일치하는 회원정보가 없습니다.")
		} else if(loginck=="out"){
			alert("탈퇴한 회원입니다.");
		} else if(loginck=="email"){
			alert("이메일 인증 후에 로그인 가능합니다.");
		}
		
		$("#jbtn").click(function(){
			location.href='joinProc.do';
		});
	
	});
	</script>
	<style>
	#m5 > a{
	color: #fff !important;
}
	.container{
		text-align:center;
	}
	
	#weatherjisu {
		font-weight: bold;
		text-align:center;
		color:#000;
		font-size:30px;
	}
	
	td{
		text-align:center;
	}
	.input{
		width:100%;
	}
	
	
	.btn-info_1{
		color:#EA9215;
		border-radius:0px;
		padding:3px;
		text-align:center;
	
		border:0;
		background-color:white;
	}
	
	.btn-info_1:hover{
		color:white;
		border-radius:0px;
		border:0;
		background-color:sandyBrown;
		
	}
	
	table{
		border:0;
	}
	
	#cus_id, #cus_password{
		border:0;
	}
	
	
	
	/*--------------------------------------------------*/
	

	</style>
</head>
<body>
	<div id="page">
	<%@ include file="../include/menu.jsp" %>

	<div id="fh5co-explore" class="fh5co-bg-section">
		<div class="container">
			<h3 id="weatherjisu">로그인</h3>
			
			<form name="loginFrm" id="loginFrm"  action="loginProc.do">
			 	<table border="1" align="center" width="350">
			 		<tr height="50">
			 			<th width="100">아이디</th>
			 			<td><input type="text" placeholder="ID" name="cus_id" id="cus_id" class="input"/></td>
			 		</tr>	
			 		<tr height="50">
			 			<th width="100">비밀번호</th>
			 			<td><input type="password"  placeholder="PASSWORD"  name="cus_password" id="cus_password" class="input"/></td>
			 		</tr>
			 	</table>
			</form>
			<br/>
			<div id="id_login" style="text-align:center">
		 	<button id="lbtn" class="btn-primary"  style="width:300px; height:45px;">로그인</button>
		 	<input type="hidden" value="${loginck }" id="ck"/>
		 	</div>
		 	<br/>
		 	<div>
		 		<button id="jbtn" class="btn-primary"  style="width:300px; height:45px;">회원가입</button>
		 	</div>
		 	<br/>
		 	<div id="kakao_id_login" style="text-align:center">
			<a href="loginSearch.do" class="btn btn-info_1" style="width:140px; height:30px;" >아이디찾기</a>
			<a href="pwSearch.do" class="btn btn-info_1"  style="width:140px; height:30px; ">비밀번호찾기</a>		
			</div>
		 	<br/>
		 	<div id="id_login_serch" style="text-align:center">
		 	<a href="${url}">
			<img width="50" height="45" src="<c:url value="resources/images/naver.png"/>"/></a>&nbsp;&nbsp;
		 	<!-- </div> -->
		 	<!-- <br/> -->
		 	<!-- <div id="naver_id_login" style="text-align:center"> -->
		 	<a href="https://kauth.kakao.com/oauth/authorize?client_id=bbccaf38294801c2dee60e6c0660d931&redirect_uri=http://teamjesus.iptime.org/proj/kakaologin.do&response_type=code">
			<img width="50" height="45" src="<c:url value="resources/images/kakaoTalk1.png"/>"/></a>
			</div>
		 	<br/>
		 	
		</div>	
			
	<!--  <button uri = ' '/>
	-->
	</div>
	<%@ include file="../include/footer.jsp" %>
	</div>

</body>
</html>

