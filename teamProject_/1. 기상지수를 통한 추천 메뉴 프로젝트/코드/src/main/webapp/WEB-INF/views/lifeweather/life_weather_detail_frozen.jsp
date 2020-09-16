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
				<td class="selectJisu"><a href="lifejisudetail.do?jisu=frozen" >동파가능 지수</a></td>
				<td><a href="lifejisudetail.do?jisu=sensheat" >더위체감 지수</a></td>		
			</tr>
		</table>
		<br/>
		
		<div class="container">
			<p class="textbox">
				 <i class="	fas fa-splotch"></i>제공기간 : 12월~다음해2월 / 일 8회 생산 (3시간 간격)
			</p>
			<br/>
	        <h3 class="subtitle"><i class="fas fa-sun"></i>정의</h3>
	        <div  class="textbox">
	         	<p>동파가능지수란 기온과 일최저기온을 이용하여, 겨울철 한파로 인해 발생되는 수도관 및 계량기의 동파발생가능성을 나타낸 지수임</p>
	         	<p>서울상수도사업본부 및 서울시 수도자제사업부에서 사용하고 있는 수도관 동파 기준에 근거하여 개발되었으며, 한파로 인한 가정용, 공업용 수도관 및 계량기의 동파 가능성을 예측, 방지대책을 세우거나 계량기 설계와 관련된 내구성을 측정하는데 활용될 수 있음</p>
	         	<p>동파란 동절기에 수도계량기가 얼어 터지거나 숫자판 유리가 파손되어 지침을 판독 할 수 없는 상태를 말함</p>
	        </div>
	        <br/>
	        <h3 class="subtitle"><i class="fas fa-sun"></i>산출방법</h3>
	        <div class="textbox">
	          <p>기온, 일최저기온을 이용하여 지수를 매우높음, 높음, 보통, 낮음의 4단계로 분류.</p>
	        </div>
	        <br/>
	        <h3 class="subtitle"><i class="fas fa-sun"></i>단계별 설명및 주의사항</h3>
	        <table class="table" summary="동파가능지수에 따른 대처요령 으로 단계, 기온조건, 대처요령를 나타낸 표입니다" >
				<colgroup>
		          <col width="15%" />
		          <col width="20%" />
		          <col width="65%" />
		          </colgroup>
		          <thead>
		            <tr>
		              <th scope="col">단계 </th>
		              <th scope="col">기상조건</th>
		              <th scope="col">설명 및 주의사항</th>
		            </tr>
		          </thead>
		          <tbody>
		            <tr>
		              <td>매우높음</td>
		              <td >기온이 -10℃ 이하</td>
		              <td class="al">영하 10℃이하 혹한이 계속될 때에는 수도꼭지를 조금 틀어 수도관에 물이 흐르도록 해야 함</td>
		            </tr>
		            <tr>
		              <td>높음</td>
		              <td >기온이 -10~-5℃ 이하이고, 전일최저기온이 -5℃ 미만 </td>
		              <td class="al" rowspan="2"><ul>
		                  <li>- 수도계량기 보호함의 내부에는 헌옷을 채우고, 외부에는 테이프로 밀폐시켜 찬 공기가 스며들지 않도록 보호해야 함</li>
		                  <li>- 복도식 아파트는 수도계량기 동파가 많이 발생하므로 수도계량기 보온에 유의하여야 함</li>
		                  <li>- 장기간 집을 비우게 될 때는 수도꼭지를 조금 틀어 수도관에 물이 흐르도록 해야 함</li>
		                  <li>- 마당에 노출된 수도관은 보온재로 감싸주고, 앞 고동의 수도꼭지는 항상 열어 놓고 뒷고동만 열고 잠궈야 함</li>
		                  <li>- 화장실 등 수도관이 노출되어 있는 경우에는 보온재로 감싸서 보온을 잘 하여야 함</li>
		                  <li>- 집안의 수도관이 얼었을 때는 헤어드라이어로 서서히 가열하여 녹이거나, 미지근한 물로 시작하여 점차 뜨거운 물로 녹이면 됨</li>
		                </ul></td>
		            </tr>
		            <tr>
		              <td>보통</td>
		              <td >기온이 -10℃~-5℃ 이하이고, 전일최저기온이 -5℃ 이상</td>
		            </tr>
		            <tr>
		              <td>낮음</td>
		              <td >기온이-5℃ 초과</td>
		              <td>동파가능성 낮음</td>
		            </tr>
		          </tbody>

	        </table>
	        
		</div>
	</div>
	
	<%@ include file="../include/footer.jsp" %>
	</div>

</body>
</html>

