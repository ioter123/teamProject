<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<%@ include file="../include/header.jsp" %>
	
	<title>공지사항 추가</title>
	
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
	
	.container{
		width:70%;
	}
	
	
	table{
		border: hidden;
		width:100%;
		margin:auto;
		text-align:center;
		padding: 10px;
		border-spacing: 10px;
		border-top: 1px solid sandyBrown;
		border-bottom: 1px solid sandyBrown;
		backgroud-color:sandyBrown;
	}
	
	
	th{
		color: white;
		padding:10px;
		background-color: sandyBrown;
		border-bottom: 1px solid white;
	}
	
	textarea, input{
	 border:0;
	}
	
	
	.uploadedList{
		text-align:center;
	 	list-style:none;
	}
	
	.uploadedList>li{
		display:inline-block;
		margin:5px;
	}
	
	td{
	border-bottom:1px solid sandyBrown; 
	}
	
	.write-td{
	text-align:left;
	width:100%;
	
	}
	

	.delBtn{
		text-align:center;
		font-size: 10px;
		margin:5px;
		padding:5px 10px 5px 10px;
	}
	
	.btn-success-1{
		color:white;
		background-color:coral;
	}
	
	.btn-success-1:hover{
		color:white;
		background-color:tomato;
	}
	
	/*메인 설정 checkbox----------------------*/
	
	input[type="checkbox"] {
   	position: relative; 
   	top:1.5px;
    	/* visibility:hidden; */
    	display:none;
	}
		
		label {
		
	    display: block;
	    position: relative; 
	    margin:auto;
	   /* margin-bottom:25px; */
	    width: 60px;
	    height: 34px;
	    border-radius: 17px;
	    background-color: #ddd;
	    transition-duration: 0.2s;
	}

	label span {
	     position: absolute; 
	    left: 3px;
	    top: 3px;
	    z-index: 1;
	    width: 28px;
	    height: 28px;
	    border-radius: 50%;
	    background-color: #fff;
	    transition-duration: 0.2s;
	}
		
		label:before, label:after{
	    position: absolute; 
	    top: 0;
	    width: 34px;
	    font-size: 11px;
	    line-height: 34px;
	    color: #fff;
	    text-align: center;
	}
	
	label:before {
	    left: 0;
	    content: 'ON';
	}
	
	label:after {
    right: 0;
	    content: 'OFF';
	}
	
	input:checked + label {
	    background-color: #ffa70b;
	}
	
	input:checked + label span {
	    transform: translateX(26px);
	}
	#title, #body{
		width:100%;
	}
	</style>
	
	
</head>
<body>

<div class="fh5co-loader"></div>
	
	<div id="page" class = "content-wrapper">
	<%@ include file="../include/menu.jsp" %>

	<div id="fh5co-explore" class="fh5co-bg-section">
		<div class="container">
				<h3 id="weatherjisu">공지사항 작성 페이지</h3>
			<div class="row animate-box text-right">


