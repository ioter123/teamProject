/*이미지 파일인지 확인: /정규표현식/ */
function checkImageType(fileName){
	var pattern=/jpg|gif|png|jpeg/;
	return fileName.match(pattern);
}

function getFileInfo(fullName){
	var fileName, imgsrc, getLink, fileLink;
	if(checkImageType(fullName)){ //이미지 파일인 경우
		imgsrc="/proj/upload/displayFile.do?fileName="
			+fullName;
		// 예) /2019/06/21/s_1ba549eb-7204-491d-ac7a-93e459f21f41_banana.gif
		// *fileLink: 1ba549eb-7204-491d-ac7a-93e459f21f41_banana.gif (저장이름)
		fileLink=fullName.substr(14); //14 인덱스~끝        
		var front=fullName.substr(0,12); //0~11
		var end=fullName.substr(14);
		//*getLink: /proj/upload/displayFile.do?fileName=/2019/06/21/1ba549eb-7204-491d-ac7a-93e459f21f41_banana.gif (연월일경로+저장이름)
		getLink="/proj/upload/displayFile.do?fileName=" 
				+front+end;
	}else{ //이미지가 아닌 경우
		fileLink=fullName.substr(12);                    //(저장이름)
		getLink="/proj/upload/displayFile.do?fileName="  //(연월일경로+저장이름)
				+fullName;
	}
	// uuid_filename
	//* fileName: banana.gif (원본이름)
	fileName=fileLink.substr(fileLink.indexOf("_")+1);  
	return {fileName: fileName, imgsrc: imgsrc,
			getLink: getLink, fullName:fullName };
}



