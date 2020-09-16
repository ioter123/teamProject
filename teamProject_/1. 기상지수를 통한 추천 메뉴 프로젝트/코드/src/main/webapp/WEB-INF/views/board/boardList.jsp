<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>게시판목록</title>
	<%@ include file="../include/header.jsp" %>
	
<!-- =========================== -->
<style>
#m3 > a{
	color: #fff !important;
}


	.td_center {		
		text-align: center;
	}
	
/*-----------------------------------------------------*/	
	#weatherjisu {
		font-weight: bold;
		text-align:center;
		color:#000;
		font-size:30px;
	}
	
	 .container{
		text-align:center;
	}
	
	#table_2{
		border: hidden;
		width:100%;
		margin:auto;
		text-align:center;
		border-top: 1px solid sandyBrown;
	}
	th{
		color: white;
		background-color: sandyBrown;
		border-bottom: 1px solid sandyBrown;
	}
	td{
		padding:5px;
	}
	
	.td_left{
		float:left;
	}
	
	#btnWrite{
		float:right;
	}
	
	form{
	width:100%;
	margin:0 auto;
	align:center;
	float:rigth;
	}
	
	select, #list-keyword{
		font-size:13px;
		border-radius: 10px;
		height:30px;
	}
	
	button {
		
		text-align:center;
		background-color: white;
		color: sandyBrown;
		border-radius:20px;
		border:2px solid sandyBrown;
		padding:5px 10px 5px 10px;
		margin-top:10px;
	}
	
	#input_submit{
		background-color: white;
		color: sandyBrown;
		border-radius:20px;
		border:2px solid sandyBrown;
		text-size:13px;
	}
	
	button:hover{
		background-color: sandyBrown;
		color: white;
	}
	#input_submit:hover{
		background-color: sandyBrown;
		color: white;
	}
	.hidden2{
		display:none;
	}
	@media ( max-width: 480px ) {
		
		.hidden1{
			display:none;
		}
		.hidden2{
			display:block;
		}
		select, #list-keyword{
			font-size:13px;
			border-radius: 10px;
			height:30px;
			width:80px;
		}
		.body1{
			text-align:left;
		}
	
	}

</style>
		 
<script>
$(function(){
	$("#btnWrite").click(function(){
		console.log("btnWrite");
		location.href="${path}/board/boardWrite.do";
	});
});
function list(page){
	location.href="${path}/board/boardList.do?nowPage="+page+
			          "&search_option=${map.search_option}"+
			          "&keyword=${map.keyword}";
}
</script>
	 
<!-- =========================== -->
	
</head>
<body>
<!-- <div class="fh5co-loader"></div> -->
	<div id="page">
	<%@ include file="../include/menu.jsp" %>

	<div id="fh5co-explore" class="fh5co-bg-section">
		<div class="container">
		 
<!-- =========================== -->

<h3 id="weatherjisu">게시판</h3>
		 
<table width="100%" align="center">
	<tr>
		<td class = "td_left">
		<!-- 검색폼 -->
			<form name="form1" method="post" action="${path}/board/boardList.do">
				<select name="search_option">
					<option value="cus_name"
						<c:if test="${map.search_option == 'cus_name'}">
							selected="selected"
					  </c:if>>
						이름
					</option>
					<option value="brd_title" 
						<c:if test="${map.search_option == 'brd_title'}">
							selected="selected"
						</c:if>>
						제목
					</option>
					<option value="brd_content" 
						<c:if test="${map.search_option == 'brd_content'}">
							selected="selected"
						</c:if>>
						내용
					</option>
					<option value="all" 
						<c:if test="${map.search_option == 'all'}">
							selected="selected"
						</c:if>>
						이름+내용+제목
					</option>
				</select>
				<input type="text" id = "list-keyword" name="keyword" value="${map.keyword}">
				<input type="submit" value="검색" id = "input_submit">
			</form>
		</td>
	</tr>
	<tr>
	  <td class = "td_left">
	  	전체 ${map.rec_count}개의 게시물이 있습니다.
	  </td>
	  <td id = "td_btnWrite">
	  	<button type="button" id="btnWrite">글쓰기</button>
	  </td>
	</tr>  
</table>


<table border="1" width="80%" align="center" id = "table_2">
	<colgroup class="hidden1">
		<col width="10%">
		<col width="40%">
		<col width="15%">
		<col width="25%">
		<col width="5%">
		<col width="5%">
	</colgroup>
	<tr style="background-color:#cccccc">
		<th class="hidden1">No</th>
		<th>제목</th>
		<th class="hidden1">작성자</th>
		<th class="hidden1">작성일</th>
		<th class="hidden1">파일</th>
		<th class="hidden1">조회</th>
	</tr>
	<!-- forEach var="개별데이터" items="집합데이터" -->
<c:forEach var="row" items="${map.list}">
	<tr>
		<td class="td_right hidden1">${row.brd_no}</td>
		<td class="body1" style="text-align:left;">&nbsp;
			<span class="hidden2">${row.brd_no}.</span>
			<a href="${path}/board/boardView.do?brd_no=${row.brd_no}&nowPage=${map.pager.nowPage}&search_option=${map.search_option}&keyword=${map.keyword}">${row.brd_title}</a>
			<c:if test="${row.reply_cnt > 0}">
				<span style="color:red;">( ${row.reply_cnt} )</span>
			</c:if>
			<div class="hidden2">&nbsp;&nbsp;${row.cus_name}(${row.brd_regdate})<i class="fa fa-file"></i>${row.file_cnt}<i class="fas fa-eye"></i>${row.brd_viewcnt}</div>
		</td>
		<td class="td_center hidden1">${row.cus_name}</td>
		<td class="td_center hidden1"><fmt:formatDate value="${row.brd_regdate}"
			pattern="yyyy-MM-dd HH:mm:ss"/> </td>
		<td class="td_right hidden1">${row.file_cnt}</td>
		<td class="td_right hidden1">${row.brd_viewcnt}</td>
	</tr>
</c:forEach>	
<!-- 페이징 -->
	<tr>
		<td colspan="6" align="center">
			<c:if test="${map.pager.nowBlock > 1}">
				<a href="#" onclick="list('1')">[처음]</a>
			</c:if>
			<c:if test="${map.pager.nowBlock > 1}">
				<a href="#" onclick="list('${map.pager.prevPage}')">[이전]</a>
			</c:if>
			
			<c:forEach var="num" begin="${map.pager.startBlock}"
													 end="${map.pager.endBlock}">
				<c:choose>
					<c:when test="${num == map.pager.nowPage}">
					<!-- 현재 페이지인 경우 하이퍼링크 제거 -->
						<span style="color:red;">${num}</span>
					</c:when>
					<c:otherwise>
						<a href="#" onclick="list('${num}')">${num}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<c:if test="${map.pager.nowBlock < map.pager.totalBlock}">
				<a href="#" 
				onclick="list('${map.pager.nextPage}')">[다음]</a>
			</c:if>
			<c:if test="${map.pager.nowPage < map.pager.totalPage}">
				<a href="#" 
				onclick="list('${map.pager.totalPage}')">[끝]</a>
			</c:if>
		</td>
	</tr>
</table>
		 
<!-- =========================== -->
				
		</div>		
	</div>
	<%@ include file="../include/footer.jsp" %>
	</div>

</body>
</html>
