<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	
	<%@ include file="../include/header.jsp" %>
	
	<script>
	$(document).ready(function(){
		//게시물 작성
		$("#btnWrite").click(function(){
			//페이지 주소 이동
			location.href = "./noticeWrite.do";
		});
		
		
	});
	
	 //원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위함
	function list(page){
		location.href = "./noticeList.do?curPage="+page+"&searchOption-${map.searchOption}"+"&keyword=${map.keyword}";
		
	} 
	 
	</script>
	<style>
	#m4 > a{
				color: #fff !important;
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

	table{
		border: hidden;
		width:100%;
		margin:auto;
		text-align:center;
		border-top: 1px solid sandyBrown;
	}
	thead{
		color: white;
		background-color: sandyBrown;
		border-bottom: 1px solid sandyBrown;
	}
	
	th,td{
		padding:5px;
	}
	
	
	select, #list-keyword{
		font-size:13px;
		border-radius: 10px;
		height:30px;
	}
	
	#list-list{
		background-color: white;
		color: sandyBrown;
		border-radius:20px;
		border:2px solid sandyBrown;
		text-size:13px;
	}
	
	#list-list:hover{
		background-color: sandyBrown;
		color: white;
	}
	
	
	button {
		background-color: white;
		color: sandyBrown;
		border-radius:20px;
		border:2px solid sandyBrown;
		padding:5px 10px 5px 10px;
		margin-top:10px;
	}
	
	button:hover{
		background-color: sandyBrown;
		color: white;
	}
	
	img{
		width:15px;
		heigth:15px;
		margin-left:5px;
	}
	#onNotice{
		background-color:#eee;
		border:1px solid white;
		font-weight:bold;
	}
	.left{
		padding: 0px 0px 0px 10px;
		text-align:left;
	}

	</style>
	
	<script>
	$(document).ready(function(){
		var isCheck =$("#isCheck").val();
		//alert("check==="+isCheck);
	});
	</script>
	
	<title>공지사항</title>
</head>
<body>
<div class="fh5co-loader"></div>
	
	<div id="page">
	
