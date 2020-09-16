<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>추천 상품 상세보기</title>
	<%@ include file="../include/header.jsp" %>
	<script>
	$(document).ready(function(){		
		
	});
	</script>
	<style>
	#m2 > a{
		color: #fff !important;
	}
	.img1{
		width:50%;
		height:50%;
		margin:auto;
	}
	@media ( max-width: 480px ) {
	
		.img1{
		width:100%;
		height:100%;
		margin:auto;
	}
	
	}
	</style>
</head>
<body>
<div class="fh5co-loader"></div>
	
	<div id="page">
	<%@ include file="../include/menu.jsp" %>
	
	<div id="fh5co-blog">
		<div class="container">
			<h3> 추천 메뉴 상세보기 </h3>
			<div class="row">
				<div class="col-lg-12 col-md-12">
					<div class="fh5co-blog animate-box">
						<div id="img">
						<img class="img-responsive img1" src="<c:url value="/${vo2.product_image}"/>" alt="">
						</div>
						<div class="blog-text">
							<h3>${vo2.product_name }</h3>
							<span class="posted_on">좋아요</span>
							<span class="comment">
							<c:choose>
								<c:when test="${not empty UID}">
								<a href="recommendGood2.do?recomm_prod_no=${vo2.product_no }">${vo2.recomm_good }<i class="far fa-thumbs-up"></i></a>
								</c:when>
								<c:otherwise>
								${vo2.recomm_good } <i class="far fa-thumbs-up"></i>
								</c:otherwise>
							</c:choose>
			
							</span>
							<h4>${vo2.product_detail }</h4>
						</div> 
					</div>
				</div>				
			</div>
			<a href="recommendList.do" class="btn btn-primary">목록 보기</a>
			<c:if test="${LEVEL eq '1'}">
				<a href="updateProduct.do?recomm_prod_no=${vo2.product_no }" class="btn btn-primary">메뉴 수정</a>
				<a href="recommendDelete.do?recomm_prod_no=${vo2.product_no }" class="btn btn-primary">메뉴 삭제</a>
			</c:if>
		</div>
	</div>

	<%@ include file="../include/footer.jsp" %>
	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>
</body>
</html>

