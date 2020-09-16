<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	
	<%@ include file="../include/header.jsp" %>
	
	 <%--Handlebars JS--%>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js"></script>
		<script src="<c:url value="/resources/js/notice_common.js"/>"></script>

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
	margin:auto;
	align:center;
	text-align:center;
	width:80%;
	border-top: 1px solid sandyBrown;
	
	}
	
	th{
		color: white;
		background-color: sandyBrown;
		/* border-bottom: 1px solid sandyBrown; */
	}
	
	th,td{
		padding: 5px;
	}
	
	
	.write_li{
		margin: 10px;
		float:left;
	}	
	
	.uploadedList{
		text-align:center;
		
		list-style:none;
		
	}
	.uploadedList>li{
		display:inline-block;
		text-align:center;
		margin:5px;
		
		
	}
	
	#td-body{
		padding:10px;
		height: 200px;
		border-bottom: 1px solid sandyBrown; 
	}
	
	#btnUpdate, #btnDelete, #btnList{
		background-color: white;
		color: sandyBrown;
		border-radius:20px;
		border:2px solid sandyBrown;
		padding:5px 10px 5px 10px;
		margin-top:10px;
	}
	
	#btnUpdate:hover, #btnDelete:hover, #btnList:hover{
		background-color: sandyBrown;
		color: white;
	}
	
	
	</style>
	
	<title>공지사항 상세보기</title>

	
</head>
<body>

<div class="fh5co-loader"></div>
	<div id="page">
	
		<%@ include file="../include/menu.jsp" %>
	
	<div id="fh5co-explore" class="fh5co-bg-section">
		<div class="container">
				<h3 id="weatherjisu">공지사항</h3>
			<div class="row animate-box text-right">
				

  
  <form name = "detailForm" method = "post" >
  	<table border = "1">
  	<colgroup>
				     	<col width="25%"/>
				     	<col width="25%"/>
				     	<col width="25%"/>
				     	<col width="25%"/>
				     
				     		
	</colgroup>
  	
  	<tr>
  		<th>번호</th>
  		<td name = "updateNo">${service.no}</td>
  		<th>작성자</th>
  		<td>${service.writer}<input type = "hidden" value = "${service.isCheck}"/></td>
  	</tr>
  	<tr>
  		<th>등록일</th>
  		<td><fmt:formatDate value = "${service.regdate}" pattern = "yyyy-MM-dd" /></td>
  		<th>수정일</th>
  		<td><fmt:formatDate value = "${service.update_date}" pattern = "yyyy-MM-dd" /></td>
  		
  	</tr>
  	<tr>
  		<th>제목</th>
  		<td>${service.title}</td>
  		<th>조회수</th>
  		<td>${service.hit}</td>
  	</tr>
  	<tr>
  		<th>내용</th>
  		<td id = "td-body" colspan="3"><input type = "hidden" id = "detail-body" value = "${service.body}">${service.body}</td>
  	</tr>
 <%--  	<tr>
  		<th colspan = "4">첨부파일</th>
  	</tr>
  	<c:forEach var="fileList" items="${LIST}"> 
		<tr>
			<td colspan = "4">
			<!-- 파일의 이름을 출력할 때 다운로드해줘야 하므로   파일이름${info.oriName}에 링크걸기 -->
			 <!--  <a href="../FileBoard/FileDownload.sun?fileNo=${info.no}">${info.oriName}</a> -->
			 ${fileList.filename}
			
			  ( ${info.comma} Byte) 
			</td>
		</tr> 
		
	</c:forEach>
	--%>
		
  	</table>
  	
  	<div>첨부파일</div>
  	<hr/>
  	 <div class="box-footer">
  	  
   <ul class = "mailbox-attachments clearfix uploadedList"></ul>
  </div>
	<hr/>
	<span>
	 	<input type="button" id = "btnList" value="목록"/>
	<c:if test="${LEVEL eq 1}">
	  	<button id = "btnUpdate">수정</button>
	  	<button id = "btnDelete">삭제</button>
	  	
	</c:if>
	
  </span>
  </form>
  
  
			</div>
			</div>		
	</div>
	
	<%@ include file="../include/footer.jsp" %>
	
	</div>	
	
	
	
 
	<%--첨부파일 하나의 영역--%>
<%--이미지--%>
<script id="templatePhotoAttach" type="text/x-handlebars-template">
    <li class = "write-li">
        <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
        <div class="mailbox-attachment-info">
            <a href="{{getLink}}" class="mailbox-attachment-name" data-lightbox="uploadImages"><i class="fa fa-camera"></i> {{filename}}</a>
        </div>
    </li>
</script>
<%--일반 파일--%>
<script id="templateFileAttach" type="text/x-handlebars-template">
    <li class = "write-li">
        <%--<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>--%>
        <span class="mailbox-attachment-info">
            <a href="{{getLink}}" class="mailbox-attachment-name"><i class="fa fa-paperclip"></i>{{filename}}</a>
				
			</span>
    </li>
</script>
  
  
  
  <script>
	
	
	$(document).ready(function(){
		
		 
		listAttach();
		
		//isCheckDetail();
		
		  // 전역변수 선언
	
        var no = ${service.no}; // 현재 게시글 번호
      
        //alert("no====="+no);
        //var fileList = ${service.filename}
   
        
        //-------------------------------------
      function listAttach(){
    	
        	var templatePhotoAttach = Handlebars.compile($("#templatePhotoAttach").html()); // 이미지 template
         var templateFileAttach = Handlebars.compile($("#templateFileAttach").html());   // 일반파일 template
           
        	
        	var list = new Array(); 
        	<c:forEach items="${LIST}" var="fileList">
        	list.push("${fileList.filename}");
        	</c:forEach>
        	var listSize = list.length;
        	//alert(listSize);
        	var filelist = list[0];
            //alert("000000----"+filelist);
        	for(var i = 0;i<listSize; i++){
               // 파일정보 가공
               var fileInfo = getFileInfo(list[i]);
               // 이미지 파일일 경우
               if (fileInfo.fullname.substr(12, 2) == "s_") {
                   var html = templatePhotoAttach(fileInfo);
               // 이미지 파일이 아닐 경우
               } else {
                    html = templateFileAttach(fileInfo);
               }
               $(".uploadedList").append(html);
         
        		}  
        }
      
        

        //-------------------------------------
        
	
		//게시물 수정기능
		$("#btnUpdate").click(function(){
			/* var body = $("detail-body").val();
			session.setAttribute("BODY", body); */
			//폼에 입력한 데이터 서버로 전송
			document.detailForm.action = "./updateView.do?no=${service.no}";
			document.detailForm.submit();
		});
		
		
		 //게시물삭제기능
		 $("#btnDelete").click(function(){
			 if(confirm("삭제하시겠습니까?")){
				 document.detailForm.action = "./noticeDelete.do?no=${service.no}";
				 document.detailForm.submit();
			 }
		 });
		 
		 
	 	 //목록돌아가기
		 $("#btnList").on("click", function () {
			
			 location.href = "./noticeList.do";
			 
		 });
		
		
	});
	</script>
  
  
  
  
  
  
</body>
</html>
