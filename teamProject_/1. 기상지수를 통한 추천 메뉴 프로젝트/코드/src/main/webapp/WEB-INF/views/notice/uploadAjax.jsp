<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<style>
		.fileDrop{
			width:600px;
			height:200px;
			border:1px dotted blue;
		}
	</style>
	<script src="<c:url value="/resources/js/notice_common.js"/>"></script>
		<!-- <script type="text/javascript" src = "/uri/resources/js/notice_common.js"></script> -->

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
			<script>
	$(document).ready(function(){
		
		//파일 업로드 ajax
		$(".fileDrop").on("dragenter dragover", function(event){
				event.preventDefault();  //이미지같은 내용이 바로 보여지는 것을 막음
		 
		});
		//event:제이쿼리 이벤트
		//originalEvent: 자바스크립트 이벤트
		$(".fileDrop").on("drop", function(event){  //드래그해서 드롭한 파일들 ajax업로드 요청
			event.preventDefault();  //기본효과 막음
			//드래그된 파일정보
			var files = event.originalEvent.dataTransfer.files;
			//첫파일
			var file = files[0];
			//alert(file);
			//콘솔에서 파일정보 확인
			//alert("file==="+file);
			
			//ajax로 전달할 폼 객체
			var formData = new FormData();
			//폼 객체에 파일추가, append("변수명", 값)
			formData.append("file", file);
			
			
			
			$.ajax({
				type:"post",
				url:"./uploadAjax.do",
				data: formData,  //여러개 넣기?
				dataType:"text",
				//processData:true-> get / false->post방식
				//contentType: true-> application/x-www-form-urlencoded,
										//false-> multipart/form-data
				processData:false,  //post
				contentType:false,  //multipart
				
				success:function(data){//업로드 성공하면
					//alert("업로드 성고 = "+data);
				
					//console.log(data);
			 		var str = "";
					var fileInfo = getFileInfo(data); //첨부파일 정보
					var html = "<a href ='"+fileInfo.getLink+"'>"+fileInfo.filename+"</a><br>";//하이퍼링크
					html += "<input type='hidden' class='file' value='"+fileInfo.fullname+"'>";//hidden 태그추가
					//div에 추가
					$(".uploadedList").append(html);
					
					
				//이미지 파일이면 썸네일 이미지 출력
				if(checkImageType(data)){
					str = "<div><a href='./displayFile.do?filename="+getImageLink(data)+"'>";   //Controller에서 Mapping주소를 /notice/displayFile.do로 
					str += "<img src='./displayFile.do?filename="+data+"'></a>";
					
				}	//일반 파일이면 다운로드 링크
				else{
					str = "<div><a href = './displayFile.do?filename="+data+"'>"+getOriginalName(data)+"</a>";
				}
				
				
				//삭제버튼
				str += "<span data-src="+data+">[삭제]</span></div>";
				$(".uploadedList").append(str);	
					
				} 
				
			});
			
		});
		
		
		
		 $(".uploadedList").on("click","span",function(event){
			//alert("삭제");
			var that = $(this);  //여기서 this는 클릭한 span태그
			$.ajax({
				url:"./deleteFile.do",
				type:"post",
				//태그.attr('속성')
				data:{filename :$(this).attr("data-src")}, //json방식  
				dataType:"text",
				success:function(result){
					if(result == "deleted"){
						//클릭한 span태그가 속산 div를 제거
						that.parent("div").remove();
					}
				}
				
			});
		});
		 
		
	});//끝
	
	
	 //파일관련 스크립트
	//원본파일이름을 목록에 출력하기 위해
	function getOriginalName(filename){
		
		//이미지 파일이면
		if(checkImageType(filename)){
			alert(filename);
			return;  //종료
		}
		//uuid를 제외한 원래 파일 이름을 리턴함  -> 중복저장을 방지하기 위함
		var idx = filename.indexOf("_")+1;
	
		return filename.substr(idx);
	}
	
	//이미지파일 링크 - 클릭하면 원본 이미지를 출력해주기 위해
	function getImageLink(filename){
		//이미지파일이 아니면
		if(!checkImageType(filename)){
			return; 
		}
		
		//이미지 파일이면(썸네일이 아닌 원본이미지를 가져오기 위해)
		var front = filename.substr(0,12);  //년원일 경로 추출
		var end = filename.substr(14);  //년월일 경로와 s_ㄹ르 제거한 원본 파일명 추출
		console.log(front);  //2018/04/05/
		console.log(end);	
		//원본파일명
		return front+end;  //디렉토리를 포함한 원본파일명을 리턴
	}
	
	//이미지파일 형식을 체크하기 위해
	function checkImageType(filename){
		//i : 대소문자 무관 ignore case
		var pattern = /jpg|gif|png|jpeg/i;  
		return filename.match(pattern);  //규칙 맞으면 true
	} 
	 
	</script>
</head>
<body>
  <!-- 파일업로드 -->
  <h2>파일업로드</h2>
  <div class = "fileDrop"></div><!-- 업로드 영역 -->
  <div class = "uploadedList"></div><!-- 업로드된 파일여영ㄱ -->
</body>
</html>

