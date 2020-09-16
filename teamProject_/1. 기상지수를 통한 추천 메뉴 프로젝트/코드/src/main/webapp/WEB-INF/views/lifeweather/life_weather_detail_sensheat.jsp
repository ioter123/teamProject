<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	
	<title>생활지수 상세보기</title>
	<%@ include file="../include/header.jsp" %>
	<script>
	$(document).ready(function(){		
				
	});
	
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
		margin-right:3px;
	
	}
	.help_form_1 input {
	    border: 1px solid #D2D2D2;
	    float: left;
	    font-size: 0.95em;
	    height: 17px;
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
	img{
		width:700px;
		height:auto;
	}
	@media ( max-width: 480px ) {
		.modify img{
			width:400px;
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
				<td><a href="lifejisudetail.do?jisu=discomfort" >불쾌 지수</a></td>
				<td><a href="lifejisudetail.do?jisu=sky" >대기확산 지수</a></td>
				<td><a href="lifejisudetail.do?jisu=uv" >자외선 지수</a></td>
				<td><a href="lifejisudetail.do?jisu=frozen" >동파가능 지수</a></td>
				<td class="selectJisu"><a href="lifejisudetail.do?jisu=sensheat" >더위체감 지수</a></td>		
			</tr>
		</table>
		<br/>
		
		<div class="container">
			<p class="textbox">
				 <i class="	fas fa-splotch"></i>제공기간 : 5월~9월 / 일 2회 생산 (6시, 18시)
			</p>
			<br/>
	        <h3 class="subtitle"><i class="fas fa-sun"></i>정의</h3>
	        <div  class="textbox">
	         	<p>더위체감지수는 기온처럼 섭씨(ºC)를 이용해 표현하지만 습도와 일사량 요소를 조합해 산출되는 지수</p>
	         	<p>‘더위체감지수’는 열 스트레스 지수 중 가장 광범위하게 사용되는 지수인 온열지수(WBGT)1를 기반으로 개발되었으며 대상과 환경에 따라 차별화된 더위 위험도와 그에 따른 제공방법을 제공하는 서비스임</p>
	        </div>
	        <br/>
	        <h3 class="subtitle"><i class="fas fa-sun"></i>산출방법</h3>
	        <div class="textbox">
	        	<p class="modify"><img src="<c:url value="/resources/images/detail/box05_img01.gif"/>" alt="수식" /></p>
          		<p class="caution modify">* 더위체감지수 세분화를 위해 일반인 대상 산출 값에 기준지점(기상청 일부 ASOS 지점)과 환경별 취약지점과의 시간대별 평균 기온차를 토대로 보정치를 다르게 반영하여 대상별(노인, 어린이 등), 환경별(농촌, 취약거주환경 등) 더위체감지수를 산출</p>
	        </div>

	        <br/>
	        <h3 class="subtitle"><i class="fas fa-sun"></i>단계별 설명및 주의사항</h3>
	        <table class="table">
				<colgroup>
					<col width="15%" />
					<col width="30%" />
					<col width="55%" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col">단계 </th>
						<th scope="col">임계값을 갖는 기상요소의 계수</th>
						<th scope="col">설명 및 주의사항</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td scope="row">매우 위험</td>
						<td>31이상</td>
						<td class="al">
							<ul class="li"> 
								<li>온열질환 발생 가능성이 매우 높은 환경</li>
								<li>가급적 야외 활동이나 외출을 제한하기</li>
					 			<li>두통, 어지러움, 근육경련, 의식저하 등의 증상이 있으면 그늘이나 서늘한  실내에서 휴식을 취함</li>
					 		</ul>
						</td>
					</tr>
					<tr>
						<td scope="row">위험</td>
						<td>28이상 31미만</td>
						<td class="al">
							<ul class="li"> 
								<li>온열질환 발생 가능성이 높은 환경</li>
								<li>야외 신체활동을 할 때엔 충분히 휴식을 취하고, 수분과 염분 자주 섭취하기</li>
					 			<li>체온을 높이는 과격한 운동은 자제하고 외출 시 그늘진 경로로 이동</li>
					 			<li>실내 온습도 조절하기</li>
					 		</ul>
					    </td>
					</tr>
					<tr>
						<td scope="row">경고</td>
						<td>25이상 28미만</td>
						<td class="al">
							<ul class="li"> 
								<li>온열질환 발생이 증가하기 시작하므로 온열질환 발생에 주의</li>
								<li>야외 신체활동을 할 때엔 30분 간격으로 휴식을 취하기</li>
					 		</ul>
					    </td>
					</tr>
					<tr>
						<td scope="row">주의</td>
						<td>21이상 25미만</td>
						<td class="al">
							<ul class="li"> 
								<li>일반적으로 온열질환 발생 가능성은 작은 환경</li>
								<li>심한 운동이나 작업을 할 때 온열질환 발생 가능성이 높아지므로 몸 상태를 살피며 활동하기</li>
					 		</ul>
					    </td>
					</tr>
					<tr>
						<td scope="row">관심</td>
						<td>21미만</td>
						<td class="al">
							<ul class="li"> 
								<li>온열질환 발생 가능성은 작은 환경 </li>
								<li>마라톤과 같이 장시간 땡볕에서 격렬한 신체활동을 할 때엔 컨디션을 살피고, 온열질환 발생에 대비</li>
					 		</ul>
					    </td>
					</tr>
				</tbody>
	        </table>
	        
            <h3 class="subtitle"><i class="fas fa-sun"></i>관련 사이트 정보</h3>
            <ul class="help_ul_list">
              <li>에어코리아 : <a href="http://www.airkorea.or.kr" target="_blank">http://www.airkorea.or.kr</a></li>
            </ul>
		</div>
	</div>
	
	<%@ include file="../include/footer.jsp" %>
	</div>
	
</body>
</html>

