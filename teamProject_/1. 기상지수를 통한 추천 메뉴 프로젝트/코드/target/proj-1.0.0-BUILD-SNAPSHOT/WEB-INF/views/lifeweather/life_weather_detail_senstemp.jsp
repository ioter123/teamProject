<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	
	<title>생활지수 상세보기</title>
	<%@ include file="../include/header.jsp" %>
	<script>
	function calc(f) {
		if(f.ta.value == "") { alert("온도를 숫자로 입력해 주세요."); return; }
		if(f.ws.value == "") { alert("바람을 숫자로 입력해 주세요."); return; }
		var ta = parseFloat(f.ta.value);
		var ws = parseFloat(f.ws.value);
		var rs = getNewWCT(ta, ws);
		f.result.value = Math.round(rs);
	}
	function getNewWCT(Tdum,Wdum) {
		var T = Tdum;
		var W = Wdum*3.6;
		var result = 0.0;
		if ( W > 4.8 ) {
				W = Math.pow(W,0.16);
				result = 13.12 + 0.6215 * T - 11.37 * W + 0.3965 * W * T;
				if(result > T) {
					result = T;
				}
		}
		else {
			result = T;
		}
		return result;
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
		margin : 0 20px 0 20px;
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
	.view_btn {
	    left: 50px;
	    margin: 10px 0 7px 538px;
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
				<td class="selectJisu"><a href="lifejisudetail.do?jisu=senstemp" >체감 온도</a></td>
				<td><a href="lifejisudetail.do?jisu=heat" >열 지수</a></td>
				<td><a href="lifejisudetail.do?jisu=discomfort" >불쾌 지수</a></td>
				<td><a href="lifejisudetail.do?jisu=sky" >대기확산 지수</a></td>
				<td><a href="lifejisudetail.do?jisu=uv" >자외선 지수</a></td>
				<td><a href="lifejisudetail.do?jisu=frozen" >동파가능 지수</a></td>
				<td><a href="lifejisudetail.do?jisu=sensheat" >더위체감 지수</a></td>
			</tr>	
		</table>
		<br/>
				<div class="container">
			<p class="textbox">
				 <i class="	fas fa-splotch"></i>제공기간 : 11월~다음해 3월 / 일 8회 생산 (3시간 간격)
			</p>
			<br/>
			<form name="calform" method="get" action="life_weather_detail.jsp" onsubmit="calc(this); return false;">
				<fieldset class="help_form_1 calc">
					<p><i class="fas fa-splotch"></i>체감 온도 산출 : </p>
					<ul>
						<li><label for="ta">기온</label><input type="text" class="tbox_03" name="ta" id="ta" /> ℃</li>
						<li><label for="ws" class="ML10">바람</label><input type="text" class="tbox_03" name="ws" id="ws" /> %</li>
						<li class="ML10"><a href="#" onclick="calc(document.calform); return false;">계산하기</a></li>
						<li><label class="ML10" for="temp_result">체감 온도</label><input type="text" class="tbox_03" name="result" id="temp_result"/></li>
					</ul>
				</fieldset>
			</form>
			<p class="view_btn" style="text-align:right;">
			<a href="popup_03.do" target="_blank" title="새 창 열림" onclick="window.open(this.href,'tablewindow','width=1000px, height=700px, scrollbars=no'); return false;" onkeypress="this.onclick();">산출표 보러가기</a>
			</p>
			<p class="caution" class="comm">* 기온 10℃ 이하, 풍속 1.3m/s 이상일때 체감온도가 산출됩니다</p>
			<br/>
	        <h3 class="subtitle"><i class="fas fa-sun"></i>정의</h3>
	        <ul class="help_ul_list li">
		        <li>체감온도는 외부에 있는 사람이나 동물이 바람과 한기에 노출된 피부로부터 열을 빼앗길 때 느끼는 추운 정도를 나타내는 지수임</li>
		        <li>바람이 강해질수록 피부의 열 손실률은 높아지게 되며 결국 내부체온을 떨어뜨리게 됨. 예를 들어 영하 10℃에서 풍속이 5km/h일 때 체감온도는 영하 13℃이지만 풍속이 30km/h가 되면 체감온도가 영하 20℃까지 떨어져 강한 추위를 느끼게 됨</li>
	        </ul>
	        <br/>
	        <h3 class="subtitle"><i class="fas fa-sun"></i>산출방법</h3>
	        <div class="textbox">
	        	<p class="modify"><img src="<c:url value="/resources/images/detail/modify_04.gif"/>" alt="수식" /></p>
          		<p class="caution modify">* 현재 사용하고 있는 체감온도 산출식은 2001년 8월 캐나다 토론토에서 열린 Joint Action Group for Temperature Indices (JAG/TI) 회의에서 발표된 것으로 미국과 캐나다 등 북아메리카 국가들을 중심으로 최근에 가장 널리 사용되고 있음</p>
	        </div>
	        <br/>
	        <h3 class="subtitle"><i class="fas fa-sun"></i>단계별 설명및 주의사항</h3>
	        <table class="table" summary="동상가능지수에 따른 대처요령 으로 단계, 가상조건, 인체영향을 나타낸 표입니다" >
				<colgroup>
		          <col width="10%" />
		          <col width="15%" />
		          <col width="*" />
		          </colgroup>
		          <thead>
		            <tr>
		              <th scope="col">단계 </th>
		              <th scope="col">지수범위</th>
		              <th scope="col">설명 및 주의사항</th>
		            </tr>
		          </thead>
		          <tbody>
		            <tr>
		              <td>위험</td>
		              <td>-45 미만</td>
		              <td class="al">
		              노출된 피부는 몇분내에 얼게 되고, 야외 활동시 저체온 위험이 매우 크므로 방풍·보온기능이 있는 매우 따뜻한 겹옷을 착용해야 함. 또한 노출된 모든 피부를 덮고 모자, 벙어리장갑, 스카프, 목도리, 마스크의 착용이 필요함. 야외환경은 생명에 매우 위험하므로 야외활동은 가급적 짧게 하거나 취소하여 실내에 머무를 수 있도록 할 것.
					  </td>
		            </tr>
		            <tr>
		              <td>경고</td>
		              <td>-45~-25 미만</td>
		              <td class="al">10~15분이내 동상 위험이 있고, 보호장구 없이 장기간 노출시 저체온에 빠질 위험이 크므로 방풍기능이 있는 겹옷이나 따뜻한 겹옷을 착용해야함. 또한 노출된 모든 피부를 덮고 모자, 벙어리장갑, 스카프, 목도리, 마스크의 착용이 필요함. 피부가 바람에 직접 노출되지 않도록 할 것</td>
		            </tr>
		            <tr>
		              <td>주의</td>
		              <td>-25~-10 미만</td>
		              <td class="al">노출된 피부에 매우 찬 기운이 느껴지고, 보호장구 없이 장기간 노출시 저체온에 빠질 위험이 있으므로 방풍기능이 있는 겹옷이나 따뜻한 옷을 착용해야함. 또한 모자, 벙어리장갑, 스카프의 착용이 필요함</td>
		            </tr>
		            <tr>
		              <td>관심</td>
		              <td>-10 이상</td>
		              <td class="al">추위를 느끼는 정도가 증가함. 긴 옷이나 따뜻한 옷의 착용이 필요함</td>
		            </tr>
		          </tbody>
	        </table>
		</div>
		
	</div>
	
	<%@ include file="../include/footer.jsp" %>
	</div>

</body>
</html>

