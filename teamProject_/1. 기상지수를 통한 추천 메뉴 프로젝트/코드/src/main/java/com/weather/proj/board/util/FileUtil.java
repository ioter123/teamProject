package com.weather.proj.board.util;

import java.io.File;

//파일업로드시 발생될 문제해결기능을 제공하는 클래스
public class FileUtil {
	//문제: 업로드할 폴더가 없는 경우
	//해결: 강제로 폴더를 만든다
	public static void makeFolder(String path) {
		File file = new File(path);
		file.mkdirs();
	}
	
	//문제: 이름이 동일할 경우
	//해결: 이름을 변경  -> 이름_번호
	public static String renameTo(String path, String name) {
		//어느 폴더에 어떤 이름으로 자장할거다...이름 동일하면 바꾸자
		
		//폴더가 없으면 만들자
		makeFolder(path);
		
		//이름 생성규칙: 원래이름.확장자  -> 원래이름_번호.확장자
		String tempName = name;  //현재이름을 기억하기 위한 변수
		int count  = 0;          //'_'뒤에 붙일 번호를 기억하기 위한 변수
		
		File file = new File(path, tempName);
		while(file.exists()) {
			//예) test.png  test_1.png  test_2.png
			//1. '.' 을 기준으로 파일명과 확장자 분리
			int index = name.lastIndexOf(".");   //마지막 '.'의 인덱스
			String fileName = name.substring(0, index); //파일명
			String extNams = name.substring(index+1);   //확장자
			
			//2. 번호를 증가
			count = count + 1;
			
			//3. 파일명+_+번호
			fileName = fileName+"_"+count;
			
			//4. 변경된이름+분리시켜 놓은 확장자
			tempName = fileName+"."+extNams;
			
			file = new File(path, tempName);
		}
		
		return tempName;
	}
}
