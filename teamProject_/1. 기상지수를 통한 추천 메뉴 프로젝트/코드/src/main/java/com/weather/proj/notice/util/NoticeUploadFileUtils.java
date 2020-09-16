package com.weather.proj.notice.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.imgscalr.Scalr;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
//파일 업로드, 삭제, 정송, 폴더생성, 파일명 중복방지 등 기능을 처리할 메서드들 

import com.weather.proj.notice.dao.NoticeDAO;
import com.weather.proj.notice.service.NoticeService;


public class NoticeUploadFileUtils {
	static NoticeService noticeService;

	/*//파일 업로드 처리
	public static String uploadFile(MutilpartFile file, HttpServletRequest request) throws Exception{
		String originalFileName = file.getOriginalFilename();
		byte[] fileData = file.getBytes(); //파일 데이터
		
		//파일명 중복 방지처리
		String uuidFileName = getUuidFileName(originalFileName);
		
		//파일 업로드 경로 설정
		String rootPath = getRootPath(originalFileName, request); //기본경로 추출(이미지 | 일반파일)
		String datePath = getDatePath(rooPath);  //날짜 경로 추출, 날짜 폴더 생성
	
		//서버에 파일 저장
		File target = new File(rootPath+datePath, uuidFileName); //파일 객체 생성
		FileCopyUtils.copy(fileData, target);  //파일 객체에 파일데이터 복사
		
		//이미지 파일인 경우 썸네일이미지 생성
		if(MediaUtils.getMediaType(originalFileName) != null) {
			uuidFileName = makeThumbnail(rooPath, datePath, uuidFileName);
		}
		
		//파일 저장 경로 치환
		return replaceSavedFilePath(datePath, uuidFileName);
	}
	
	
	//파일 삭제 처리
	public static void deleteFile(String fileName, HttpServletRequest request) {
		String rootPath = getRootPath(fileName, request); //기본 경로 추출
		
		//원본 이미지 파일 삭제
		MediaType mediaType = MediaUtils.getMediaType(fileName);
		if(mediaType != null) {
			String originalImg = fileName.substring(0, 12) + fileName.substring(14);
			new File(rootPath+originalImg.replace('/', File.separatorChar)).delete();
		}
		
		//파일 삭제(썸네일 | 일반 파일)
		new File(rootPath+fileName.replace('/', File.separatorChar)).delete();
		
	}
	
	
	//파일 출력을 위한 HttpHeader 설정
	public static HttpHeaders getHttpHeaders(String fileName) throws Exception{
		MediaType mediaType = MediaUtils.getMediaType(fileName);  //파일 타입
		HttpHeaders httpHeaders = new HttpHeaders();
		
		//이미지 파일 일때
		if(mediaType != null) {
			httpHeaders.setContentType(mediaType);
			return httpHeaders;
		}
		
		//이미지 파일이 아닐때
		fileName = fileName.substring(fileName.indexOf("_")+1); //UUID제거
		httpHeaders.setContentType(MediaType.APPLICATION_OCTET_STREAM);  //다운로드 MIME 타입설정
		
		//파일명 한글 인코딩 처리
		httpHeaders.add("Content-Disposition", 
								"attachment; filename=\""+new String(fileName.getBytes("UTF-8"),
								"ISO-8859-1")+"\"");
		return httpHeaders;
	}
	
	//기본경로 추출
	public static String getRootPath(String fileName, HttpServletRequest request) {
		String rootPath = "/resources/upload";
		MediaType mediaType = MediaUtils.getMediaType(fileName); //파일 타입
		//이미지 파일 일때
		if(mediaType != null) {
				return request.getSession().getServletContext().getRealPath(rootPath+"/images"); //이미지 파일 경로\
			}
		 return request.getSession().getServletContext().getRealPath(rootPath+"/files"); //일반파일 경로
	}
	
	//날짜 폴더명 추출
	private static String getDatePath(String uploadPath) {
		Calendar calendar = Calendar.getInstance();
		String yearPath = File.separator + calendar.get(Calendar.YEAR);
		String monthPath = yearPath+File.separator + new DecimalFormat("00").format(calendar.get(Calendar.MONTH)+1);
		String datePath = monthPath+File.separator + new DecimalFormat("00").format(calendar.get(Calendar.DATE));
		
		makeDateDir(uploadPath, yearPath, monthPath, datePath);
		
		return datePath;
	}
	
	//날짜별 폴더 생성
	private static void makeDateDir(String uploadPath, String... paths) {
		//날짜별 폴더가 이미 존재하면 메서드 종료
		if(new File(uploadPath+paths[paths.length - 1]).exists())
			return;
		
		//else
		for(String path:paths) {
			File dirPath = new File(uploadPath+ path);
			if(!dirPath.exists())
				dirPath.mkdir();
		}
		
	}
	
	//파일 저장 경로 치환
	private static String replaceSavedFilePath(String datePath, String fileName) {
		String savedFilePath = datePath+File.separator +fileName;
		return savedFilePath.replace(File.separatorChar, '/');
		
	}
	
	//파일명 중복방치 처리
	private static String getUuidFileName(String originalFileName) {
		return UUID.randomUUID().toString() + "_" + originalFileName;
	}
	
	
	//썸네일 이미지 생성
	private static String makeThumbnail(String uploadRootPath, String datePath, String fileName) throws Exception{
		//원본이미지를 메모리상에 로딩
		BufferedImage originalImg = ImageIO.read(new File(uploadRootPath+datePath, fileName));
		//원본이미지 축소
		BufferedImage thumbnailImg = Scalr.resize(originalImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
		//썸네일 파일명
		String thumbnailImgName = "s_"+fileName;
		//썸네일 업로드 경오
		String fullPath = uploadRootPath + datePath+ File.separator+thumbnailImgName;
		//썸네일 파일 객체생성
		File newFile = new File(fullPath);
		//썸네일 파일 확장자 추출
		String formatName = MediaUtils.getFormatName(fileName);
		//썸네일 파일 저장
		ImageIO.write(thumbnailImg, formatName, newFile);
		
		return thumbnailImgName;
	}
	
	}
	*/
	
