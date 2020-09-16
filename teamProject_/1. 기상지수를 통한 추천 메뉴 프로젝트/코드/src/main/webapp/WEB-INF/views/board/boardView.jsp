<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>게시판상세</title>
	<%@ include file="../include/header.jsp" %>
	
<!-- =========================== -->
<!-- favicon.ico -->
<link ref="icon" href="data:;base64,iVBOKw0KGgo=">
<!-- 파일첨부 관련 사용자정의 자바스크립트 -->
<script src="<c:url value="../resources/board/js/common.js"/>"></script>
<!-- ckeditor의 라이브러리 -->
<script src="<c:url value="../resources/ckeditor/ckeditor.js"/>"></script>

<script type="text/javascript">
	$(function(){		
	/*-- start: 게시판 수정, 삭제, 목록 ---------------------------- */
		//1. 게시판수정 버튼
		$("#btnUpdate").click(function(){
			 //무결성검사: 제목 필수입력
			 var tData = $("#brd_title").val();
			 if( tData=="" ||	 tData.length ==0 ){ 
					alert("제목을 입력하세요");      //경고창띄우기
					$("#brd_title").focus();
					return; 
			 } 
			 			
			//첨부파일 이름과 파일사이즈 들을 폼에 추가
			var str="";
			$("#uploadedList .file").each(function(i){
				str+="<input type='hidden' name='files["+i+"]' value='"+$(this).val()+"'>";
			});
			$("#uploadedList .fileLen").each(function(i){
				str += "<input type='hidden' name='len["+i+"]'	value='"+ $(this).val()+"'>";
			});
			
			$("#form1").append(str);
			
			document.form1.action="${path}/board/boardUpdate.do";
			document.form1.submit();
		});
		
		//2. 게시판삭제 버튼
		$("#btnDelete").click(function(){
			if(confirm("정말로 삭제 하시겠습니까?")){
				document.form1.action="${path}/board/boardDelete.do";
				document.form1.submit();
			}
		});
		
		//3. 게시판 목록 버튼
		$("#btnList").click(function(){
			location.href = "${path}/board/boardList.do?nowPage=${nowPage}&search_option=${search_option}&keyword=${keyword}";
		});
	/*-- end: 게시판 수정, 삭제, 목록 ---------------------------- */

  /*-- start: 댓글쓰기  ---------------------------- */
		replylist("1");   //뷰화면 들어오면 댓글리스트 1페이지 출력
		
		//댓글쓰기
		
		
		$("#btnReply").click(function(){
			 //무결성검사: 댓글내용 필수입력
			 var tData = $("#rep_text").val();
			 if( tData=="" ||	 tData.length ==0 ){ 
					alert("댓글내용을 입력하세요");      //경고창띄우기
					$("#rep_text").focus();
					return; 
			 } 			
			
			reply();
			$("#rep_text").val("");
			
		});

  /*-- end: 댓글쓰기  ---------------------------- */
	
	/*-- start: 첨부파일 Drag and Drop ----------------------------*/ 
		
		filelist();  //*** 화면에 첨부파일 리스트 출력 ***
	
		$(".fileDrop").on("dragenter dragover",function(e){
			e.preventDefault();            //기본 효과 막음
		});
		
		//Drop하여 첨부파일 추가
		$(".fileDrop").on("drop",function(e){
			e.preventDefault();             //기본 효과 막음
			
			var files=e.originalEvent.dataTransfer.files;
			var file=files[0];              //첫번째 첨부파일
			var formData = new FormData();  //폼 데이터에 첨부파일 추가
			formData.append("file",file);

			$.ajax({
				url: "${path}/upload/uploadAjax.do",
				data: formData,
				dataType: "text",
				processData: false,
				contentType: false,
				type: "post",
				error : function(error) {
			        	console.log(error);
			    		},
				success: function(data){
					//data : 업로드한 파일 정보와 Http 상태 코드
					var fullName = data.substr(0, data.indexOf("^")); 
					var fileLen = data.substr(data.indexOf("^")+1); 

					var fileInfo=getFileInfo(fullName);     // fileInfo <- {fileName: fileName,  (원본이름)
						                                  //              imgsrc: imgsrc,      (/forcast/upload/displayFile?fileName=fullName)
						                                  //              getLink: getLink,    (/forcast/upload/displayFile?fileName=연월일경로+저장이름)
						                                  //              fullName:fullName }  (연월일경로+썸네일명)
						
					var html="<div>&nbsp;<a href='"+fileInfo.getLink+"'>"+fileInfo.fileName+"</a>&nbsp;";
					html += "&nbsp;("+fileLen+" bytes)&nbsp;&nbsp;";
					if(checkImageType(data)){ //이미지 파일
						html+="<img src='"+fileInfo.imgsrc+"'/>";
					}
					html+= "<input type='hidden' class='fileLen' value='"+fileLen+"'/>";
					html += "<input type='hidden' class='file' value='"+fileInfo.fullName+"'/>";	
					html += "<a href='#' class='file_del' data-src='"+fullName+"'>[삭제]</a></div>";
					$("#uploadedList").append(html);
				}
			});			
		});	
		
		//첨부파일 삭제
		//id가 uploadedList인 태그의 class가 file_del인 태그 클릭
		$("#uploadedList").on("click",".file_del",function(e){
			if(confirm("정말로 삭제 하시겠습니까?")){			
				var that=$(this); //클릭한 태그
				$.ajax({
					type: "post",
					url: "${path}/upload/deleteFile.do",
					data: "fileName="+	$(this).attr("data-src"),		
					dataType: "text",
					success: function(result){
						if(result=="deleted"){
							//화면에서 태그 제거
							that.parent("div").remove();
						}
					}
				});
			}
		});
		
		function checkImageType(fileName){
			var pattern=/jpg|png|jpeg|gif/i;    //정규표현식(대소문자 무시)
			return fileName.match(pattern); //규칙에 맞으면 true
		}
	/*-- end: 첨부파일 Drag and Drop ----------------------------*/ 			
	});		

	function reply(){
		var rep_orino = ${vo.brd_no}
		var rep_text = $("#rep_text").val();
		var replyData = {"rep_orino": rep_orino, "rep_text":rep_text, }; 
		$.ajax({
			type: "post",
			url: "${path}/reply/replyInsert.do",
			data: replyData,
			success: function(){
				//alert("댓글이 등록되었습니다.")
				replylist("1");  //replylist(페이지번호): 댓글 등록 후 댓글리스트 1페이지 출력
			}
		});
	}
	
	//댓글리스트 출력
	function replylist(pageNo){
		$.ajax({
			type: "post",
			url: "${path}/reply/replyList.do?rep_orino=${vo.brd_no}&nowPage="+pageNo,
			success: function(res){
				$("#replylist").html(res);
			}		
		});		
	}

	//첨부파일 리스트를 출력
	function filelist(){

		$.ajax({
			type: "post",
			url: "${path}/board/getFileList.do?brd_no=${vo.brd_no}",
			error: function(request, status, error) {
		        alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		  },
	    success: function(list){  // list : ArrayList로 반환
				$(list).each(function(){
					var fullName = this.substr(0, this.indexOf("^")); 
					var fileLen = this.substr(this.indexOf("^")+1); 
					var fileInfo=getFileInfo(fullName);
					console.log(fileInfo.fileName);
          
					var html = "<div>&nbsp;<a href='"+fileInfo.getLink+"'>"+fileInfo.fileName+"</a>&nbsp;";
					html += "&nbsp;("+fileLen+" bytes)&nbsp;&nbsp;";
          if(checkImageType(fullName)){ //이미지 파일
						html+="<img src='"+fileInfo.imgsrc+"'/>";
					}
          
					html+= "<input type='hidden' class='fileLen' value='"+fileLen+"'/>";
					html += "<input type='hidden' class='file' value='"+fileInfo.fullName+"'/>";
				  <c:if test="${(sessionScope.UID eq vo.brd_writer)||(sessionScope.LEVEL eq 1)}">	
						html += "<a href='#' class='file_del' data-src='"
							+fullName+"'>[삭제]</a></div>";
					</c:if>
					$("#uploadedList").append(html);
				
				});
			}
		});
	
}	
</script>