<%@ include file="../include/menu.jsp" %>

	<div id="fh5co-explore" class="fh5co-bg-section">
		<div class="container">
				<h3 id="weatherjisu">공지사항</h3>
			<div class="row animate-box text-right">
				   <form name = "form1" method = "post" action = "./noticeList.do">
				    <div class="fh5co-loader"></div>
			
				
						<select name = "searchOption">
						<!-- 검색기능 - 검색조건을 검색처리후 결과 화면에 보여주기 위해서 c:out출력태그 사용 -->
							<option value = "all" <c:out value ="${map.searchOption == 'all' ? 'selected' : ''}" />> 제목+내용</option>
							<option value = "noti_title" <c:out value ="${map.searchOption == 'noti_title' ? 'selected' : ''}" />> 제목</option>
							<option value = "noti_body" <c:out value ="${map.searchOption == 'noti_body' ? 'selected' : ''}" />> 내용</option>
						</select>
						<input id = "list-keyword" name = "keyword" value ="${map.keyword}">
						<input id = "list-list" type ="submit" value = "조회">
				
						</form>
						
						<!-- 레코드의 갯수 출력 -->
						<div>${map.count}개의 게시물이 있습니다.</div>
						
				     <table border = "1" >
				     		 <colgroup>
				     		  <%-- <col style = "background:gray"/> --%>
				     			<col width="10%"/>
				     			<col width="45%"/>
				     			<col width="15%"/>
				     			
				     			<%-- <col width="15%"/> --%>
				     			<col width="20%"/>
				     			<col width="10%"/>
				     		</colgroup>
				        <thead>
				      
				            <tr>
				                <th>번호</th>
				                <th>제목</th>
				                <th>작성자</th>
				               <!--  <th>내용</th> -->
				                <th>등록일</th>
				                <!-- <th>수정일</th> -->
				                <th>조회수</th>
				            </tr>
				        </thead>
				        <tbody>
				        	<c:forEach var="notice" items="${map.noticeList2}"> <!--  컨트롤러 에서 넘어온 map -->
				                <tr id="onNotice">
				                    <td>공지</td>
				                    <td><a href = "./noticeDetail.do?no=${notice.no}&curPage=${map.noticePager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">${notice.title}</a><input type = "hidden" value = "${notice.isCheck}" id = "isCheck">
				                   	<img src = "${path}/resources/images/warning1.png" alt="긴급아이콘" />
				                    </td>
				                    <td>${notice.writer}</td>
				                    <td><fmt:formatDate value = "${notice.update_date}" pattern = "yyyy-MM-dd" /></td>
				                   <%--  <td><fmt:formatDate value = "${notice.update_date}" pattern = "yyyy-MM-dd" /></td><!-- 수정되는거 확인 --> --%>
				                    <td>${notice.hit}</td>
				                </tr>
				            </c:forEach>
				            <c:forEach var="notice" items="${map.noticeList}"> <!--  컨트롤러 에서 넘어온 map -->
				                <tr>
				                    <td>${notice.no}</td>
				                    <td><a href = "./noticeDetail.do?no=${notice.no}&curPage=${map.noticePager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">${notice.title}</a>
				                    </td>
				                    <td>${notice.writer}</td>
				                    <td><fmt:formatDate value = "${notice.update_date}" pattern = "yyyy-MM-dd" /></td>
				                   <%--  <td><fmt:formatDate value = "${notice.update_date}" pattern = "yyyy-MM-dd" /></td><!-- 수정되는거 확인 --> --%>
				                    <td>${notice.hit}</td>
				                </tr>
				            </c:forEach>
				            <tr><td colspan = "7" >
				            <!-- 처음페이지로 이동- 현재 페이지가 1보다 크면 [처음]하이퍼링크 화면에 출력 -->
				            	<c:if test = "${map.noticePager.curBlock > 1}">
				            		<a href = "javascript:list('1')">[처음]</a>
				            	</c:if>
				            	
				            	<!--  이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크 화면에 출력 -->
				            	<c:if test = "${map.noticePager.curBlock > 1}">
				            		<a href = "javascript:list('${map.noticePager.prevPage}')">[이전]</a>
				            	</c:if>
				            	
				            	<%-- <c:if test = "${num < 1}">
				            			<span style = "color:red">공지사항이 없습니다.</span>
				            		</c:if> --%>
				            	
				            	<!-- 하나의 블럭에서 반복문 수행 시작페이지부터 끝페이지까지 -->
				            	<c:forEach var="num" begin="${map.noticePager.blockBegin}" end="${map.noticePager.blockEnd}">
				            	
				            	<!-- 현재페이지이면 하이퍼링트 제거 -->
				            	<c:choose>
				            		<c:when test = "${num == map.noticePager.curPage}">
				            			<span style = "color:red">${num}</span>&nbsp;
				            		</c:when>
				            		<c:otherwise>
				            			<a href = "javascript:list('${num}')">${num}</a>&nbsp;
				            		</c:otherwise>
				            	</c:choose>
				            	</c:forEach>
				            	
				            	<!-- 다음페이지 블록으로 이동: 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
				            	<c:if test = "${map.noticePager.curBlock <= map.noticePager.totalBlock}">
				            		<a href = "javascript:list('${map.noticePager.nextPage}')">[다음]</a>
				            	</c:if>
				            	
				            	<!-- 끝페이지로 이동: 현재 페이지가 전체 페이지보다 작거타 같을때 [끝]하이퍼링크 화면에 출력 -->
				            	<c:if test = "${map.noticePager.curPage <= map.noticePager.totalPage}">
				            		<a href = "javascript:list('${map.noticePager.totalPage}')">[끝]</a>
				            	</c:if>
				            </td></tr>
				        </tbody>
				    </table>
				    
				   <div>
				   <c:if test="${LEVEL eq 1}">
				  <%--  <c:if test="${sessionScope.cus_class==1}">  --%>
				   <button type = "button" id = "btnWrite"><i class="fa fa-add"></i>공지사항추가</button>
				   <%-- </c:if>  --%>
				   </c:if>
				   </div>
				    
    
			</div>
			</div>		
	</div>
	
	<%@ include file="../include/footer.jsp" %>
	
	</div>

	
</body>
</html>

