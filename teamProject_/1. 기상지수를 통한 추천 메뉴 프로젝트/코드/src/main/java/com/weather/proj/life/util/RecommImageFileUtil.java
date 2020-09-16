package com.weather.proj.life.util;

import java.io.File;

//파일업로드시 발생될 문제해결기능을 제공하는 클래스
public class RecommImageFileUtil {

	public static String renameTo(String path,String name) {

		String tempName=name;   //현재이름을 기억하기위한 변수
		int		count = 0;	//_뒤에 붙일 번호를 기억하기위한 변수
		
		File file = new File(path, tempName);
		while(file.exists()) {
			int index = name.lastIndexOf("."); 
			//.을 기준으로  파일명과 확장자를 분리
			String fileName = name.substring(0, index);
			String extName  = name.substring(index+1);
			//번호를 증가
			count=count+1;
			//파일명+_+번호
			fileName = fileName+"_"+count;
			//변경이름+분리시켜놓은 확장자
			tempName=fileName+"."+extName;
			file = new File(path, tempName);
		}
		
		return tempName;
	}
}










