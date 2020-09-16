<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Main Page</title>
	<%@ include file="../include/header.jsp" %>
	<style>
		.product{
			font-size:25px;
		}
		.right-btn{
			margin-top:120px;
		}
		.font{
			 font-size:20px;
		}
		.add-box{
			height:281px;
		}
		.mem{
			padding:0;
		}
		#slide{
			width:100px;
		}
		#slide2{
			color:white; 
			font-size:35px; 
			width:500px;
		}
		@media ( max-width: 480px ) {
		
			#slide{
				width:50px;
			}
			#slide2{
				color:white; 
				font-size:15px; 
				width:250px;
			}
			.img-responsive{
				width:70%;
				margin:auto;
			}
		
		}
		
	</style>
	<script>
	$(document).ready(function(){
		var interval=1500;
		var interval2=3000;
		var n=0;
		var m=0;
		var img=new Array();
		img[0]=new Image(); img[0].src="${path}/resources/images/weather/img/cloudy.png";
		img[1]=new Image(); img[1].src="${path}/resources/images/weather/img/fog.png";
		img[2]=new Image(); img[2].src="${path}/resources/images/weather/img/partly_cloudy.png";
		img[3]=new Image(); img[3].src="${path}/resources/images/weather/img/rain.png";
		img[4]=new Image(); img[4].src="${path}/resources/images/weather/img/sleet.png";
		img[5]=new Image(); img[5].src="${path}/resources/images/weather/img/snow.png";
		img[6]=new Image(); img[6].src="${path}/resources/images/weather/img/sunny.png";
		var imgs = new Array("${path}/resources/images/weather/img/cloudy.png",
				"${path}/resources/images/weather/img/fog.png",
				"${path}/resources/images/weather/img/partly_cloudy.png",
				"${path}/resources/images/weather/img/rain.png",
				"${path}/resources/images/weather/img/sleet.png",
				"${path}/resources/images/weather/img/snow.png",
				"${path}/resources/images/weather/img/sunny.png"
				);
		var temp = new Array();
		for(var i=1;i<20;i++ ){
			var si=$("#si"+i).val();
			var tem=$("#temp"+i).val();
			var rain=$("#rain"+i).val();
	     	temp.push(si+"<br/>"+"기온 : "+tem+", 강수량 : "+rain);
	   		}
		
		rotate2=function(){
			if(navigator.appName=="Netscape" && document.getElementById){
				document.getElementById("slide").src=imgs[n];
			}
			else document.images.slide.src=imgs[n];
			(n==(imgs.length-1))?n=0:n++;
			setTimeout("rotate2()",interval);
		}
		rotate3=function(){
			if(navigator.appName=="Netscape" && document.getElementById){
				document.getElementById("slide2").innerHTML=temp[m];
			}
			(m==(temp.length-1))?m=0:m++;
			setTimeout("rotate3()",interval2);
		}
		rotate2();
		rotate3();
	})
	
		
	function rotate(){
			
		}
	
	</script>
