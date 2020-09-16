/**
 * 공지사항 공통 javascript
 * 
 */
//이미지파일 형식을 체크하기 위해
	function checkImageType(filename){
		//i : 대소문자 무관 ignore case
		var pattern = /jpg|gif|png|jpeg/i;  
		return filename.match(pattern);  //규칙 맞으면 true
	}
	
	//업로드 파일정보
	function getFileInfo(fullname){
		var filename, imgsrc, getLink, fileLink;
		
		//이미지 파일일 경우
		if(checkImageType(fullname)){
			//이미지 파일 경로(썸네일)
			//imgsrc = "uri/notice/displayFile.do?filename="+fullname;   //---------
			imgsrc = "displayFile.do?filename="+fullname;
			//alert("common.js - imgsrc === "+imgsrc);
			//console.log(imgsrc);
			//업로드 파일명
			fileLink = fullname.substr(14);
			//console.log(fileLink);
			//날짜별 디렉터리 추출
			var front = fullname.substr(0,12);
			//s_를 제거한 업로드 이미지파일명
			var end = fullname.substr(14);
			
			//원본이미지 파일 디렉터리
			//getLink = "uri/notice/displayFile.do?filename="+front+end;
			getLink = "displayFile.do?filename="+front+end;
			//alert("getLink이미지파일==="+getLink);
			
		}
		//이미지 파일이 아닐경우
		else{
			//UUID를 제외한 원본파일명
			fileLink = fullname.substr(12);
			//일반파일 디렉터리
			//getLink = "uri/notice/displayFile.do?filename="+fullname; //----------
			getLink = "displayFile.do?filename="+fullname;
			//alert("getLink그냥 파일==="+getLink);
			
		}
		
		//목록에 출력할 원본파일명
		filename = fileLink.substr(fileLink.indexOf("_")+1);
		return {filename:filename, imgsrc:imgsrc, getLink:getLink, fullname:fullname};  //{변수:값}json리턴
		
	}
	
	
	
		
	
	
