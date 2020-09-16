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
		color:#000;
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
	.ul_square_HELP{
		color:#000;
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
				<td class="selectJisu"><a href="lifejisudetail.do?jisu=sky" >대기확산 지수</a></td>
				<td><a href="lifejisudetail.do?jisu=uv" >자외선 지수</a></td>
				<td><a href="lifejisudetail.do?jisu=frozen" >동파가능 지수</a></td>
				<td><a href="lifejisudetail.do?jisu=sensheat" >더위체감 지수</a></td>		
			</tr>
		</table>
		<br/>
		
		<div class="container">
			<p class="textbox">
				 <i class="	fas fa-splotch"></i>제공기간 : 11월~5월 / 일 8회 생산 (3시간 간격)
			</p>
			<br/>
	        <h3 class="subtitle"><i class="fas fa-sun"></i>정의</h3>
	        <div  class="textbox">
	         	<p>대기확산지수란 오염물질이 대기중에 유입되어 존재할 경우, 대기상태(소산과 관련된 기상요소)에 의해 변화될 수 있는 가능성 예보를 말함.</p>
	        </div>
	        <br/>
	        <h3 class="subtitle"><i class="fas fa-sun"></i>산출방법</h3>
	        <ul class="ul_square_HELP">
				  <li>혼합층높이, 환기지수, 강수유무, 역전층유무, 지표면과 상층의 바람, 대기안정도 등을 이용하여 산출
			
					<ul>
						<li>역전층
						  <ul>
								<li>기온은 고도가 증가함에 따라 감소하는 분포를 보이는데, 이와는 반대로 기온이 고도가 증가함에 따라 상승하는 층을 역전층이라 하고, 역전층이 대기 중에 있으면 오염물질의 확산이 방해를 받게 됨.</li>
							</ul>
						</li>
						<li>대기안정도
						  <ul>
								<li>역학적 평형상태에 있는 대기를 약간 흐트러지게 놓았을 때 원래의 상태로 되돌아가려고 하거나 그것을 계기로 대기의 상태가 크게 변하려고 하는 정도를 말함. 평형상태에 놓인 대기 중에 작은 요란이 발생하여 그것이 점차 발달해 갈 경우 대기는 불안정하다고 하며, 반대로 그 요란이 점차 감쇄되어 대기가 원래의 평형 상태에 가까워지면 그 대기는 안정하다고 함.</li>
							</ul>
						</li>
						<li>혼합층 깊이
						  <ul>
								<li>대기경계층 속에서 대류에 의하여 상하의 혼합을 받는 층을 혼합층이라 하며, 그 혼합이 미치는 높이는 최고 기온이 나타나는 낮시간에 가장 높아져 대개는 이때가 최대 혼합층 깊이가 됨.</li>
							</ul>
						</li>
						<li>환기지수
						  <ul>
								<li>혼합층 깊이내의 평균풍속 × 혼합층 깊이</li>
							</ul>
						</li>
					</ul>
				  </li>
				</ul>

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
						<td scope="row">낮음</td>
						<td>7</td>
						<td class="al">기상조건에 의해 대기변화 가능성이 낮음</td>
					</tr>
					<tr>
						<td scope="row">보통</td>
						<td>6</td>
						<td class="al">기상조건에 의해 대기변화 가능성이 보통</td>
					</tr>
					<tr>
						<td scope="row">높음</td>
						<td>3~5</td>
						<td class="al">기상조건에 의해 대기변화 가능성이 높음</td>
					</tr>
					<tr>
						<td scope="row">매우 높음</td>
						<td>0~2</td>
						<td class="al">기상조건에 의해 대기변화 가능성이 매우높음</td>
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

