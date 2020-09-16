<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>생활지수 상세보기</title>
	<%@ include file="../include/header.jsp" %>
	<script>
	function cal()
	{
		if(document.c2f.jisutemp.value=="")
		{
			alert("기온을 입력하세요.");
			document.c2f.jisutemp.focus();
			return false;
		}
		if(document.c2f.jisuwind.value=="")
		{
			alert("습도를 입력하세요.");
			document.c2f.jisuwind.focus();
			return false;
		}
		var t2 = document.c2f.jisutemp.value;
		var v2 = document.c2f.jisuwind.value;
		var v3 = (9/5*t2)-(0.55*(1-v2/100)*(9/5*t2-26))+32
		document.c2f.jisuvalue.value = v3;
		document.c2f.jisuvalue.value = document.c2f.jisuvalue.value.substring(0,5);
		document.c2f.jisutemp.focus();
	}

	</script>
	<style>
	#m2 > a{
		color: #fff !important;
	}
	.textbox {
		background-color:#eee;
		color:#000;
		padding:15px;
	}
	.subtitle{
		font-weight:bold;
	}
	.caution{
		color:#fa0;
	}
	p{
		margin:0px 0px 0px;
	}
	
	table{
		border:1px solid;
		color:#000;
	}
	th{
		background-color:#eee;
	}
	td{
		border:1px solid;
		text-align:center;
	}
	.al{
		text-align:left;
	}
	.textlist{
		color:#000;
	}
	.help_img_enumerate3{
		border:2px solid #d7d7d7;
		padding: 20px 0 20px 10px;
		margin-left: -19px;
		list-style:none;
	}
	.help_img_enumerate3 li{
		
		list-style-type:none;
	}
	.help_img_enumerate{
		border:2px solid #d7d7d7;
		padding: 20px 0;
		margin-left: -19px;
		text-align:center;
		list-style:none;
	}
	.help_img_enumerate2{
		border:2px solid #d7d7d7;
		padding: 20px 0 10px;
		margin-left: -19px;
		text-align:center;
		list-style-type:none;
	}
	
	.help_img_enumerate2 .bgn{
		list-style-type:none;
	}
	
	.help_img_enumerate li{
		background: non !important;
		display:inline;
		list-style:none;
	}
	.help_img_enumerate3 .bgn{
		text-align:center;
		margin-left: -3px;
		list-style:none;
	}
	.help_ul_list{
		margin : 0 0 0 5px;
		padding : 0 0 0 15px;
		list-style:none;
	}
	li{
		list-style:disc;
	}
	.list{
		margin-top:10px !important;
	
	}
	.selectJisu{
		background-color:#eee;
		font-weight:bold;
	}
	#fh5co-explore {
	  padding: 3em 0;
	}
	.help_form_1{
		height:45px;
		margin:10px 0 10px 0;
		padding: 9px 15px 5px;
		background-color:#eee;
		color:#000;
	}
	.help_form_1 ul{
		float : left;
	}
	.help_form_1 ul li{
		display : inline;
		float:left;
		margin:0 20px 0 20px;
	
	}
	.help_form_1 input {
	    border: 1px solid #D2D2D2;
	    float: left;
	    font-size: 0.95em;
	    height: 22px;
	    margin-right: 3px;
	    width: 126px;
	}
	.help_form_1 label {
	    float: left;
	    padding-top: 1px;
	    border: none;
	}
	.help_form_1 p {
	    float: left;
	    margin-top: 0px;
	    padding: 3px 10px 0 0;
	}
	.modify{
		text-align:center;
	}
	.tbox_03 {
	    padding: 2px 0 0 2px;
	    width: 100px !important;
	    margin: 0 5px;
	}
	img{
		width:700px;
		height:auto;
	}
	.comm{
		padding-left:306px; 
		text-align:right;
	}
	@media ( max-width: 480px ) {
		.modify img{
			width:400px;
		}
		.tbox_03 {
		    padding: 2px 0 0 2px;
		    width: 100px !important;
		    margin: 0 5px;
		}
		.help_form_1 ul li{
			display : inline;
			margin : 0 20px 0 20px;
		}
		.calc{
			height:135px;
		}
		.view_btn {
		    left: 50px;
		    margin: 10px 0 7px 100px;
		}
		.comm{
			text-align:right;
		}
	}
	
	</style>
