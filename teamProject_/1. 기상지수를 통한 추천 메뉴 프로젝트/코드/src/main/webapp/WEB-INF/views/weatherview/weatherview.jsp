<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>날씨검색</title>
<%@ include file="../include/header.jsp"%>

<!-- =========================== -->

<!--  style, script는 여기에 입력해주세요 -->

<script>
	$(function() {
		$("#qqq")
				.click(
						function() {
							var opt = $("#searchOpt").val();
							var year = $("#searchYear").val();
							var location = $("#searchLoc").val();
							var month = $("#searchMonth").val();
							if (opt != "X" && year != "X" && month != "X"
									&& location != "X") {
								img = "<img  class='left' src= '${path}/resources/images/weather/"+opt+"/"+year+"/"+location+"/"+month+".png' class='img1'>";
								$("#img1").hide();
								$("#img_out").html(img);
								
							}else{
								alert("모두 선택하세요");
							}
						});
	});

	$(function() {
		$("#ppp")
				.click(
						function() {
							var opt2 = $("#searchOpt2").val();
							var year2 = $("#searchYear2").val();
							var location2 = $("#searchLoc2").val();
							var month2 = $("#searchMonth2").val();

							if (opt2 != "X" && year2 != "X" && month2 != "X"
									&& location2 != "X") {
								img = "<img  class='right'  src= '${path}/resources/images/weather/"+opt2+"/"+year2+"/"+location2+"/"+month2+".png' class='img2'>";
								$("#img2").hide();
								$("#img_out2").html(img);
							}else{
								alert("모두 선택하세요");
							}
						});
	});
</script>
<!-- =========================== -->
<style>
.left {
	width: 100%;
	height: 100%;
}

.right {
	width: 100%;
	height: 100%;
}
.Border{
	border: none;
	width: 100%;
    max-width: 100%;
    margin-bottom: 20px;
    margin:auto;
}
#m1 > a{
	color: #fff !important;
}

#weatherjisu {
		font-weight: bold;
		text-align:center;
		color:#000;
		font-size:30px;
	}

h4{
	text-align:center;
}
#img1{
	width:80%;
}
#img2{
	width:80%;
}

.select-arrow-image {
    width: 100%;
    border: 0;
    box-shadow: none;
   
    background-color: transparent;
    background-position: center right;
    background-size: 100%;
}

#qqq, #ppp{
	background-color: white;
		color: gray;
		border-radius:20px;
		border:2px solid gray;
		padding:5px 10px 5px 10px;
		margin-bottom:5px;
}

#qqq:hover, #ppp:hover{
		background-color: gray;
		color: white;
	}
	
	img{
	box-shadow:  1em 0 .4em gray, -1em 0 .4em gray;
	}
	  
  td{
  	padding:10px;
  	text-align:center;
  }
  
  @media ( max-width: 480px ) {
	.Border{
		border: none;
		width: 400px;
	    max-width: 100%;
	    margin-bottom: 20px;
	    margin:auto;
	}

}


</style>