<style>
#m3 > a{
	color: #fff !important;
}
	.fileDrop {		
		height: 150px;
		border: 1px dotted gray;
		
	}
	.t1 {border: #ffffff solid; 
	     border-width: 0px 1px 1px 1px;}
	     
	/*-------------------------------------------------------------*/     
		#weatherjisu {
		font-weight: bold;
		text-align:center;
		color:#000;
		font-size:30px;
	}
	
	#fh5co-explore{
		text-align:center;
	}
	
	table{
		border: hidden;
		width:100%;
		margin:auto;
		text-align:center;
		border-top: 1px solid sandyBrown;
	}
	
	#rep_text{
		margin-top:10px;
	}
	
	th{
		color: white;
		background-color: sandyBrown;
		border-bottom: 1px solid white;
	}
	
	button{
		font-size:15px;
		height:35px;
		background-color: white;
		color: sandyBrown;
		border-radius:20px;
		border:2px solid sandyBrown;
		padding:5px 10px 5px 10px;
		margin-top:10px;
	}
	     
	button:hover, #btn_Reply:hover{
		background-color: sandyBrown;
		color: white;
	}
	
	#brd_title{
		border:0;
		width:100%;
	}

	table{
		width: 100%;
	}
	@media ( max-width: 480px ) {
		table{
			width: 350px;
		}
		#brd_title{
			border:0;
			width:100%;
		}
	
	}
	     