</head>
<body>
<div class="fh5co-loader"></div>
	
	<div id="page">
	<%@ include file="../include/menu.jsp" %>


	<div id="fh5co-explore" class="fh5co-bg-section">
		<table class="table">
			<colgroup>
					<col width="12.5%" />
					<col width="12.5%" />
					<col width="12.5%" />
					<col width="12.5%" />
					<col width="12.5%" />
					<col width="12.5%" />
					<col width="12.5%" />
					<col width="12.5%" />
			</colgroup>
			<tr>
				<td><a href="lifejisudetail.do?jisu=foodpoison" >식중독 지수</a></td>
				<td><a href="lifejisudetail.do?jisu=senstemp" >체감 온도</a></td>
				<td><a href="lifejisudetail.do?jisu=heat" >열 지수</a></td>
				<td class="selectJisu"><a href="lifejisudetail.do?jisu=discomfort" >불쾌 지수</a></td>
				<td><a href="lifejisudetail.do?jisu=sky" >대기확산 지수</a></td>
				<td><a href="lifejisudetail.do?jisu=uv" >자외선 지수</a></td>
				<td><a href="lifejisudetail.do?jisu=frozen" >동파가능 지수</a></td>
				<td><a href="lifejisudetail.do?jisu=sensheat" >더위체감 지수</a></td>
			</tr>	
		</table>
		<br/>
				<div class="container">
			<p class="textbox">
				 <i class="	fas fa-splotch"></i>제공기간 : 6월~9월 / 일 8회 생산 (3시간 간격)
			</p>
			<br/>
			<form name="c2f" method="get" action="life_weather_detail.jsp">
				<fieldset class="help_form_1 calc">
					<p><i class="fas fa-splotch"></i>불쾌 지수 산출</p>
					<ul>
						<li><label for="jisutemp">기온</label><input type="text" class="tbox_03" name="jisutemp" id="jisutemp" /> ℃</li>
						<li><label for="jisuwind" class="ML10">습도</label><input type="text" class="tbox_03" name="jisuwind" id="jisuwind" /> %</li>
						<li class="ML10"><a href="#" onclick="cal(); return false;">계산하기</a></li>
						<li><label class="ML10" for="jisuvalue">불쾌지수  </label><input type="text" class="tbox_03" name="jisuvalue" id="jisuvalue"/></li>
					</ul>
				</fieldset>
			</form>
			
			<br/>
	        <h3 class="subtitle"><i class="fas fa-sun"></i>정의</h3>
	        <ul class="help_ul_list li">
		        <li>불쾌지수란 기온과 습도의 조합으로 사람이 느끼는 온도를 표현한 것으로 온습도지수(THI)라고도 함</li>
		        <li>불쾌지수는 여름철 실내의 무더위의 기준으로서만 사용되고 있을 뿐, 복사나 바람 조건은 포함되어 있지 않기 때문에 그 적정한 사용에는 한계가 있다는 점에 유의하여야 함</li>
		        <li>개인에 따라 쾌감대의 범위가 다른것처럼 불쾌지수 값에 따라 불쾌감을 느끼는 정도도 개인에 따라 약간의 차이가 있음</li>
	        </ul>
	        <br/>
	        <h3 class="subtitle"><i class="fas fa-sun"></i>산출방법</h3>
	        <div class="textbox">
	        	<p class="modify"><img src="<c:url value="/resources/images/detail/modify_03.gif"/>" alt="수식" /></p>
          		<p class="caution modify">* 1957년 미국의 E. C. Thom에 의해 고안됨</p>
	        </div>
	        <br/>
	        <h3 class="subtitle"><i class="fas fa-sun"></i>단계별 설명및 주의사항</h3>
	        <table class="table" summary="불쾌지수에 따른 불쾌감을 느끼는 정도로 단계, 지수범위, 자외선 강도 및 주의사항을 나타낸 표입니다" >
				<colgroup>
					<col width="15%" />
					<col width="30%" />
					<col width="55%" />
				</colgroup>
				<thead>
					<tr>
						<th>단계 </th>
						<th>지수범위</th>
						<th>설명 및 주의사항</th>
					</tr>
				</thead>
				<tbody>
			        <tr>
				        <td>매우높음</td>
				        <td>80 이상</td>
				        <td><p>전원 불쾌감을 느낌</p></td>
			        </tr>
			        <tr>
				        <td>높음</td>
				        <td><p>75이상 80미만</p></td>
				        <td><p>50% 정도 불쾌감을 느낌</p></td>
			        </tr>
			        <tr>
				        <td>보통</td>
				        <td><p>68이상 75미만</p></td>
				        <td><p> 불쾌감을 나타내기 시작함 </p></td>
			        </tr>
			        <tr>
				        <td>낮음</td>
				        <td><p>68미만</p></td>
				        <td><p>전원 쾌적함을 느낌</p></td>
			        </tr>
	        	</tbody>
	        </table>
		</div>
		
	</div>

	<%@ include file="../include/footer.jsp" %>
	</div>


</body>
</html>

