<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>게시판쓰기</title>
	<%@ include file="../include/header.jsp" %>
	
<!-- =========================== -->
<script src="<c:url value="../resources/ckeditor/ckeditor.js"/>"></script>
<script src="<c:url value="../resources/board/js/common.js"/>"></script>
<script>
$(function(){
	//1.게시판 글쓰기 버튼
	$("#btnSave").click(function(){
		 //무결성검사: 제목 필수입력
		 var tData = $("#brd_title").val();
		 if( tData=="" ||	 tData.length ==0 ){ 
				alert("제목을 입력하세요");      //경고창띄우기
				$("#brd_title").focus();
				return; 
		 } 
		 		
		var str="";
		// uploadedList 내부의 .file 태그 각각 반복
		$("#uploadedList .file").each(function(i){
			console.log(i);
			//hidden 태그 구성
			str += "<input type='hidden' name='files["+i+"]'	value='"+ $(this).val()+"'>";
		});
		
		$("#uploadedList .fileLen").each(function(i){
			console.log(i);
			//hidden 태그 구성
			str += "<input type='hidden' name='len["+i+"]'	value='"+ $(this).val()+"'>";
		});
		console.log(str);

		//폼에 hidden 태그들을 붙임
		$("#form1").append(str);
		document.form1.submit();
	});
	
	//2.게시판 글쓰기 취소 버튼
	$("#btnCancle").click(function(){
		CKEDITOR.instances.brd_content.setData('');
		document.form1.reset();
	});
	
	//3.게시판 목록 버튼
	$("#btnList").click(function(){
		location.href = "${path}/board/boardList.do";
	});
	
	/*-- start: 첨부파일 Drag and Drop ----------------------------*/ 
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
				html += "<span data-src='"+fullName+"'>[삭제]</span><br/></div>";				
				$("#uploadedList").append(html);
			}
		});
		
	});
	
	//첨부파일 삭제
	$("#uploadedList").on("click","span",function(event){
		//현재 클릭한 태그
		var that=$(this);  //data: "fileName="+$(this).attr("data-src"),
		$.ajax({
			url: "${path}/upload/deleteFile.do",
			type: "post",
			data: {
				fileName: $(this).attr("data-src")
			},
			dataType: "text",
			success: function(result){
				if(result=="deleted"){
					that.parent("div").remove();
				}
			}
		});
	});
	
	function checkImageType(fileName){
		var pattern=/jpg|png|jpeg|gif/i;    //정규표현식(대소문자 무시)
		return fileName.match(pattern); //규칙에 맞으면 true
	}
	/*-- end: 첨부파일 Drag and Drop ----------------------------*/ 

});
</script>

<style>
#m3 > a{
	color: #fff !important;
}
	.fileDrop {
			height: 150px;
			border: 1px dotted gray;
			text-align:center;
			/* background-color: #bbbbbb; */
	}
	.t1 {border: #ffffff solid; 
		   border-width: 0px 1px 1px 1px;}
		  
		  
   #weatherjisu {
		font-weight: bold;
		text-align:center;
		color:#000;
		font-size:30px;
	}
   
	.container{
		width:65%;
		text-align:center;
	}
		   
	table{
		border: hidden;
		width:100%;
		margin:auto;
		text-align:center;
		border-top: 1px solid sandyBrown;
	}
	th{
		color: white;
		background-color: sandyBrown;
		border-bottom: 1px solid white;
	}	   
		   
	#brd_title{
	border:0;
	text-align:left;
		width:100%;
	}
	
	#btnDiv{
		margin-top:10px;
	}
	
	
	button{
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
		 
	<h3 id="weatherjisu">게시판 글쓰기</h3>

	<form id="form1" name="form1" method="post" 
				action="${path}/board/boardWrite.do">
		<table border="1" align="center">
		<colgroup>
			<col width="20%">
			<col width="80%">
		</colgroup>
		  <tr>
		  	<th align="center">&nbsp;제목</th>
		    <td><input name="brd_title" id="brd_title" placeholder=" 제목을 입력하세요"></td>
		  </tr>
		  <tr>
		  	<th>&nbsp;내용 </th>
		    <td><textarea id="brd_content" name="brd_content" rows="5" cols="60" placeholder="내용을 입력하세요"></textarea></td>
		  </tr>
			<script>
				// ckeditor 적용
				CKEDITOR.replace("brd_content", {allowedContent: false});
			</script>
			
      <tr>
      	<th>첨부파일</th>
      	<td>
				<div>
					<div style="margin-right:auto;margin-left:auto; " class="fileDrop">
					<br/>
               <br/>
					<p><i class="fa fa-paperclip"></i>첨부파일을 드래그 해 주세요.</p>
					<br/>
               <br/>
					</div>
					<div id="uploadedList"></div>
				</div>
				</td></tr>
      <tr class="t1">
      	<td colspan="2">				
					<div id = "btnDiv" style="text-align:center;">
						<button type="button" id="btnSave">확인</button>
						<button type="button" id="btnCancle">취소</button>
						<button type="button" id="btnList" >목록</button><hr/>
					</div>
				</td>			
			</tr>
			
		</table>
	</form>
		 
<!-- =========================== -->
				
		</div>		
	</div>
	<%@ include file="../include/footer.jsp" %>
	</div>

</body>
</html>