</style>

<!-- =========================== -->
	
</head>
<body>
<div class="fh5co-loader"></div>
	<div id="page">
	<%@ include file="../include/menu.jsp" %>
	
	<div id="fh5co-explore" class="fh5co-bg-section">
		<div class="container">
		 
<!-- =========================== -->

<h3 id="weatherjisu">게시물 보기</h3>
	 
<form id="form1" name="form1" method="post">
	<input type="hidden" name="nowPage" value="${nowPage}"/>	
	<input type="hidden" name="search_option" value="${search_option}"/>	
	<input type="hidden" name="keyword" value="${keyword}"/>	
	<div style="overflow-x:auto;">
	<table border="1" align="center">
	<colgroup>
		<col width="20%">
		<col width="80%">
	</colgroup>
    
  <tr>
  	<th>작성일</th>
  	<td style="text-align:left;">&nbsp;<fmt:formatDate value="${vo.brd_regdate}" pattern="yyyy-MM-dd a HH:mm:ss"/></td>    
  </tr>
  <tr>
    <th>조회</th>
		<td style="text-align:left;">&nbsp;${vo.brd_viewcnt}</td>
	</tr>
	<tr>
    <th>작성자</th>
		<td style="text-align:left;">&nbsp;${vo.cus_name}</td>	
	</tr>
	<tr>
    <th>제목</th>
		<td style="text-align:left;">
			<c:if test="${(sessionScope.UID eq vo.brd_writer)||(sessionScope.LEVEL eq 1)}">
				<input name="brd_title" id="brd_title" value="${vo.brd_title}"/>
			</c:if>
			<c:if test="${(sessionScope.UID ne vo.brd_writer)&&(sessionScope.LEVEL ne 1)}">
				&nbsp;${vo.brd_title}
			</c:if>
		</td>	
	</tr>		
	<tr>
    <th>내용</th>
		<td><textarea id="brd_content" name="brd_content">${vo.brd_content}</textarea></td>	
	</tr>				
	<script>
		// ckeditor 적용: CKEDITOR.replace("태그id",{})
		// 이미지 업로드할 경우
		CKEDITOR.replace("brd_content", {allowedContent: false});
		//CKEDITOR.instances.brd_content.readOnly;
		//CKEDITOR.instances.brd_content.setReadOnly(true);
	</script>
	
	<tr>
	  <th>첨부파일</th>
		<td>
			<div> 
				<c:if test="${(sessionScope.UID eq vo.brd_writer)||(sessionScope.LEVEL eq 1)}">
					<div style="margin-right:auto;margin-left:auto; " class="fileDrop">
					<br/>
					<br/>
					<p><i class="fa fa-paperclip"></i>첨부파일을 드래그해주세요.</p>
					<br/>
					<br/>
					</div>
				</c:if>		
				<div id="uploadedList"></div>
			</div>			
		</td>
	</tr>		

	<tr align="center" class="t1">
		<td colspan="2">	 
			<div style="text-align:center;">
			<!-- 수정,삭제에 필요한 글번호를 hidden 태그에 저장 -->	
				<input type="hidden" name="brd_no" value="${vo.brd_no}">	
				<!-- 본인만 수정,삭제 버튼 표시 -->
				<c:if test="${(sessionScope.UID eq vo.brd_writer)||(sessionScope.LEVEL eq 1)}">
					<button type="button" id="btnUpdate">수정</button>&nbsp;
					<button type="button" id="btnDelete">삭제</button>&nbsp;
				</c:if>
				<button type="button" id="btnList" >목록</button>	
				<hr/> 		
			</div>
			
		</td>
	 </tr>
</table>
</div>
</form>		

<table align="center">
	<tr>
		<!-- 댓글 작성 영역 -->
		<div>
			 <c:if test="${sessionScope.UID != null }">
			 	<td>
			 		<textarea rows="2" cols="85"id="rep_text" placeholder="여기에 댓글을 입력하세요"></textarea>
			 	</td>
			 	<td>
			 		<a href='#' id="btnReply" >[댓글쓰기]</a>
			 	</td>
			 </c:if>
		</div>
	</tr>	
  <tr>
		<!-- 댓글 목록 영역 -->
		<div id="replylist"></div>
  </tr>
</table>  
		 
<!-- =========================== -->
				
		</div>		
	</div>
	<%@ include file="../include/footer.jsp" %>
	</div>

</body>
</html>