<!-- form //////////////////////////////////////////////////////////////// -->

  <!-- <h1>공지사항 작성 페이지</h1> -->
  <form id = "regForm" name = "regForm" method = "post" encType = "multipart/form-data"><!-- encType = "multipart/form-data" -->
  		<table>
  		
  		<colgroup>
				     			<col width="25%"/>
				     			<col width="25%"/>
				     			<col width="25%"/>
				     			<col width="25%"/>
				     		
		</colgroup>
		<tr id = "uname-tr">
  				<th>작성자</th>
  				<td><input type = "hidden" name = "writer" id = "writer"value = "${UNAME}">${UNAME}</td>
  				<th>메인</th>
  				<td id = "main-td"><input type="checkbox" name = "isCheck" id = "isCheck">
  				<label for="isCheck"><span></span></label></td>
  			</tr>
  			<tr>
  				<th>제목</th>
  				<td class= "write-td" colspan="3"><input name ="title" id = "title"placeholder = "제목을 입력."></td>
  			</tr>
  			<tr>
  				<th>내용</th>
  				<td class= "write-td" colspan="3"><textarea name = "body" id = "body" rows = "5"placeholder = "글 내용을 입력해주세요."></textarea></td>
  			</tr>
  			
  		</table>
  		
  		<!-- 파일 첨부 -->
  		<!--  <h3>파일업로드</h3> -->
  		 						<div class="form-group">
                            <div class="fileDrop">
                                <br/>
                                <br/>
                                <br/>
                                
                                <p class="text-center"><i class="fa fa-paperclip"></i> 첨부파일을 드래그해주세요.</p>
                                <br/>
                            </div>
                        </div>
                     <div class="box-footer">
                        <div>
                            <hr>
                        </div>
                        <ul class="mailbox-attachments clearfix uploadedList"></ul><!-- 업로드 파일들 -->
                    	</div>
		 <!--  <div class = "fileDrop"></div> -->
		  <!-- <div id = "uploadedList" name= "uploadedList"></div> -->
		  				<div>
                        <button id = "listBtn" class="btn btn-primary"><i class="fa fa-list"></i> 목록</button>
                        <div class="pull-right">
                            <button type="reset" class="btn btn-warning"><i class="fa fa-reply"></i> 초기화</button>
                            <button id = "saveBtn" class="btn btn-success-1"><i class="fa fa-save"></i> 저장</button>
                        </div>
                  </div>
                    
                    
   		</div>
			</div>		
	</div>
	</form>
	
	<%@ include file="../include/footer.jsp" %>
	
	</div>
  
     
  		
  <%--  ///////////////////////////////////////////////////////////// --%>
  
  	<%--Handlebars JS--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js"></script>
	<script src="<c:url value="/resources/js/notice_common.js"/>"></script>
	<!-- <script type="text/javascript" src = "/uri/resources/js/notice_common.js"></script> -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  
  
   	<%--첨부파일 하나의 영역--%>
<%--이미지--%>
<script id="templatePhotoAttach" type="text/x-handlebars-template">
    <li class = "write-li">
        <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment" >
			</span>
        <div class="mailbox-attachment-info">
            <a href="{{getLink}}" class="mailbox-attachment-name" data-lightbox="uploadImages"><i class="fa fa-camera"></i> {{filename}}</a>
            <a href="{{fullname}}" class="btn btn-default btn-xs pull-right delBtn"><i class="fa fa-fw fa-remove">삭제</i></a>
        </div>
    </li>
</script>
<%--일반 파일--%>
<script id="templateFileAttach" type="text/x-handlebars-template">
    <li class = "write-li">
        <%--<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>--%>
        <div class="mailbox-attachment-info">
            <a href="{{getLink}}" class="mailbox-attachment-name"><i class="fa fa-paperclip"></i> {{filename}}</a>
            <a href="{{fullname}}" class="btn btn-default btn-xs pull-right delBtn"><i class="fa fa-fw fa-remove">삭제</i></a>
        </div>
    </li>
</script>
	
  
 