	//----------------------------------------------------------------------------------------
	
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception{
		//uuid발급
		UUID uuid = UUID.randomUUID();
		//저장할 파일명 = UUID+_원본이름
		String savedName = uuid.toString()+"_"+originalName;
		
		//업로드할 디렉터리(날짜별 폴더)생성
		String savedPath = calcPath(uploadPath);
		//파일경로(기존의 업로드 경로+날짜별경로), 파일ㄹ명을 받아 객체 생성
		File target = new File(uploadPath + savedPath, savedName);
		
		//임시 디렉터리에 업로드된 파일을  지정된 디렉터리로 복사
		FileCopyUtils.copy(fileData, target);
		
		//썸네일을 생성하기 위한 파일의 확장자 검사
		//파일명의 aaa.bbb.ccc.jpg일 경우 마지막 마침표를 찾기 위해
		String formatName = originalName.substring(originalName.lastIndexOf(".")+1); //확장자
		String uploadedfilename = null;
		
		//이미지 파일은 썸네일 사용
		if(NoticeMediaUtils.getMediaType(formatName) != null) {
			//썸네일 생성
			uploadedfilename = makeThumbnail(uploadPath, savedPath, savedName);
		}
			//나머지는 아이콘
		else {
			uploadedfilename = makeIcon(uploadPath, savedPath, savedName);
		}	
		//noticeService.addAttach(vo);
		return uploadedfilename;  //어디로 가는거?
		}
	
	
	

	//날짜별
	private static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		//File.separator:디렉터리 구분자(\\)
		//예) \\2017
		String yearPath = File.separator +cal.get(Calendar.YEAR);
		//월  \\2019\\05
		String monthPath = yearPath+File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		//일
		String datePath = monthPath+File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		//디렉터리 생성 메소드 호출
		makeDir(uploadPath, yearPath, monthPath, datePath);
		return datePath;
	
	}

	//디렉터리 생성
	
	private static void makeDir(String uploadPath, String... paths) {
		//(날짜 경로)디렉토리 존재하면
		/*if(new File(uploadPath+paths[paths.length -1 ]).exists()) {
			return;
		}*/
		if(new File(paths[paths.length - 1]).exists()) {
			return;
		}
		//디렉터리가 존재하지 않으면
		for(String path:paths) {
			File dirPath = new File(uploadPath+path);
			//디렉터리가 존재하지 않으면
			if(!dirPath.exists()) {
				dirPath.mkdir();  //디렉터리 생성
			}
		}
	}


	//썸네일
	private static String makeThumbnail(String uploadPath, String path, String filename) throws Exception{
		//이미지를 읽기 위한 버퍼
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath+path, filename));
		//100픽셀 단위의 썸네일 생성
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
		//썸네일의 이름 생성(원본파일명에 's_'붙임)
		String thumbnailName = uploadPath + path +File.separator + "s_" +filename;
		File newFile = new File(thumbnailName);
		String formatName = filename.substring(filename.lastIndexOf(".")+1);
		//썸네일 생성
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		//썸네일의 이름을 리턴함
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	
	}
	
	
	//아이콘
	private static String makeIcon(String uploadPath, String path, String filename) throws Exception{
		//아이콘 이름
		String iconName = uploadPath+path+File.separator +filename;
		//아이콘 이름을 리턴
		//File.separatorChar : 구분자
		//원도우 \ , 유닉스(리눅스) /
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}


		
		
	}


