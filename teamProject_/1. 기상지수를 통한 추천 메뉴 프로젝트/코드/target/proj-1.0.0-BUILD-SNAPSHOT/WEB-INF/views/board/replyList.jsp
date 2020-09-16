<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


    <!-- views/board/reply_list.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>댓글목록</title>
<%--@ include file="../include/header.jsp" --%>

<script type="text/javascript">

//댓글수정
$(function(){
	$(".reply_update").click(function(e){
		var that=$(this); //클릭한 태그
		
		var id = $(this).attr("data-src");
		data = id+"::"+$("#ta"+id).val();
		console.log(data);

		$.ajax({
			type: "post",
			url: "${path}/reply/replyUpdate.do",
			data: "text="+data,		
			dataType: "text",
			success: function(result){
				alert("댓글이 수정되었습니다.")
			}
		});
	});
	//댓글삭제
	$(".reply_delete").click(function(e){
		if(confirm("정말로 삭제 하시겠습니까?")){
			var that=$(this); //클릭한 태그
			$.ajax({
				type: "post",
				url: "${path}/reply/replyDelete.do",
				data: "rep_no="+$(this).attr("data-src"),		
				dataType: "text",
				success: function(result){
					if(result=="deleted"){
						//화면에서 태그 제거
						var parent = that.parent("span").parent("td").parent("tr");
						parent.next().remove()
						parent.remove()
					}
				}
			});
		}
	});
	
});


function list(pageNo){
	$.ajax({
		type: "post",
		url: "${path}/reply/replyList.do?rep_orino=${rep_orino}&nowPage="+pageNo,
		success: function(res){
			//console.log(res);
			$("#replylist").html(res);
		}		
	});	
}

</script>
<style>
	 #m3 > a{
		color: #fff !important;
	}
	textarea{
		width: 100%;
	}
	table{
		width: 100%;
	}
	@media ( max-width: 480px ) {
		textarea{
			width: 100%;
		}
		table{
			width: 350px;
		}
	
	}
	
</style>
</head>
<body>
 <%-- pageContext.setAttribute("newLineChar", "\n"); --%>
<table align="center">
<c:forEach var="row" items="${list}">   

	<tr>
		<td colspan="2" style="text-align:left;">
			<span style="background-color: #dddddd;">* ${row.cus_name}
				( <fmt:formatDate value="${row.rep_regdate}"
					 pattern="yyyy-MM-dd a HH:mm:ss" /> )
			</span>
			<c:if test="${(sessionScope.UID eq row.rep_writer)||(sessionScope.LEVEL eq 1)}">
				<span>
				    &nbsp;
				    <a href='#' class='reply_update' data-src="${row.rep_no}" >[수정]</a>
				    <a href='#' class='reply_delete' data-src="${row.rep_no}" >[삭제]</a>
				</span>
	  		</c:if>	
		</td>
	 </tr>
	 <tr>
	 	<td style="text-align:left;">
			<c:if test="${(sessionScope.UID eq row.rep_writer)||(sessionScope.LEVEL eq 1)}">
				<textarea id="ta${row.rep_no}" name="rep_text" style="border: none" rows="1" cols="97" >${row.rep_text}</textarea>
			</c:if>
			<c:if test="${(sessionScope.UID ne row.rep_writer)&&(sessionScope.LEVEL ne 1)}">
				${row.rep_text}
			</c:if>			
		</td>
	</tr>
</c:forEach>

<!-- 페이징 -->
	<tr>
		<td align="center">
			<c:if test="${pager.nowBlock > 1}">
				<a href="#" onclick="list('1')">[처음]</a>
			</c:if>
			<c:if test="${pager.nowBlock > 1}">
				<a href="#" onclick="list('${pager.prevPage}')">[이전]</a>
			</c:if>
			
			<c:forEach var="num" begin="${pager.startBlock}"
													 end="${pager.endBlock}">
				<c:choose>
					<c:when test="${num == pager.nowPage}">
					<!-- 현재 페이지인 경우 하이퍼링크 제거 -->
						<span style="color:red;">${num}</span>
					</c:when>
					<c:otherwise>
						<a href="#" onclick="list('${num}')">${num}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<c:if test="${pager.nowBlock < pager.totalBlock}">
				<a href="#" 
				onclick="list('${pager.nextPage}')">[다음]</a>
			</c:if>
			<c:if test="${pager.nowPage < pager.totalPage}">
				<a href="#" 
				onclick="list('${pager.totalPage}')">[끝]</a>
			</c:if>
		</td>
	</tr>	
</table>

</body>
</html>
