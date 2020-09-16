package com.weather.proj.notice.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.jsp.PageContext;

import org.apache.commons.io.IOUtils;
import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.weather.proj.notice.VO.NoticeVO;
import com.weather.proj.notice.service.NoticeService;
import com.weather.proj.notice.util.NoticeMediaUtils;
import com.weather.proj.notice.util.NoticeUploadFileUtils;

@Controller
public class NoticeUploadController {

	 @Autowired
	    NoticeService noticeService;
	
	String uploadPath = "E:\\project_test";
	
	@RequestMapping(value = "/uploadAjax.do", method = RequestMethod.GET)
	public String uploadAjax() {
	//jsp포워딩
		return "notice/uploadAjax";
	}
	
	@ResponseBody
	@RequestMapping(value = "/uploadAjax.do", method = RequestMethod.POST, produces = "text/plain;charset=utf-8") //한글처리
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception{
		return new ResponseEntity<String>(NoticeUploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);
	
	}
	
	/*//파일게시물 작성?
	 @RequestMapping(value = "insertFile.do", method = RequestMethod.POST)
	    public String noticeInsert(@ModelAttribute NoticeVO vo) throws Exception{
	    	noticeService.create(vo);
	    	return "redirect:noticeList.do";
	    }*/
	
	
	//파일 데이터 브라우저 전송
    // 업로드 된 파일을 화면에 보여주기
	@ResponseBody
	@RequestMapping(value="/displayFile.do")
	public ResponseEntity<byte[]> displayFile(String filename) throws Exception{
		System.out.println(filename+":fliename---00000");
		//서버의 파일을 다운로드 하기 위한 스트림
		InputStream in = null; 
		ResponseEntity<byte[]> entity = null;
		try {
			//확장자를 추출하여 formatName에 저장
			String formatName = filename.substring(filename.lastIndexOf(".")+1);
			//추출한 확장자를 이미지파일여부를 검사하고 리턴받아 mType에 저장
			MediaType mType = NoticeMediaUtils.getMediaType(formatName);
			//헤더 구성객체(외부에서 데이터를 주고받ㅇㄹ 때에는 header, body를 구성해야하기에)
			HttpHeaders headers = new HttpHeaders();
			// 실제 경로의 파일을 읽어들이고 InputStream 객체 생성
			in = new FileInputStream(uploadPath+filename);
			//이미지 파일이면
			if(mType != null) {
				headers.setContentType(mType);
				
			}
			//이미지가 아니면
			else {
				filename = filename.substring(filename.indexOf("_")+1);
				//다운로드용 컨텐트 타입
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				
				//바이트배열을 스트링으로 
				//파일의 한글깨짐 방지
				headers.add("Content-Disposition", "attachment; filename=\""+new String(filename.getBytes("utf-8"), "iso-8859-1")+"\""); 
			
			}
			//바이트 배열, 헤더, HTTP상태코드
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
			//entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
	        //entity = new ResponseEntity<>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
			
		}catch(Exception e) {
			e.printStackTrace();
			//entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}finally {
			in.close();  //스트림 닫기
		}
		return entity;
		
	}
	
	
	/*
	//파일 삭제 매핑- 단일 
	@ResponseBody
	@RequestMapping(value = "notice/deleteFile.do", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String filename) throws Exception{
		//확장자
		String formatName = filename.substring(filename.lastIndexOf(".")+1);
		//이미지파일 여부 검사
		MediaType mType = NoticeMediaUtils.getMediaType(formatName);
		//이미지일때 썸네일+원본파일 삭제, 아니면 원보파일만
		//이미지 파일
		if(mType != null) {
			String front = filename.substring(0, 12);
			String end = filename.substring(14);
			//썸네일 이미지 삭제
			new File(uploadPath+(front+end).replace('/', File.separatorChar)).delete();
		}
		
		//원본파일삭제
		new File(uploadPath+filename.replace('/',File.separatorChar)).delete();
		
		//레코드(DB) 삭제
		//noticeService.deleteFile(filename);
	
	//데이터와 http상태 코드 전송
	return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}*/
	
	
	// 파일 데이터 삭제
    // 단일 파일 데이터 삭제1 : 게시글 작성시
    @ResponseBody
    @RequestMapping(value = "/deleteFile.do", method = RequestMethod.POST)
    public ResponseEntity<String> deleteFile(String filename) throws Exception {
       System.out.println("delete file : " + filename);
        // 파일 삭제
        removeFile(filename);
        return new ResponseEntity<>("DELETED", HttpStatus.OK);
    }

    // 단일 파일 데이터 삭제2 : 게시글 수정시
    @Transactional
    @RequestMapping(value = "/deleteUpdateFile.do", method = {RequestMethod.POST})
    @ResponseBody
    public ResponseEntity<String> deleteFile(int no ,String filename) throws Exception {  //@PathVariable("no") int no, String fileName
       // DB에서 파일명 제거
        noticeService.deleteAttach(filename);
        // 첨부파일 갯수 갱신
        //noticeService.updateAttachCnt(no);
        String formatName = filename.substring(filename.lastIndexOf(".") + 1);
        MediaType mediaType = NoticeMediaUtils.getMediaType(formatName);
        if (mediaType != null) {
            String front = filename.substring(0, 12);
            String end = filename.substring(14);
            new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
        }
        new File(uploadPath + filename.replace('/', File.separatorChar)).delete();
        // 파일 삭제
        removeFile(filename);
        return new ResponseEntity<>("DELETED", HttpStatus.OK);
    }
	
    // 파일 전체 삭제
    // 전체 파일 삭제
    @ResponseBody
    @RequestMapping(value = "/deleteAllFiles.do", method = RequestMethod.POST)
    public ResponseEntity<String> deleteFile(@RequestParam("files[]") String[] files) {
        // 파일이 없을 경우 메서드 종료
        if (files == null || files.length == 0) {
            return new ResponseEntity<>("DELETED", HttpStatus.OK);
        }
        // 파일이 존재할 경우 반복문 수행
        for (String fileName : files) {
            String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
            MediaType mediaType = NoticeMediaUtils.getMediaType(formatName);

            if (mediaType != null) {
                String front = fileName.substring(0, 12);
                String end = fileName.substring(14);
                new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
            }
            new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
            // 파일 삭제
            removeFile(fileName);
        }
        return new ResponseEntity<>("DELETED", HttpStatus.OK);
    }
    
    
 // 파일 삭제 메서드
    private void removeFile(String fileName) {
        // 파일 확장자 추출
        String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
        // 파일 확장자를 통해 이미지 파일인지 판별
        MediaType mediaType = NoticeMediaUtils.getMediaType(formatName);
        // 이미지 파일일 경우, 원본파일 삭제
        if (mediaType != null) {
            // 원본 이미지의 경로 + 파일명 추출
            // 날짜 경로 추출
            String front = fileName.substring(0, 12);
            // UUID + 파일명 추출
            String end = fileName.substring(14);
            // 원본 이미지 파일 삭제(구분자 변환)
            new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
        }
        // 파일 삭제(일반 파일 or 썸네일 이미지 파일 삭제)
        new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
    }
    
    
	

	}
	
	
