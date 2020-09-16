<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
		align:center;
		width: 80%;
		margin: auto;
		text-align: center;
		border-top: 1px solid sandyBrown;
	}
	th{
		color: white;
		background-color: sandyBrown;
		
	}
	
	th,td{
		padding: 5px;
	}
	
	.uploadedList, .FileList{
	 	list-style:none;
	}
	
	.FileList{
		text-align:center;
		align:center;
		
		margin:auto;
		list-style:none;
	}
	
	.FileList>li, .uploadedList>li{
		margin:5px;
		display:inline-block;
	}
	
	.uploadedList{
		text-align:center;
		margin: 10px;
		
	}
	
	
	
	.update-td{
		width:100%;
	}
	
	#body{
		height:200px;
	}
	
	
	
	textarea, input{
	 border:0;
	}
	
	
	.delBtn{
		text-align:center;
		font-size: 10px;
		margin:5px;
		padding:5px 10px 5px 10px;
	}
	
	button, #btnNoticeList{
		background-color: white;
		color: sandyBrown;
		border-radius:20px;
		border:2px solid sandyBrown;
		padding:5px 10px 5px 10px;
		margin-top:10px;
	}
	
	button:hover, #btnNoticeList:hover{
		background-color: sandyBrown;
		color: white;
	}
	
	.btnDIV{
		margin:10px;
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
	
	
	</style>
	
	<script type="text/javascript">
	

	</script>
	
	
	<title>공지사항 수정</title>
	
	
		<%--첨부파일 하나의 영역--%>
	<%--이미지--%>
	<script id="templatePhotoAttach" type="text/x-handlebars-template">
    <li>
        <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
        <div class="mailbox-attachment-info">
            <a href="{{getLink}}" class="mailbox-attachment-name" data-lightbox="uploadImages"><i class="fa fa-camera"></i> {{filename}}</a>
				<a href="{{fullname}}" class="btn btn-default btn-xs pull-right delBtn"><i class="fa fa-fw fa-remove">삭제</i></a>
			</div>
    </li>
	</script>
	<%--일반 파일--%>
	<script id="templateFileAttach" type="text/x-handlebars-template">
    <li>
        <span class="mailbox-attachment-info">
            <a href="{{getLink}}" class="mailbox-attachment-name"><i class="fa fa-paperclip"></i>{{filename}}</a>
				<a href="{{fullname}}" class="btn btn-default btn-xs pull-right delBtn"><i class="fa fa-fw fa-remove">삭제</i></a>
			</span>
    </li>
	</script>
	
	<script>
	$(document).ready(function(){
		
		listAttach();
		
		isCheckUpdate();
		
/* 		removeHTML(); */
		
		
		<%--여기에도 있어야함 (위에도)--%>
		var templatePhotoAttach = Handlebars.compile($("#templatePhotoAttach").html()); // 이미지 template
      var templateFileAttach = Handlebars.compile($("#templateFileAttach").html());   // 일반파일 template
		
   // 전체 페이지 파일 끌어 놓기 기본 이벤트 방지 : 지정된 영역외에 파일 드래그 드랍시 페이지 이동방지
      $(".content-wrapper").on("dragenter dragover drop", function (event) {
          event.preventDefault();
      });
      
		//첨부파일 추가 ajax요청
		$("#fileDrop").on("dragenter dragover", function(event){
			event.preventDefault();  //이미지같은 내용이 바로 보여지는 것을 막음
	 
		});
		$("#fileDrop").on("drop", function(event){  //드래그해서 드롭한 파일들 ajax업로드 요청
			event.preventDefault();  //기본효과 막음
			//드래그된 파일정보
			var files = event.originalEvent.dataTransfer.files;
			//첫파일
			var file = files[0];
			//콘솔에서 파일정보 확인
			//console.log(file);
			
			//ajax로 전달할 폼 객체
			var formData = new FormData();
			//폼 객체에 파일추가, append("변수명", 값)
			formData.append("file", file);  //첨부파일 추가
			
			$.ajax({
				type:"post",
				url:"./uploadAjax.do",
				data: formData,
				dataType:"text",
				//processData:true-> get / false->post방식
				//contentType: true-> application/x-www-form-urlencoded,
										//false-> multipart/form-data
				processData:false,  //post
				contentType:false,  //multipart
				
				success:function(data){//업로드요청이 성공하면
					//alert("-----noticeUpdate 파일 업로드 성공시!");
					/* console.log(data);
					
					var fileInfo = getFileInfo(data); //첨부파일 정보
					var html = "<a href ='"+fileInfo.getLink+"'>"+fileInfo.filename+"</a><br>";//하이퍼링크
					html += "<input type='hidden' class='file' value='"+fileInfo.fullname+"'>";//hidden 태그추가
					//div에 추가
					$("#uploadedList").append(html);
					 */
					
					// 파일정보 가공
	                var fileInfo = getFileInfo(data);
	                //alert("작성jsp --- fileInfo="+fileInfo);
	                //alert("파일의 풀네임:----"+fileInfo.fullname);
	                // 이미지 파일일 경우
	                if (fileInfo.fullname.substr(12, 2) == "s_") {
	                	//alert("이미지파일이야!");
	                    var html = templatePhotoAttach(fileInfo);
	                // 이미지 파일이 아닐 경우
	                } else {
	                	//alert("이미지파일아니야~");
	                    html = templateFileAttach(fileInfo);
	                }
	                //목록에 출력
	                $(".uploadedList").append(html);
					
				}
			});
		});	
		
		//수정--------------------------------------------------------
		// 수정 처리시 파일 정보도 함께 처리
       /*  $("#updateForm").submit(function (event) {
            event.preventDefault();
            var that = $(this);
            var str = "";
            $(".uploadedList .delBtn").each(function (index) {
                //str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href")+"'>"
            	str += "<input type='hidden' name='files' value='"+$(this).attr("href")+"'>"
            });
            that.append(str);
            that.get(0).submit();
        }); */
		//--------------------------------------------------------------------
			//기존파일
		 // 파일 삭제 버튼 클릭 이벤트
	    // 파일 삭제 버튼 클릭 이벤트 : 파일삭제, 파일명 DB 삭제 처리
	    $(".FileList").on("click", ".delBtn", function (event) {
	        event.preventDefault();
	        var file_no = ${service.no};
	        //alert("FileList  no-----===="+file_no)
	        //var no = $("#no").val();
	        //alert("no0000"+no);
	      
	      if (confirm("삭제하시겠습니까? 삭제된 파일은 다시 복구되지 않습니다.")) {
	        var that = $(this);
	        var file_name = $(this).attr("href");

	        $.ajax({
	            url: "./deleteUpdateFile.do",
	            type: "post",
	            data: "no="+${service.no}+"&filename="+file_name,
	            //dataType: "text",
	            //async : false,
	            processData: false,
	        	//contentType: false,
	            success:function (result) {
	            	//alert("삭제 받기 성공!")
	                if (result == "DELETED") {
	                    alert("삭제되었습니다!");
	                    that.parents("li").remove();
	                }
	            },
	            complete : function(data) {
	                 // 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
	           },
	           error:function(request,status,error){
	               //alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
	              }

	        });
	    }
	    });
		
		
		//새로운업로드 파일
		  $(".uploadedList").on("click", ".delBtn", function (event) {
			  
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
		
		
		
		$("#btnUpdateCommit").click(function(){//수정완료 버튼 눌럿을시
			
			var no = ${service.no};
			//alert("수정게시글 번호 no="+no)
			var title = $("#title").val();
			var body = $("#body").val();
			var isCheck = $("#isCheck").val();
			if(title == ""){
				alert("제목을 입력하세요");
				document.updateForm.title.focus();
				return false;
			}
			if(body == ""){
				alert("내용을 입력하세요");
				document.updateForm.body.focus();
				return false;
			}
			
			else if((title != "") && (body != "")){
				 $("#updateForm").submit(function (event) {
			            event.preventDefault();
			            var that = $(this);
			            var str = "";
			            $(".uploadedList .delBtn").each(function (index) {
			                //str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href")+"'>"
			            	str += "<input type='hidden' name='files' value='"+$(this).attr("href")+"'>"
			            });
			            that.append(str);
			            that.get(0).submit();
			        });
			}
			
			
		});
		
			
			
			//--------------------------------------------------------------------------------------------------
			
		   
	
     // 목록버튼 클릭시
        $("#btnNoticeList").on("click", function () {
        	 if (confirm("수정완료를 하지않은 상태입니다. 수정한 내용들이 저장 되지않습니다. 원하시면 확인을 눌러주세요!")) {
        		 location.href = "./noticeList.do";
        	 }
        });
     

      
	});   //끝
	
	//------------------------------------------------
	//첨부파일 목록 ajax요청 처리
	     function listAttach(){
		
			var templatePhotoAttach = Handlebars.compile($("#templatePhotoAttach").html()); // 이미지 template
	      var templateFileAttach = Handlebars.compile($("#templateFileAttach").html());   // 일반파일 template
			
        	
        	//alert("------------");
        	
        	var list = new Array(); 
        	<c:forEach items="${LIST}" var="fileList">
        	list.push("${fileList.filename}");
        	</c:forEach>
        	var listSize = list.length;
        	//alert(listSize);
        	var filelist = list[0]
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
               $(".FileList").append(html);
         
        		}  
        }
	
	
	  	
	  	function isCheckUpdate(){
	  		//alert("isCheckUpdate");
	  		var isCheckTest = $("#checkTest").val();
		  	/* var isCheck = ${service.isCheck};  */
		  	/* alert("isCheck=="+${service.isCheck}); */
			  	if(isCheckTest == "on"){
			  		//alert("on");
			  		$("#isCheck").prop('checked', true);
					//alert("----isCheck =="+$("#isCheck").val());
			  	}
			  	else{
			  		$("#isCheck").prop('checked', false);
			  		//alert("----isCheck =="+$("#isCheck").val());
			  	}
	  	}
	
	</script>
</head>
<body>

<div class="fh5co-loader"></div>
	<div id="page" class = "content-wrapper">
	
		<%@ include file="../include/menu.jsp" %>
	
	<div id="fh5co-explore" class="fh5co-bg-section">
		<div class="container">
				<h3 id="weatherjisu">공지사항-수정</h3>
			<div class="row animate-box text-right">
				



  <form id = "updateForm" name = "updateForm" method = "post"  action = "./noticeUpdate.do?no=${service.no}"><!-- 여기에서 에러발생 / 파라미터로 no를 넘겨주지않아서 list가 수정되지않았음 -->
  	<table border = "1">
  	<colgroup>
				     			<col width="20%"/>
				     			<col width="20%"/>
				     			<col width="20%"/>
				     			<col width="20%"/>
				     			<col width="10%"/>
				     			<col width="10%"/>
				     		
				     		</colgroup>
  	<tr>
  		<th>번호</th>
  		<td id = "no">${service.no}</td>
  		<th>작성자</th>
  		<td>${service.writer}</td>
  		<th>메인</th>
  		<td><input type = "checkbox" name = "isCheck" id = "isCheck"><label for="isCheck"><span></span></label>
  		<input type = "hidden" id = "checkTest" value = "${service.isCheck}"/>
  		</td>
  	</tr>
  	<tr>
  		<th>제목</th>
  		<td colspan="5"><input  name = "title" class = "update-td" id = "title" value = "${service.title}" placeholder = "제목입력"/></td>
  	</tr>
  	<tr>
  		<th>등록일</th>
  		<td colspan="5"><fmt:formatDate value ="${service.update_date}" pattern = "yyyy-MM-dd" /></td>
  	</tr>
  	<tr>
  		<th>내용</th>
  		<td colspan="5"><textarea name = "body" class = "update-td" id = "body" placeholder = "내용입력">${service.body}</textarea></td>
  	</tr>

  	</table>
  	<div>기존 첨부파일</div>
  	<div><ul class = "FileList"></ul></div>
  	<hr/>
  
  	
  	<div>
  		 <div id="fileDrop">
                                <br/>
                                <br/>
                                <br/>
                                <p class="text-center"><i class="fa fa-paperclip"></i> 첨부파일을 드래그해주세요.</p>
                                
                                <br/>
                            </div>
  	</div> 
  	<div>
  		<div> 
  		<!-- <p>추가업로드 파일</p> -->
  		<hr/>
  		<ul class="uploadedList"></ul><!-- 업로드 파일들 --></div>
  	</div>
  	<hr/>
  	<div class = "btnDIV">
  	<button id = "btnUpdateCommit"><i class="fa fa-save"></i>수정완료</button>
  	<input type = "button" id = "btnNoticeList" name = "btnNoticeList" value = "목록보기"/>
  	</div>
  </form>
  
  
	  	</div>
	  </div>	
  </div>	
  
  <%@ include file="../include/footer.jsp" %>
  
  </div>
  
  
</body>
</html>