</head>
<body>
	<div class="fh5co-loader"></div>
	<div id="page">
		<%@ include file="../include/menu.jsp"%>

		<div id="fh5co-explore" class="fh5co-bg-section">
			<div class="container">

				<!-- =========================== -->
				<h3 id="weatherjisu">날씨 데이터 분석</h3>
				<h4>과거의 날씨 데이터를 시각화하며 비교 분석할 수 있습니다..</h4>
				<div class="col-md-6 text-center animate-box">
					<div style="overflow-x:auto;">
					<table class="Border">
					<colgroup>
						<col width="18%"/>
						<col width="18%"/>
						<col width="28%"/>
						<col width="18%"/>
						<col width="18%"/>
					</colgroup>
					<tr>
						<th>종류</th>
						<th>년도</th>
						<th>지역</th>
						<th>월</th>
						<th></th>					
					</tr>
					<tr>
						<td><select name="searchOpt" id="searchOpt" class = "select-arrow-image"
							onchange="OnChange()">
								<option value="X">선택</option>
								<option value="rain">강수량</option>
								<option value="temp">기온</option>
						</select></td>
						<td><select name="searchYear" id="searchYear" class = "select-arrow-image"
							onchange="OnChange()">
								<option value="X">선택</option>
								<option value="2019">2019</option>
								<option value="2018">2018</option>
								<option value="2017">2017</option>
						</select></td>
						<td><select name="searchLoc" id="searchLoc" class = "select-arrow-image"
							onchange="OnChange()">
								<option value="X">선택</option>
								<option value="Seoul">서울특별시</option>
								<option value="Busan">부산광역시</option>
								<option value="Daegu">대구광역시</option>
								<option value="Incheon">인천광역시</option>
								<option value="Gwangju">광주광역시</option>
								<option value="Daejeon">대전광역시</option>
								<option value="Ulsan">울산광역시</option>
								<option value="Gyeonggi">경기도</option>
								<option value="Gangwondo">강원도</option>
								<option value="Chungcheongbuk">충북</option>
								<option value="Chungcheongnam">충남</option>
								<option value="Jeonbuk">전북</option>
								<option value="Jeonnam">전남</option>
								<option value="Kyungbuk">경북</option>
								<option value="Kyungnam">경남</option>
								<option value="Jeju">제주도</option>
						</select></td>

						<td><select name="searchMonth" id="searchMonth" class = "select-arrow-image"
							onchange="OnChange()">
								<option value="X">선택</option>
								<option value="01">01</option>
								<option value="02">02</option>
								<option value="03">03</option>
								<option value="04">04</option>
								<option value="05">05</option>
								<option value="06">06</option>
								<option value="07">07</option>
								<option value="08">08</option>
								<option value="09">09</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
						</select> 
						</td>
						<td>
						<input type="button" id="qqq" value="조회" />
						</td>
					</tr>
					<tr>
					<td colspan="5" style="height:500px;">
					<img src="${path}/resources/images/weather/map.jpg" id="img1"/>
						<span class="left" id="img_out"></span>
					</td>
					</tr>
				</table>
				</div>
				</div>
				<div class="col-md-6 text-center animate-box">
					<div style="overflow-x:auto;">
					<table class="Border">
					<colgroup>
						<col width="18%"/>
						<col width="18%"/>
						<col width="28%"/>
						<col width="18%"/>
						<col width="18%"/>
					</colgroup>
					<tr>
						<th>종류</th>
						<th>년도</th>
						<th>지역</th>
						<th>월</th>
						<th></th>					
					</tr>
					<tr>
						<td><select name="searchOpt2" id="searchOpt2" class = "select-arrow-image"
							onchange="OnChange()">
								<option value="X">선택</option>
								<option value="rain">강수량</option>
								<option value="temp">기온</option>
						</select></td>
						<td><select name="searchYear2" id="searchYear2" class = "select-arrow-image"
							onchange="OnChange()">
								<option value="X">선택</option>
								<option value="2019">2019</option>
								<option value="2018">2018</option>
								<option value="2017">2017</option>
						</select></td>
						<td><select name="searchLoc2" id="searchLoc2" class = "select-arrow-image"
							onchange="OnChange()">
								<option value="X">선택</option>
								<option value="Seoul">서울특별시</option>
								<option value="Busan">부산광역시</option>
								<option value="Daegu">대구광역시</option>
								<option value="Incheon">인천광역시</option>
								<option value="Gwangju">광주광역시</option>
								<option value="Daejeon">대전광역시</option>
								<option value="Ulsan">울산광역시</option>
								<option value="Gyeonggi">경기도</option>
								<option value="Gangwondo">강원도</option>
								<option value="Chungcheongbuk">충북</option>
								<option value="Chungcheongnam">충남</option>
								<option value="Jeonbuk">전북</option>
								<option value="Jeonnam">전남</option>
								<option value="Kyungbuk">경북</option>
								<option value="Kyungnam">경남</option>
								<option value="Jeju">제주도</option>
						</select></td>

						<td><select name="searchMonth2" id="searchMonth2" class = "select-arrow-image"
							onchange="OnChange()">
								<option value="X">선택</option>
								<option value="01">01</option>
								<option value="02">02</option>
								<option value="03">03</option>
								<option value="04">04</option>
								<option value="05">05</option>
								<option value="06">06</option>
								<option value="07">07</option>
								<option value="08">08</option>
								<option value="09">09</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
						</select> 
						</td>
						<td>
						<input type="button" id="ppp" value="조회" />
						</td>
					</tr>
					<tr>
					<td colspan="5" style="height:500px;">
					<img src="${path}/resources/images/weather/map.jpg" id="img2"/>
						<span class="right" id="img_out2"></span>
					</td>
					</tr>
				</table>
				</div>
				</div>
				<!--  내용은 여기에 입력해주세요 -->

				<!-- =========================== -->

			</div>
		</div>
		<%@ include file="../include/footer.jsp"%>
	</div>

</body>
</html>

