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
	    alert("상대습도를 입력하세요.");
	    document.c2f.jisuwind.focus();
	    return false;
	  }
	  var t2 = (9.0/5.0)*(document.c2f.jisutemp.value)+32;
	  var v2 = document.c2f.jisuwind.value;
	  var v3 = -42.379 + (2.04901523*t2) + (10.14333127*v2) - (0.22475541*t2*v2) - (0.00683783*t2*t2) - (0.05481717*v2*v2) + (0.00122874*t2*t2*v2) + (0.00085282*t2*v2*v2) - (0.00000199*t2*t2*v2*v2);
	  var f_adj = 0.0;
	  if (v2 < 13 && t2 >= 80 && t2 <= 112) {
	          f_adj = 0.25*(13-v2) * sqrt((17-abs(t2-95.0))/17.0);
	          v3 = v3 - f_adj;
	        }
	        if (v2 > 85.0 && t2 >= 80.0 && t2 <= 87) {
	          f_adj = ((v2-85)/10.0)*((87-t2) / 5.0);
	          v3 = v3 + f_adj;
	        }
	        if (t2 < 80.0 ) {
	           v3 = t2;
	       }
		v3 = (v3-32)*(5.0/9.0);
		v3 = Math.round(v3 *10) / 10.0;
		document.c2f.jisuvalue.value = v3;
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
	.view_btn {
	    left: 50px;
	    margin: 10px 0 7px 538px;
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
				<tr>
				<td><a href="lifejisudetail.do?jisu=foodpoison" >식중독 지수</a></td>
				<td><a href="lifejisudetail.do?jisu=senstemp" >체감 온도</a></td>
				<td class="selectJisu"><a href="lifejisudetail.do?jisu=heat" >열 지수</a></td>
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
				 <i class="	fas fa-splotch"></i>제공기간 : 6월~9월 / 일 8회 생산 (3시간 간격)
			</p>
			<br/>
			<form name="c2f" method="get" action="life_weather_detail.jsp">
				<fieldset class="help_form_1 calc">
					<p><i class="fas fa-splotch"></i>열 지수 산출 :</p>
					<ul>
						<li><label for="jisutemp">기온</label><input type="text" class="tbox_03" name="jisutemp" id="jisutemp" /> ℃</li>
						<li><label for="jisuwind" class="ML10">습도</label><input type="text" class="tbox_03" name="jisuwind" id="jisuwind" /> %</li>
						<li class="ML10"><a href="#" onclick="cal(); return false;">계산하기</a></li>
						<li><label class="ML10" for="jisuvalue">열지수  </label><input type="text" class="tbox_03" name="jisuvalue" id="jisuvalue"/></li>
					</ul>
				</fieldset>
			</form>
			<p class="view_btn" style="text-align:right;">
			<a href="popup_04.do" target="_blank" title="새 창 열림" onclick="window.open(this.href,'tablewindow','width=1000px, height=700px, scrollbars=no'); return false;" onkeypress="this.onclick();">산출표 보러가기</a>
			</p>
			
			<br/>
	        <h3 class="subtitle"><i class="fas fa-sun"></i>정의</h3>
	        <ul class="help_ul_list li">
		        <li>열지수는 기온과 습도에 따른 사람이 실제로 느끼는 더위를 지수화한 것임</li>
		        <li>고온이 지속되는 기간 중 사망자 수가 현저하게 증가하는 것에 주목한 미국 기상청(NWS)에서 고온다습한 환경에 대한 대국민 경보를 더욱 효율적으로 제시하여 열파에 미리 대처할 수 있는 체제로 열지수(Heat Index : HI, apparent temperature) 개발</li>
		        <li>열지수는 그늘지고 약한 바람이 부는 환경에서 만들어진 것이므로 태양빛에 직접 노출되면 열지수값이 발표치보다 8.3℃ 정도 더 높아질 수 있음</li>
		        <li>강한 바람, 특히 뜨겁고 습한 바람이 불면 더 위험한 환경이 될 수 있으며, 동일한 기온이라도 습도에 따라 열지수 달라짐</li>
	        </ul>
	        <br/>
	        <h3 class="subtitle"><i class="fas fa-sun"></i>단계별 설명및 주의사항</h3>
	        <table class="table" summary="식열지수에 따른 위험가능성을 단계, 	지수범위, 지속적인 노출 시 위험사항으로 나타낸 표입니다" >
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
				        <td>매우높음</td>
				        <td>54 이상</td>
				        <td class="al"><p>보통사람이 열에 지속적으로 노출될 시 열사·일사병 위험 매우 높음</p></td>
			        </tr>
			        <tr>
				        <td>높음</td>
				        <td><p>41이상 54미만</p></td>
				        <td class="al"><p>보통사람이 열에 지속적으로 노출되면, 신체활동 시 일사병, 열경련, 열피폐 위험 높음</p></td>
			        </tr>
			        <tr>
				        <td>보통</td>
				        <td><p>32이상 41미만</p></td>
				        <td class="al"><p> 보통사람이 열에 지속적으로 노출되면, 신체활동 시 열사병, 열경련, 열피폐 가능성 있음  </p></td>
			        </tr>
			        <tr>
				        <td>낮음</td>
				        <td><p>32미만</p></td>
				        <td class="al"><p>보통사람이 열에 지속적으로 노출되면, 신체활동 시 피로 위험 높음</p></td>
			        </tr>
	        	</tbody>
	        </table>
		</div>
		
	</div>
	
	<%@ include file="../include/footer.jsp" %>
	</div>


</body>
</html>

