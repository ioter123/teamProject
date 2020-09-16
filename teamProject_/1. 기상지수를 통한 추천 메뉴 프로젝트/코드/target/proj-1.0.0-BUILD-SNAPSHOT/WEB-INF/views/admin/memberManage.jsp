<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>회원 목록</title>
	<%@ include file="../include/header.jsp" %>
	<script>
	$(document).ready(function(){		
		
	});
	</script>
	<style>
	#m6 > a{
		color: #fff !important;
	}
	
	#weatherjisu {
		font-weight: bold;
		text-align:center;
		color:#000;
		font-size:30px;
	}
	
	.jisuimg {
	width:30%;
	height: auto;
	
	}
	.jisutext {
		font-size:40px;
		display:inline-block;
		width:60%;
		text-align:center;
	}
	.jisutext2 {
		font-size:20px;
		display:inline-block;
		width:65%;
		text-align:center;
	}

	#weatherjisu {
		font-weight: bold;
		text-align:center;
		color:#000;
		font-size:30px;
	}
	td{
		text-align:center;
	}
	table{
		width:100%;
	}
	
	#sBtn{
		background-color:white;
		color:sandyBrown;
	}
	
	#sBtn:hover{
		background-color:sandyBrown;
		color:white;
	}

	</style>
</head>
<body>
<div class="fh5co-loader"></div>
	
	<div id="page">
	<%@ include file="../include/menu.jsp" %>
	<div id="fh5co-explore" class="fh5co-bg-section">
		<div class="container">
			<h3 id = "weatherjisu">회원 목록</h3>
			<div class="row animate-box text-right">
			<%--	목록 보여주고 --%>
			<div style="overflow-x:auto;">
			<table border="1"  align="center" class="table">
			<colgroup>
				<col width="10%" />
				<col width="15%" />
				<col width="15%" />
				<col width="25%" />
				<col width="25%" />
				<col width="10%" />
			</colgroup>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>ID</th>
					<th>이메일</th>
					<th>가입일</th>
					<th>회원등급</th>
				</tr>
				<c:forEach var="data" items="${list}">
					<tr>
						<td>${data.cus_no}</td>
						<td>${data.cus_name}</td>
						<td> 
							<a href="memberManageDetail.do?cus_no=${data.cus_no}&nowPage=${PINFO.nowPage}">  ${data.cus_id}  </a>
						</td>
						<td>${data.cus_email}</td>
						<td>${data.cus_date2}</td>  
						<!-- wday는 BoardVO의 변수이름을 그대로 사용한 것임.  date는 getDate()함수명 -->
						<td>${data.cus_class}</td>
						
					</tr>
				</c:forEach>
			<%-- 페이지 이동 기능 만들고 --%>

				<tr>
					<td align="center" colspan="6">
					<%--	[<] [1][2][3][4][5] [>] --%>
					<c:if test="${PINFO.nowPage eq 1}">  <%--//현재페이지가 1페이지이면 --%>
							[ 이전 ]  <%--//(현재보고 있는 페이지의 이전페이지로 가는 거)--%>
					</c:if>
					<c:if test="${PINFO.nowPage ne 1}"> <%--//현재페이지가 1페이지가 아니면 링크 걸어서 --%>
						<a href="memberManage.do?nowPage=${PINFO.nowPage - 1}">[ 이전 ]</a>
					</c:if>
					
		             <%--사이에 [1][2][3][4][5] 만들어야 하니까.. startPage부터 출발해서 endPage까지 반복하세요--%>
					<c:forEach	var="page" begin="${PINFO.startPage}" end="${PINFO.endPage}">
						<a href="memberManage.do?nowPage=${page}">[ ${page} ]</a>
					</c:forEach>
		
					<%--//현재보고있는 페이지가 마지막페이지까지 갔으면--%>
					<c:if test="${PINFO.nowPage eq PINFO.totalPage}"> 
							[ 다음 ]  <%--//(다음페이지로 가는 거)--%>
					</c:if>
					<c:if test="${PINFO.nowPage ne PINFO.totalPage}">
						<a href="memberManage.do?nowPage=${PINFO.nowPage + 1}">[ 다음 ]</a>
					</c:if>

					</td>
				</tr>
				<%--	검색창 만들고 --%>
					<tr>
						<td align="center" colspan="6">
						<form method="POST" id="sfrm" action="memberManageProc.do?nowPage=${PINFO.nowPage}">
							<%--	검색 대상 --%>
							<select name="category" id="category">
								<option value="cus_name"<c:if test="${'cus_name'==category }">selected</c:if>>이름</option>
								<option value="cus_id"<c:if test="${'cus_id'==category }">selected</c:if>>아이디</option>
								<option value="cus_email"<c:if test="${'cus_email'==category }">selected</c:if>>이메일</option>
								<option value="both"<c:if test="${'both'==category }">selected</c:if>>이름+아이디+이메일</option>
							</select>
							<%--	검색 단어 --%>
							<input type="text" name="word" id="word" value="${word}"/>
							<%--	단추	--%>
							<input type="submit" class="btn" id="sBtn" value="검색"/>
						</form>
						</td>
					</tr>
			</table>
			</div>
			</div>
		</div>		
	</div>
	
	<%@ include file="../include/footer.jsp" %>
	</div>

</body>
</html>