</head>
<body onload="rotate()">
<div class="fh5co-loader"></div>
	<div id="page">
		<nav class="fh5co-nav" role="navigation">
		<div class="top-menu">
				<div class="container">
					<div class="row">
					<div class="col-xs-1"></div>
					<div class="col-xs-11 text-right menu-1">
					<c:choose>
						<c:when test="${empty UID}">
							<ul><li class="btn-cta"><a href="${path}/loginFrm.do"><span>로그인</span></a></li>
								<li class="btn-cta"><a href="${path}/joinProc.do"><span>회원가입</span></a></li>
							</ul>
						</c:when>
						<c:otherwise>
							<ul>
								<li class="btn-cta"><a href="${path}/logoutProc.do"><span>로그아웃</span></a></li>
							</ul>						
						</c:otherwise>
					</c:choose>
					</div>
					</div>
				</div>
		</div>
		<div class="top-menu">
			<div class="container">
				<div class="row">
					<div class="col-xs-1">
						<div id="fh5co-logo"><a href="${path}/main.do">JESUS<span>.</span></a></div>
					</div>
					<div class="col-xs-11 text-right menu-1">
						<ul>
							<li class="has-dropdown"  id="m1">
								<a><span>날씨정보</span></a>
								<ul class="dropdown">
									<li><a href="${path}/weathertoday.do">오늘의 날씨</a></li>
									<li><a href="${path}/weatherview.do">날씨 분석</a></li>
								</ul>
							</li>
							<li class="has-dropdown" id="m2">
								<a><span>생활지수</span></a>
								<ul class="dropdown">
									<li><a href="${path}/lifejisu.do">오늘의 생활지수</a></li>
									<li><a href="${path}/recommendList.do">추천 상품</a></li>
								</ul>
							</li>
							<li id="m3"><a href="${path}/board/boardList.do">게시판</a></li>
							<li id="m4"><a href="${path}/noticeList.do">공지사항</a></li>
							<c:choose>
								<c:when test="${LEVEL eq 0}">
									<li class="has-dropdown" id="m5">
											<a><span>회원정보</span></a>
											<ul class="dropdown">
												<li><a href="${path}/joinDetail.do" >회원정보 조회</a></li>
												<li><a href="${path}/joinPwUpdate.do" >비밀번호 수정</a></li>
												<li><a href="${path}/joinWithdraw.do" >회원탈퇴</a></li>
											</ul>
										</li>
								</c:when>
								<c:when test="${LEVEL eq 1}">	
									<li class="has-dropdown" id="m6">
										<a><span>회원관리</span></a>
										<ul class="dropdown">
											<li><a href="${path}/memberManage.do?nowPage=1" >회원리스트</a></li>
										</ul>
									</li>
								</c:when>
							</c:choose>	
						</ul>
					</div>
				</div>
				
			</div>
		</div>
	</nav>

	<header id="fh5co-header" class="fh5co-cover" role="banner" style="background-image:url(<c:url value="/resources/images/img_bg_1.jpg"/>);" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center">
					<div class="display-t">
						<div class="display-tc animate-box" data-animate-effect="fadeIn">
							<h1>오늘의 날씨</h1>
							<table align="center">
							<tr>
								<td>
									<img src="${path}/resources/images/weather/img/cloudy.png" id="slide">
								</td>
							</tr>
							<tr>
								<td>
									<form>
									<c:forEach var="item" items="${list3}" varStatus="status">
										<input type="hidden" id="temp${status.count}" value="${item.WE_TEMPERATURE}℃">
									</c:forEach>
									<c:forEach var="item" items="${list3}" varStatus="status">
										<input type="hidden" id="rain${status.count}" value="${item.WE_RAIN}ml">
									</c:forEach>
									<c:forEach var="item" items="${list2}" varStatus="status">
										<input type="hidden" id="si${status.count}" value="${item.local_si}">
									</c:forEach>
									</form>
									<a href="${path}/weathertoday.do">
										<div id="slide2"></div>
									</a>
								</td>
							</tr>
							
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	
	<div id="fh5co-counter" class="fh5co-counters">
		<div class="container">
			<div class="row">
			<h3>오늘의 생활지수</h3>
				<div class="col-md-3 text-center animate-box" align="center">
					<a href="lifejisudetail.do?jisu=foodpoison">식중독 지수</a>
					<img src="<c:url value="/resources/images/foodpoison.jpg"/>" class="img-responsive"/>
					<c:choose>
						<c:when test="${vo1.jisu_foodpoison==999}">
					        <span class="product font">지금은 제공되지 않습니다.</span>
					    </c:when>
					    <c:otherwise>
							<span class="product">${vo1.jisu_foodpoison}</span>
					    </c:otherwise>
					</c:choose>
				</div>
				<div class="col-md-3 text-center animate-box" align="center">
					<a href="lifejisudetail.do?jisu=senstemp" >체감 온도</a>
					<img src="<c:url value="/resources/images/senstemp.jpg"/>" class="img-responsive"/>
					<c:choose>
						<c:when test="${vo1.jisu_senstemp==999}">
					    	<span class="product font">지금은 제공되지 않습니다.</span>
					    </c:when>
					    <c:otherwise>
							<span class="product">${vo.jisu_senstemp}</span>
					    </c:otherwise>
					</c:choose>
				</div>
				<div class="col-md-3 text-center animate-box" align="center">
					<a href="lifejisudetail.do?jisu=heat" >열 지수</a>
					<img src="<c:url value="/resources/images/heat.jpg"/>" class="img-responsive"/>
					<c:choose>
						<c:when test="${vo1.jisu_heat==999}">
					    	<span class="product font">지금은 제공되지 않습니다.</span>
					    </c:when>
					    <c:otherwise>
							<span class="product">${vo1.jisu_heat}</span>
					    </c:otherwise>
					</c:choose>
				</div>
				<div class="col-md-3 text-center animate-box add-box">
					<a href="lifejisu.do" class="btn btn-primary right-btn">생활지수 더 보기</a>
				</div>
			</div>
		</div>
	</div> 

	<div id="fh5co-counter" class="fh5co-counters">
		<div class="container">
			<div class="row">
			<h3>오늘의 추천 메뉴</h3>
			<c:forEach items="${list}" var="item">
				<div class="col-md-3 text-center animate-box">
					<h3>${item.product_seq}</h3>
					<a href="recommendDetail.do?recomm_prod_no=${item.product_no}"><img class="img-responsive" src="<c:url value="/${item.product_image}"/>" alt=""></a>
					<span class="product" ><a href="recommendDetail.do?recomm_prod_no=${item.product_no}">${item.product_name}</a></span>
				</div>
			</c:forEach>
			<div class="col-md-3 text-center animate-box add-box">
				<a href="recommendList.do" class="btn btn-primary right-btn">상품 더 보기</a>
			</div>
			</div>
		</div>
	</div> 
	<%@ include file="../include/footer.jsp" %>
	</div>

</body>
</html>