<script>
  
  $(document).ready(function(){
	  
		 
		 var templatePhotoAttach = Handlebars.compile($("#templatePhotoAttach").html());
	     var templateFileAttach = Handlebars.compile($("#templateFileAttach").html());
	     // 전체 페이지 파일 끌어 놓기 기본 이벤트 방지 : 지정된 영역외에 파일 드래그 드랍시 페이지 이동방지
	     $(".content-wrapper").on("dragenter dragover drop", function (event) {
	         event.preventDefault();
	     });
	     // 파일 끌어 놓기 기본 이벤트 방지
	     $(".fileDrop").on("dragenter dragover", function (event) {
	         event.preventDefault();
	     });
		 
		 
		
		 // 파일 드랍 이벤트
	    // 파일 드랍 이벤트 : 파일 전송 처리
	    $(".fileDrop").on("drop", function (event) {
	        event.preventDefault();
	        var files = event.originalEvent.dataTransfer.files;
	        var file = files[0];
	        var formData = new FormData();
	        formData.append("file", file);
	        $.ajax({
	            url: "./uploadAjax.do",
	            data: formData,
	            dataType: "text",
	            processData: false,
	            contentType: false,
	            type: "POST",
	            success: function (data) {
	               
	                // 파일정보 가공
	                var fileInfo = getFileInfo(data);
	                
	                // 이미지 파일일 경우
	                if (fileInfo.fullname.substr(12, 2) == "s_") {
	                	//alert("이미지파일이야!");
	                    var html = templatePhotoAttach(fileInfo);
	                // 이미지 파일이 아닐 경우
	                } else {
	                	//alert("이미지파일아니야~");
	                    html = templateFileAttach(fileInfo);
	                }
	                $(".uploadedList").append(html);
	            }
	        });
	    });
		
	     

		   // 글 저장 버튼 클릭 이벤트
	    // 글 저장 버튼 클릭 이벤트 : 파일명 DB 저장 처리
	    
	    $("#saveBtn").click(function(){
	    	 
	    	//alert("저장 버튼 클릭!");
	    	var title = $("#title").val();
			var body = $("#body").val();
			var writer =  $("#writer").val();
			var isCheckTest =$("#isCheck").val();
			/* var isCheck = 0; */
			//alert("00000"+isCheckTest); 
			//alert("writer == "+writer);
			
			if(title == ""){
				alert("제목을 입력하세요");
				document.regForm.title.focus();
				return false;
			}
			else if(body == ""){
				alert("내용을 입력하세요");
				document.regForm.body.focus();
				return false;
			}
			
			else if((title != "") && (body != "")){
		
				
				 //alert("====check==="+isCheckTest);
				//alert("저장 버튼 클릭!");
				 document.regForm.action="./noticeInsert.do";
				  $("#regForm").submit(function (event) {
					//alert("regForm 넘어오니");
	 	        event.preventDefault();
	 	        var that = $(this);   //$(this)로 꼭 해야함 아니면 배열에 undefinded
	 	        var str = "";
	 	        $(".uploadedList .delBtn").each(function (index) {
	 	            //str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href")+"'>"
	 	        	str += "<input type='hidden' name='files' value='"+$(this).attr("href")+"'>"
	 	        });
	 	        //alert("str----"+str);
	 	        that.append(str);
	 	        that.get(0).submit();
	 	       
		   
		   	 });
				}
	  
	    });
	     
	     
	    
	    // 파일 삭제 버튼 클릭 이벤트
	    // 파일 삭제 버튼 클릭 이벤트 : 파일삭제, 파일명 DB 삭제 처리
	    $(document).on("click", ".delBtn", function (event) {
	        event.preventDefault();
	        var that = $(this);
	        //alert("that==="+that);
	        $.ajax({
	            url: "./deleteFile.do",
	            type: "post",
	            data: {filename:$(this).attr("href")},
	            dataType: "text",
	            success: function (result) {
	                if (result == "DELETED") {
	                    alert("삭제되었습니다.");
	                    that.parents("li").remove();
	                }
	            }
	        });
	    });
	     
	     
	     
	     //목록 돌아가기---------------------------------------------
	       $("#listBtn").click(function(){
	       if (confirm("공지사항 작성 중입니다. 저장되지않습니다. 괜찮으시다면 확인을 눌러주세요!")==true) {
	    	   document.regForm.action= "./noticeList.do";
	    	   document.regForm.submit();
	       	}
	       else{//취소
	    	   return false;
	    	   
	       }
	     	
	       });
	    	
	     
	});//끝

		</script>
		
		<!-- <script>
			var main = document.getElementById('main');
			var mainResult = main.getAttribute("checked");   //체크되어있는지 저장
			alert("mainResult === "+mainResult);
		</script> -->

  
	
  <!-- jQuery -->
	<script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
	<!-- jQuery Easing -->
	<script src="<c:url value="/resources/js/jquery.easing.1.3.js"/>"></script>
	<!-- Bootstrap -->
	<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
	<!-- Waypoints -->
	<script src="<c:url value="/resources/js/jquery.waypoints.min.js"/>"></script>
	<!-- Stellar Parallax -->
	<script src="<c:url value="/resources/js/jquery.stellar.min.js"/>"></script>
	<!-- Carousel -->
	<script src="<c:url value="/resources/js/owl.carousel.min.js"/>"></script>
	<!-- countTo -->
	<script src="<c:url value="/resources/js/jquery.countTo.js"/>"></script>
	<!-- Magnific Popup -->
	<script src="<c:url value="/resources/js/jquery.magnific-popup.min.js"/>"></script>
	<script src="<c:url value="/resources/js/magnific-popup-options.js"/>"></script>
	<!-- Main -->
	<script src="<c:url value="/resources/js/main.js"/>"></script>
  
 
</body>

</html>
