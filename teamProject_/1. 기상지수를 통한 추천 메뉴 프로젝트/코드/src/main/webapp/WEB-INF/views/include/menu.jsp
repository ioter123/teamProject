<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!-- views/include/menu.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ include file="../include/menu.jsp" %> --%>

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
	<header id="fh5co-header" class="fh5co-cover fh5co-cover-sm" role="banner" style="background-image:url(<c:url value="/resources/images/img_bg_2.jpg"/>);" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
	</header>
