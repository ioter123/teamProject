<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>추천 상품 목록</title>
	<%@ include file="../include/header.jsp" %>
	<script>
	$(document).ready(function(){		
		
	});
	</script>
	<style>
	#m2 > a{
		color: #fff !important;
	}
	#weatherjisu {
		font-weight: bold;
		text-align:center;
		color:#000;
		font-size:30px;
	}
	
	@media ( max-width: 480px ) {
	
		.fh5co-blog > a img{
			width:70%;
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
			<h3 id = "weatherjisu"> 추천 메뉴 </h3>
			<div class="row">
				<c:choose>
					<c:when test="${notlist==1}">
						<div class="col-lg-3 col-md-3">
							<div class="fh5co-blog animate-box">
								<div class="blog-text">
									<h3>항목이 없습니다.</h3>
								</div> 
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="item" items="${list2}">
							<div class="col-lg-3 col-md-3">
								<div class="fh5co-blog animate-box">
									<a href="recommendDetail.do?recomm_prod_no=${item.product_no}"><img class="img-responsive" src="<c:url value="/${item.product_image}"/>" alt=""></a>
									<div class="blog-text">
										<h3><a href="recommendDetail.do?recomm_prod_no=${item.product_no}">${item.product_name }</a></h3>
										<span class="posted_on">좋아요</span>
										<span class="comment">
										<c:choose>
											<c:when test="${not empty UID}">
												<a href="recommendGood.do?recomm_prod_no=${item.product_no}">
												${item.recomm_good }
												<i class="far fa-thumbs-up"></i>
												</a>
											</c:when>
											<c:otherwise>
												${item.recomm_good }
												<i class="far fa-thumbs-up"></i>
											</c:otherwise>
										</c:choose>
										
										</span>
									</div> 
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
			<c:choose>
				<c:when test="${LEVEL eq 1}">
				<a href="addProduct.do" class="btn btn-primary">메뉴 추가</a>
				</c:when>
			</c:choose>
			
		</div>
	</div>

	<%@ include file="../include/footer.jsp" %>
	</div>

</body>
</html>

