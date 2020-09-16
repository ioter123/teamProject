<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>오늘의 생활지수</title>
	<%@ include file="../include/header.jsp" %>
	<script>
	$(document).ready(function(){		
		
	});
	</script>
	<style>
	#m2 > a{
		color: #fff !important;
	}
	#jisu_local_code{
		width: 120px;
		height:25px;
		margin:8px;
	    border: 0;
	    box-shadow: 2px 2px 2px 2px gray;
	    background-color: transparent;
	    background-position: center right;
	    background-size: 15px 10px;
	}
	.jisuimg {
	width:30%;
	height: auto;
	
	}
	.jisutext {
		color:black;
		font-size:30px;
		display:inline-block;
		width:60%;
		text-align:center;
	}
	.jisutext2 {
		color:black;
		font-size:20px;
		display:inline-block;
		width:65%;
		text-align:center;
	}
	td, th{
		width:50%;
	}
	#weatherjisu {
		font-weight: bold;
		text-align:center;
		color:#000;
		font-size:30px;
	}

	</style>
</head>
<body>
<div class="fh5co-loader"></div>
	<div id="page">
	<%@ include file="../include/menu.jsp" %>
	
	<div id="fh5co-explore" class="fh5co-bg-section">
		<div class="container">
				<h3 id="weatherjisu">생활지수</h3>
			<div class="row animate-box text-right">
			<form name="locfrm" id="locfrm" action="lifejisu.do" method="POST">
				<select name="jisu_local_code" id="jisu_local_code" onchange="this.form.submit()">
				<c:forEach items="${arealist}" var="item">
					<option value="${item.value}"<c:if test="${item.value==param.jisu_local_code }">selected</c:if>>${item.key}</option>
				</c:forEach>
				</select>
			</form>
			</div>
			<div class="row animate-box">
				<h5 style="text-align:right; margin-top:5px;">* 각 생활지수 클릭 시 상세정보를 확인할 수 있습니다.</h5>
				<table class="table">
					<tbody>
						<tr>
							<th><a href="lifejisudetail.do?jisu=foodpoison">식중독 지수</a></th>
							<th><a href="lifejisudetail.do?jisu=senstemp" >체감 온도</a></th>
						</tr>
						<tr>
							<td>
							<a href="lifejisudetail.do?jisu=foodpoison" >
							<img src="<c:url value="/resources/images/foodpoison.jpg"/>" class="jisuimg"/>
							</a>
							<a href="lifejisudetail.do?jisu=foodpoison" >
							<c:choose>
								<c:when test="${vo1.jisu_foodpoison==999}">
							        <span class="jisutext2">지금은 제공되지 않습니다.</span>
							    </c:when>
							    <c:otherwise>
									<span class="jisutext">
									<c:if test="${vo1.jisu_foodpoison>=95}">위험</c:if>
									<c:if test="${vo1.jisu_foodpoison>=70 && vo1.jisu_foodpoison<95}">경고</c:if>
									<c:if test="${vo1.jisu_foodpoison>=35 && vo1.jisu_foodpoison<70}">주의</c:if>
									<c:if test="${vo1.jisu_foodpoison<35}">관심</c:if>
									(${vo1.jisu_foodpoison})
									</span>
							    </c:otherwise>
							</c:choose>
							</a>
							</td>
							<td>
							<a href="lifejisudetail.do?jisu=senstemp" >
							<img src="<c:url value="/resources/images/senstemp.jpg"/>" class="jisuimg"/>
							</a>
							<a href="lifejisudetail.do?jisu=senstemp" >
							<c:choose>
								<c:when test="${vo1.jisu_senstemp==999}">
							    	<span class="jisutext2">지금은 제공되지 않습니다.</span>
							    </c:when>
							    <c:otherwise>
									<span class="jisutext">
									<c:if test="${vo1.jisu_senstemp<-45}">위험</c:if>
									<c:if test="${vo1.jisu_senstemp>=-25 && vo1.jisu_senstemp<-45}">경고</c:if>
									<c:if test="${vo1.jisu_senstemp>=-10 && vo1.jisu_senstemp<-25}">주의</c:if>
									<c:if test="${vo1.jisu_senstemp>=-10}">관심</c:if>
									(${vo.jisu_senstemp})</span>
							    </c:otherwise>
							</c:choose>
							</a>
							</td>
						</tr>
						<tr>
							<th><a href="lifejisudetail.do?jisu=heat" >열 지수</a></th>
							<th><a href="lifejisudetail.do?jisu=discomfort" >불쾌 지수</a></th>
						</tr>
						<tr>
							<td>
							<a href="lifejisudetail.do?jisu=heat" >
							<img src="<c:url value="/resources/images/heat.jpg"/>" class="jisuimg"/>
							</a>
							<a href="lifejisudetail.do?jisu=heat" >
							<c:choose>
								<c:when test="${vo1.jisu_heat==999}">
							    	<span class="jisutext2">지금은 제공되지 않습니다.</span>
							    </c:when>
							    <c:otherwise>
									<span class="jisutext">
									<c:if test="${vo1.jisu_heat>=54}">매우높음</c:if>
									<c:if test="${vo1.jisu_heat>=41 && vo1.jisu_heat<54}">높음</c:if>
									<c:if test="${vo1.jisu_heat>=32 && vo1.jisu_heat<41}">보통</c:if>
									<c:if test="${vo1.jisu_heat<32}">낮음</c:if>
									(${vo1.jisu_heat})</span>
							    </c:otherwise>
							</c:choose>
							</a>
							</td>
							<td>
							<a href="lifejisudetail.do?jisu=discomfort" >
							<img src="<c:url value="/resources/images/discomfort.jpg"/>" class="jisuimg"/>
							</a>
							<a href="lifejisudetail.do?jisu=discomfort" >
							<c:choose>
								<c:when test="${vo1.jisu_discomfort==999}">
							    	<span class="jisutext2">지금은 제공되지 않습니다.</span>
							    </c:when>
							    <c:otherwise>
									<span class="jisutext">
									<c:if test="${vo1.jisu_discomfort>=80}">매우높음</c:if>
									<c:if test="${vo1.jisu_discomfort>=75 && vo1.jisu_discomfort<80}">높음</c:if>
									<c:if test="${vo1.jisu_discomfort>=68 && vo1.jisu_discomfort<75}">보통</c:if>
									<c:if test="${vo1.jisu_discomfort<68}">낮음</c:if>
									(${vo1.jisu_discomfort})</span>
							    </c:otherwise>
							</c:choose>
							</a>
							</td>
						</tr>
						<tr>
							<th><a href="lifejisudetail.do?jisu=sky" >대기확산 지수</a></th>
							<th><a href="lifejisudetail.do?jisu=uv" >자외선 지수</a></th>
						</tr>
						<tr>
							<td>
							<a href="lifejisudetail.do?jisu=sky" >
							<img src="<c:url value="/resources/images/sky.jpg"/>" class="jisuimg"/>
							</a>
							<a href="lifejisudetail.do?jisu=uv" >
							<c:choose>
								<c:when test="${vo1.jisu_sky==999}">
							    	<span class="jisutext2">지금은 제공되지 않습니다.</span>
							    </c:when>
							    <c:otherwise>
									<span class="jisutext">
									<c:if test="${vo1.jisu_sky eq 7}">낮음</c:if>
									<c:if test="${vo1.jisu_sky eq 6}">보통</c:if>
									<c:if test="${vo1.jisu_sky>=3 && vo1.jisu_sky<6}">높음</c:if>
									<c:if test="${vo1.jisu_sky<3}">매우높음</c:if>
									(${vo1.jisu_sky})</span>
							    </c:otherwise>
							</c:choose>
							</a>
							</td>
							<td>
							<a href="lifejisudetail.do?jisu=uv" >
							<img src="<c:url value="/resources/images/uv.jpg"/>" class="jisuimg"/>
							</a>
							<a href="lifejisudetail.do?jisu=uv" >
							<c:choose>
								<c:when test="${vo1.jisu_UV==999}">
							    	<span class="jisutext2">지금은 제공되지 않습니다.</span>
							    </c:when>
							    <c:otherwise>
									<span class="jisutext">
									<c:if test="${vo1.jisu_UV>=11}">위험</c:if>
									<c:if test="${vo1.jisu_UV>=8 && vo1.jisu_UV<11}">매우높음</c:if>
									<c:if test="${vo1.jisu_UV>=6 && vo1.jisu_UV<8}">높음</c:if>
									<c:if test="${vo1.jisu_UV>=3 && vo1.jisu_UV<6}">보통</c:if>
									<c:if test="${vo1.jisu_UV<3}">낮음</c:if>
									(${vo1.jisu_UV})</span>
							    </c:otherwise>
							</c:choose>
							</a>
							</td>
						</tr>
						<tr>
							<th><a href="lifejisudetail.do?jisu=frozen" >동파가능 지수</a></th>
							<th><a href="lifejisudetail.do?jisu=sensheat" >더위체감 지수</a></th>
						</tr>
						<tr>
							<td>
							<a href="lifejisudetail.do?jisu=frozen" >
							<img src="<c:url value="/resources/images/frozen.jpg"/>" class="jisuimg"/>
							</a>
							<a href="lifejisudetail.do?jisu=frozen" >
							<c:choose>
								<c:when test="${vo1.jisu_frozen==999}">
							   		<span class="jisutext2">지금은 제공되지 않습니다.</span>
							    </c:when>
							    <c:otherwise>
									<span class="jisutext">
									<c:if test="${vo1.jisu_frozen eq 25}">낮음</c:if>
									<c:if test="${vo1.jisu_frozen eq 50}">보통</c:if>
									<c:if test="${vo1.jisu_frozen eq 75}">높음</c:if>
									<c:if test="${vo1.jisu_frozen eq 100}">매우높음</c:if>
									(${vo1.jisu_frozen})</span>
							    </c:otherwise>
							</c:choose>
							</a>
							</td>
							<td>
							<a href="lifejisudetail.do?jisu=sensheat" >
							<img src="<c:url value="/resources/images/sensheat.jpg"/>" class="jisuimg"/>
							</a>
							<a href="lifejisudetail.do?jisu=sensheat" >
							<c:choose>
								<c:when test="${vo1.jisu_sensheat==999}">
							    	<span class="jisutext2">지금은 제공되지 않습니다.</span>
							    </c:when>
							    <c:otherwise>
									<span class="jisutext">
									<c:if test="${vo1.jisu_sensheat>=31}">매우위험</c:if>
									<c:if test="${vo1.jisu_sensheat>=28 && vo1.jisu_sensheat<31}">위험</c:if>
									<c:if test="${vo1.jisu_sensheat>=25 && vo1.jisu_sensheat<28}">경고</c:if>
									<c:if test="${vo1.jisu_sensheat>=21 && vo1.jisu_sensheat<25}">주의</c:if>
									<c:if test="${vo1.jisu_sensheat<21}">관심</c:if>
									(${vo1.jisu_sensheat})</span>
							    </c:otherwise>
							</c:choose>
							</a>
							</td>
						</tr>
					</tbody>
				</table>		
			</div>
		</div>		
	</div>
	<%@ include file="../include/footer.jsp" %>
	</div>

</body>
</html>

