package com.weather.proj.board.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;


public class UploadFileUtils {
	//로깅을 위한 변수

	public static String uploadFile(String uploadPath,
			                        String originalName, 
			                        byte[] fileData) throws Exception {
		// uuid 발급
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		
		//(1)연월일별 업로드할 디렉토리 생성 - #(1)
		String savedPath = calcPath(uploadPath);
		File target = new File(uploadPath 
				+ savedPath, savedName);  // => uploadPath+savedPath: e:/upload + /2019/06/20, 
		                                  //    savedName: uid_originalName
		
		//(2)서버의 임시 디렉토리에 업로드된 파일  => 지정된 디렉토리로 복사
		FileCopyUtils.copy(fileData, target);
		
		//(3)파일의 확장자 검사
		// 예) a.jpg / aaa.bbb.ccc.jpg  => jpg
		String formatName = originalName.substring(  //확장자 추출
				originalName.lastIndexOf(".") + 1);
		String uploadedFileName = null;
		
		//(4)이미지 파일은 썸네일 사용
		if (MediaUtils.getMediaType(formatName) != null) { //MediaUtils.java로 생성한 파일 사용하여 이미지 식별
			
			//(5) 이미지인 경우 =>  썸네일 생성 - #(5)
			uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
		
		} else {
			//(6)이미지가 아닌 경우 - #(6)
			uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
		}
		return uploadedFileName;  // => 이미지인 경우      : /2019/06/20/s_uid_originalName (셈네일이름)
		                          // => 이미지가 아닌 경우: /2019/06/20/uid_originalName
	}
	
	//#(1)연월일별 업로드할 디렉토리 생성
	private static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		String yearPath = File.separator 
				+ cal.get(Calendar.YEAR);                   //=> /2019
		String monthPath = yearPath + File.separator        //=> /2019/06
				+ new DecimalFormat("00").format(
						cal.get(Calendar.MONTH) + 1);
		String datePath = monthPath + File.separator         //=> /2019/06/20
				+ new DecimalFormat("00").format(cal.get(    
						Calendar.DATE));
		makeDir(uploadPath, yearPath, monthPath, datePath);  
		//=> e:/upload, e:/upload/2019, e:/upload/2019/06, e:/upload/2019/06/20    디렉토리 생성
		return datePath;  //=> /2019/06/20
	}
	private static void makeDir(String uploadPath
			, String... paths) {    //가변사이즈 매개변수
		//디렉토리가 존재하면 skip
		if (new File(paths[paths.length - 1]).exists()) {
			return;
		}
		for (String path : paths) {
			File dirPath = new File(uploadPath + path);
			if (!dirPath.exists()) {
				dirPath.mkdir(); // 디렉토리 생성
			}
		}
	}
	//#(5) 썸네일 생성
	private static String makeThumbnail(String uploadPath
			, String path, String fileName) throws Exception {
		// 이미지를 읽기 위한 버퍼 => 메모리로 이미지 읽어드림
		BufferedImage sourceImg = ImageIO.read(
				new File(uploadPath + path, fileName));
		
		// 높이가 100픽셀 단위의 썸네일 생성
		BufferedImage destImg = Scalr.resize(
				sourceImg, Scalr.Method.AUTOMATIC
				, Scalr.Mode.FIT_TO_HEIGHT, 30);
		// 썸네일의 이름
		String thumbnailName = uploadPath + path  //=> e:/upload/2019/06/20/s_uid_originalName
				+ File.separator + "s_" + fileName;
		File newFile = new File(thumbnailName);
		//확장자
		String formatName = fileName.substring(
				fileName.lastIndexOf(".") + 1);
		// 썸네일 생성
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		
		// 썸네일의 이름을 리턴함
		return thumbnailName.substring(
				uploadPath.length()).replace(File.separatorChar, '/');
	}
	
    //#(6)이미지가 아닌 경우  => 아이콘 생성
	private static String makeIcon(String uploadPath
			, String path, String fileName) throws Exception {
		// 아이콘의 이름
		String iconName = uploadPath + path + File.separator 
				+ fileName;
		// 아이콘 이름을 리턴
		// File.separatorChar : 디렉토리 구분자
		// 윈도우 \ , 유닉스(리눅스) /
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
}
