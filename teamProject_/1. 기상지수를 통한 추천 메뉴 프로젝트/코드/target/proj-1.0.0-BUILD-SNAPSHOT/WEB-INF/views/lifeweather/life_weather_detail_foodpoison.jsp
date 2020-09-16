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
	@media ( max-width: 480px ) {
		.bgn img{
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
		
		<div style="overflow-x:auto;">
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
			<tr class="titletext">
				<td class="selectJisu"><a href="lifejisudetail.do?jisu=foodpoison" >식중독 지수</a></td>
				<td><a href="lifejisudetail.do?jisu=senstemp" >체감 온도</a></td>
				<td><a href="lifejisudetail.do?jisu=heat" >열 지수</a></td>
				<td><a href="lifejisudetail.do?jisu=discomfort" >불쾌 지수</a></td>
				<td><a href="lifejisudetail.do?jisu=sky" >대기확산 지수</a></td>
				<td><a href="lifejisudetail.do?jisu=uv" >자외선 지수</a></td>
				<td><a href="lifejisudetail.do?jisu=frozen" >동파가능 지수</a></td>
				<td><a href="lifejisudetail.do?jisu=sensheat" >더위체감 지수</a></td>		
			</tr>
		</table>
		</div>
		<div class="container">
		<br/>
			<h3 class="subtitle">식중독지수</h3>
			<p class="textbox">
				 <i class="	fas fa-splotch"></i>제공기간 : 3월~11월 / 일 8회 생산 (3시간 간격)
			</p>
			<br/>
	        <h3 class="subtitle"><i class="fas fa-sun"></i>정의</h3>
	        <div  class="textbox">
	         	<p>식중독지수는 예측모형을 통해 계산된 현재의 식중독 발생예측건수를 과거 4년(‘09~’12년)동안의 식중독 발생건수와 비교하여 식중독 발생가능성을 나타내는 것</p>
	         	<p class="caution">* 기상청은 식품의약품안전처와 공동으로 식중독지수를 제공하고 있음</p>
	        </div>
	        <br/>
	        <h3 class="subtitle"><i class="fas fa-sun"></i>산출방법</h3>
	        <div class="textbox">
	          <p>기상변수(일최고기온, 일최저기온, 일평균기온, 일강수량, 일평균상대습도)와 기상외적인 요인(여름·겨울방학 급식효과 등)을 사용하여 일별 식중독 발생건수를 예측하고, 이를 과거 4년동안의 기상자료로 계산된 일별 식중독 발생건수 예측량과 비교하여 식중독지수 산출</p>
	        </div>
	        <br/>
	        <h3 class="subtitle"><i class="fas fa-sun"></i>단계별 설명및 주의사항</h3>
	        <table class="table" summary="식중독지수에 따른 주의사항을 단계, 지수범위, 주의사항으로 나타낸 표입니다" >
				<colgroup>
					<col width="15%" />
					<col width="14%" />
					<col width="*" />
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
				        <td>위험</td>
				        <td>95 이상</td>
				        <td class="al"><p>식중독 발생가능성이 매우 높으므로 식중독예방에 각별한 경계요망</p></td>
			        </tr>
			        <tr>
				        <td>경고</td>
				        <td><p>70이상 95미만</p></td>
				        <td class="al"><p>식중독 발생가능성이 높으므로 식중독예방에 경계요망</p></td>
			        </tr>
			        <tr>
				        <td>주의</td>
				        <td><p>35이상 70미만</p></td>
				        <td class="al"><p>식중독 발생가능성이 중간단계이므로 식중독예방에 주의요망</p></td>
			        </tr>
			        <tr>
				        <td>관심</td>
				        <td><p>35미만</p></td>
				        <td class="al"><p>식중독 발생가능성은 낮으나 식중독예방에 지속적인 관심요망</p></td>
			        </tr>
	        	</tbody>
	        </table>
	        <p class="caution">* 식중독지수 단계와 상관없이, 겨울에는 집단식중독 발생가능성이 있으므로 요식업종사자는 화장실 이용시 손씻기 요망</p>
	        <br/>
	        <h3 class="subtitle"><i class="fas fa-sun"></i>식중독이란?</h3>
	        <ul class="help_ul_list li">
		        <li>"음식물 섭취에 따른 건강 장애" 중의 하나로서, 식품위생법에서는 "식품의 섭취로 인하여 인체에 유해한 미생물 또는 유독물질에 의하여 발생하였거나 발생한 것으로 판단되는 감염성 또는 독소형 질환"이라고 정의함</li>
		        <li>식중독사고의 70% 이상을 차지하고 있는 세균성 식중독은 식품의 취급과정에서 적절한 방지대책과 세심한 주의를 기울이면 충분히 예방이 가능함</li>
	        </ul>
	        <br/>
	        <h3 class="subtitle"><i class="fas fa-sun"></i>식중독대처법</h3>
	        <ul class="help_ul_list">
	              <li class="list"><i class="fas fa-pen"></i>식중독 예방 3대요령
	                <ul class="help_img_enumerate3">
						<li class="bgn"><img src="<c:url value="/resources/images/detail/basic_img_001.gif"/>" alt="식중독 예방 3대 요령(KPDA 식품의약안전청), 손씻기 : 손은 비누로 깨끗이 씻자, 익혀먹기 : 음식물은 익혀먹자, 끓여먹기 : 물은 끓여 마시자 " /></li>
						<li><strong class="caution">손씻기</strong> : 손은 비누를 사용하여 손가락 사이사이, 손등까지 골고루 흐르는 물로 20초 이상 씻기. </li>
						<li><strong class="caution">익혀먹기</strong> : 음식물은 중심부 온도가 74℃, 1분 이상 조리하여 속까지 충분히 익혀먹기.</li>
						<li><strong class="caution">끓여먹기</strong> :물은 끓여서 마시기.</li>
					</ul>
					</li>
	              <li class="list"><i class="fas fa-pen"></i>일반위생관리
	                <ul class="help_img_enumerate">
	                  <li><img src="<c:url value="/resources/images/detail/basic_img_002.gif"/>" alt="손씻기의 생활화 : 작업 시작 전, 작업 공정 바뀔 때, 화장실 이용 후, 배식 전 등" /></li>
	                  <li><img src="<c:url value="/resources/images/detail/basic_img_003.gif"/>" alt="개인 위생관리 철저 : 깨끗한 복장 유지" /></li>
	                  <li><img src="<c:url value="/resources/images/detail/basic_img_004.gif"/>" alt="깨끗한 물 사용 : 지하수는 반드시 끓여서 사용" /></li>
	                  <li><img src="<c:url value="/resources/images/detail/basic_img_005.gif"/>" alt="조리실 내부 청결 : 항상 청결히 유지" /></li>
	                  <li><img src="<c:url value="/resources/images/detail/basic_img_006.gif"/>" alt="의심 식재료 사용금지 : 유통기한 지난 식재료 등" /></li>
	                  <li><img src="<c:url value="/resources/images/detail/basic_img_007.gif"/>" alt="계절별 우려식품 사용자제 : 생어패류, 편육류 등" /></li>
	                </ul>
	              </li>
	              <li class="list"><i class="fas fa-pen"></i>중점 관리사항
	                <ul class="help_img_enumerate2">
	                  <li class="bgn"><img src="<c:url value="/resources/images/detail/basic_img_008.gif"/>" alt="과일, 채소 등 세척 철저 :소독액을 만들고 3~5분간 담근 후 흐르는 물에 3회 이상 헹군다" /></li>
	                  <li class="bgn"><img src="<c:url value="/resources/images/detail/basic_img_009.gif"/>" alt="온도,시간 관리 엄수 : 조리시 74℃로 1분 이상조리하고 보관은 더운 음식은 60℃이상, 찬 음식은 4℃ 이하, 주기적 온도관리가 필요" /></li>
	                  <li class="bgn"><img src="<c:url value="/resources/images/detail/basic_img_010.gif"/>" alt="식품별 구분사용으로 교차 오염방지 : 칼, 도마, 행주 등은 구분하여 사용" /></li>
	                </ul>
	              </li>
	        </ul>
            <br/>
            <h3 class="subtitle"><i class="fas fa-sun"></i>관련 사이트 정보</h3>
            <ul class="help_ul_list">
              <li> 식약처 : <a href="http://www.kfda.go.kr" target="_blank">http://www.kfda.go.kr</a></li>
              <li>대한의학회 : <a href="http://www.kams.or.kr" target="_blank">http://www.kams.or.kr</a></li>
            </ul>
		</div>
	</div>
	
	<%@ include file="../include/footer.jsp" %>
	</div>

</body>
</html>

