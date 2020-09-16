<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>생활지수 상세보기</title>
	<%@ include file="../include/header.jsp" %>
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
		color:#000;
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
				<td class="selectJisu"><a href="lifejisudetail.do?jisu=uv" >자외선 지수</a></td>
				<td><a href="lifejisudetail.do?jisu=frozen" >동파가능 지수</a></td>
				<td><a href="lifejisudetail.do?jisu=sensheat" >더위체감 지수</a></td>
			</tr>	
		</table>
		<br/>
				<div class="container">
			<p class="textbox">
				 <i class="	fas fa-splotch"></i>제공기간 : 3월~11월 / 일 2회 생산 (6시, 8시)
			</p>
			<br/>
	        <h3 class="subtitle"><i class="fas fa-sun"></i>정의</h3>
	        <ul class="help_ul_list li">
		        <li>자외선지수는 태양고도가 최대인 남중시간 때 지표에 도달하는 자외선 B(UV-B)영역의 복사량을 지수로 환산한 것임</li>
		        <li>지상으로부터 약 13~15km 사이의 대기인 성층권의 오존은 태양광선 중 인체에 해로운 자외선(UV)으로부터 지구상의 생명체를 보호하는 얇은 보호막 역할을 함. 그러나 1980년대에 들어서 과학자들은 성층권 오존이 감소되고 있다는 증거를 포착하였음. 오존의 감소는 지표면에 도달하는 해로운 자외선(UV-B)을 증가시킴</li>
	        </ul>
	        <br/>
	        <h3 class="subtitle"><i class="fas fa-sun"></i>산출방법</h3>
	        <div class="textbox">
	          	<p align="center">맑은 날씨의 자외선 값에 날씨예보를 통한 구름보정 값을 적용하여 산출</p>
				<p align="center">수치자료(기압, 하늘상태, 강수량, 강수형태 등)와 기상관측자료(오존 값 등) 이용</p>
	        </div>
	        <br/>
	        <h3 class="subtitle"><i class="fas fa-sun"></i>단계별 설명및 주의사항</h3>
	        <table class="table" summary="불쾌지수에 따른 불쾌감을 느끼는 정도로 단계, 지수범위, 자외선 강도 및 주의사항을 나타낸 표입니다" >
				<colgroup>
		          <col width="15%" />
		          <col width="15%" />
		          <col width="70%" />
	          </colgroup>
	          <thead>
	            <tr>
	              <th scope="col">단계</th>
	              <th scope="col">지수범위 </th>
	              <th scope="col">설명 및 주의사항 </th>
	            </tr>
	          </thead>
	          <tbody>
	            <tr>
	              <td>위험</td>
	              <td>11이상</td>
	              <td class="al">태양에 노출시 극도로 위험하며 노출된 피부는 몇 분내에 탈 수 있음. 겉옷을 입고 모자와 선글라스를 쓰고, 자외선 차단제를 2시간마다 충분히 발라야 함</td>
	            </tr>
	            <tr>
	              <td>매우높음</td>
	              <td>8~10</td>
	              <td class="al">태양에 노출시 매우 위험하며 노출된 피부는 빠르게 타서 위험해질수 있음. 겉옷을 입고 모자와 선글라스를 쓰고, 자외선 차단제를 발라야 함</td>
	            </tr>
	            <tr>
	              <td>높음</td>
	              <td>6~7</td>
	              <td class="al">태양에 노출시 위험하며 햇볕에 노출시 보호가 필요함. 겉옷을 입고 모자와 선글라스를 쓰고, 자외선 차단제를 발라야 함</td>
	            </tr>
	            <tr>
	              <td>보통</td>
	              <td>3~5</td>
	              <td class="al">태양에 노출 시 위험 보통. 햇볕에 노출시 겉옷을 입고 자외선 차단제를 바르는 등 주의해야 함</td>
	            </tr>
	            <tr>
	              <td>낮음</td>
	              <td>0~2</td>
	              <td class="al">보통의 사람의 경우, 자외선 복사로 인한 위험 낮음</td>
	            </tr>
	          </tbody>
	        </table>
	        <p class="caution">* 자외선지수는 WMO/WHO 등 국제기구 등에서 제안하는 “Global Solar UV Index”의 가이드라인을 활용함</p>
		</div>
	</div>	
	
	<%@ include file="../include/footer.jsp" %>
		
	</div>

</body>
</html>

