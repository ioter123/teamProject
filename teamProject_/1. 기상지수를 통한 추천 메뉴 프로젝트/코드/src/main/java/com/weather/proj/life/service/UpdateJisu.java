package com.weather.proj.life.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.StandardSocketOptions;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weather.proj.life.dao.UpdatelifeDAO;
import com.weather.proj.life.vo.LifeJisuVO;

@Service
public class UpdateJisu {
	
	@Autowired
	UpdatelifeDAO dao;
	
	public void updatejisu() throws Exception {
		// 현재시간
		SimpleDateFormat format = new SimpleDateFormat ( "yyyyMMddHH");
		Date timetemp = new Date();
		String time = format.format(timetemp);
		// 지점번호
		List<HashMap<String, Object>> areaList=dao.localCodeList();
		LifeJisuVO vo=new LifeJisuVO();
		for (int j=0;j<areaList.size();j++) {
			String areaName=(String)areaList.get(j).get("LOCAL_SI");
			String temp=String.valueOf(areaList.get(j).get("LOCAL_CODE"));
			long areaNo =Long.parseLong(temp);
			
			// api 서비스키
			String serviceKey ="0HJgwXrVeRvqTjir6oZMUiCBFhJWTFA6%2FuzpICYS5Og2dk9iZqu9VU%2F%2BaJjzKy9Z%2BjPL5UEg8tDtXN0gjDlCRA%3D%3D";
			
			// 기상청 api 요청 주소
			ArrayList<String> urlList = new ArrayList<String>();
			urlList.add("http://newsky2.kma.go.kr/iros/RetrieveLifeIndexService3/getFsnLifeList?" + "serviceKey=" + serviceKey 
					+ "&areaNo=" + areaNo + "&time=" + time + "&_type=json");
			urlList.add("http://newsky2.kma.go.kr/iros/RetrieveLifeIndexService3/getSensorytemLifeList?" + "serviceKey=" + serviceKey 
					+ "&areaNo=" + areaNo + "&time=" + time + "&_type=json");
			urlList.add("http://newsky2.kma.go.kr/iros/RetrieveLifeIndexService3/getHeatLifeList?" + "serviceKey=" + serviceKey 
					+ "&areaNo=" + areaNo + "&time=" + time + "&_type=json");
			urlList.add("http://newsky2.kma.go.kr/iros/RetrieveLifeIndexService3/getDsplsLifeList?" + "serviceKey=" + serviceKey 
					+ "&areaNo=" + areaNo + "&time=" + time + "&_type=json");
			urlList.add("http://newsky2.kma.go.kr/iros/RetrieveLifeIndexService3/getUltrvLifeList?" + "serviceKey=" + serviceKey 
					+ "&areaNo=" + areaNo + "&time=" + time + "&_type=json");
			urlList.add("http://newsky2.kma.go.kr/iros/RetrieveLifeIndexService3/getSensoryHeatLifeList?" + "serviceKey=" + serviceKey 
					+ "&areaNo=" + areaNo + "&requestCode=A20&time=" + time + "&_type=json");
			urlList.add("http://newsky2.kma.go.kr/iros/RetrieveLifeIndexService3/getAirpollutionLifeList?" + "serviceKey=" + serviceKey 
					+ "&areaNo=" + areaNo + "&time=" + time + "&_type=json");
			urlList.add("http://newsky2.kma.go.kr/iros/RetrieveLifeIndexService3/getWinterLifeList?" + "serviceKey=" + serviceKey 
					+ "&areaNo=" + areaNo + "&time=" + time + "&_type=json");
			String check=null;
			int count=0;
			double today=999;
			double tomorrow=999;
			double theDayAfterTomorrow=999;
			Date date=timetemp;
			long area_No=areaNo;
			double h3=999;
			double h6=999;
			double h9=999;
			double h12=999;
			
			for (int i=0;i<urlList.size();i++) {
				//URL 객체 생성
				URL url = new URL((String)urlList.get(i));
				
				BufferedReader bf; 
				String line = ""; 
				String result="";
				//날씨 정보를 받아옵니다.
				bf = new BufferedReader(new InputStreamReader(url.openStream()));
				
				//버퍼에 있는 정보를 하나의 문자열로 변환. 
				while((line=bf.readLine())!=null){ 
					result=result.concat(line); 
					System.out.println(result); 
				}
				
				// Json parser를 만들어 만들어진 문자열 데이터를 객체화 합니다. 
				JSONParser parser = new JSONParser(); 
				JSONObject obj = (JSONObject) parser.parse(result); 
				// Top레벨 단계인 response 키를 가지고 데이터를 파싱합니다. 
				JSONObject parse_response = (JSONObject) obj.get("Response"); 				
				JSONObject parse_header = (JSONObject) parse_response.get("header"); 
				check=((String)parse_header.get("successYN"));
				if(check.equals("N")) {
					today=999;
					tomorrow=999;
					theDayAfterTomorrow=999;
					h3=999;
					h6=999;
					h9=999;
					h12=999;
					count=count+1;
				}
				else {
					// body 로 부터 items 받아옵니다. 
					JSONObject parse_body = (JSONObject) parse_response.get("body");
					JSONObject weather = (JSONObject) parse_body.get("indexModel");
					// 생활지수 데이터 가져오기
					if( i==0 || i==4) {
						today =((String)weather.get("today")=="" || ((String)weather.get("today")).length()==0) ? 
								999 : Double.parseDouble((String)weather.get("today") );
						tomorrow = ((String)weather.get("tomorrow")=="" || ((String)weather.get("tomorrow")).length()==0) ?
								999 : Double.parseDouble((String)weather.get("tomorrow") );
						theDayAfterTomorrow = ((String)weather.get("theDayAfterTomorrow")=="" || 
								((String)weather.get("theDayAfterTomorrow")).length()==0) ? 
								999 : Double.parseDouble((String)weather.get("theDayAfterTomorrow") );
						date =format.parse((String)weather.get("date"));
						
						area_No = Long.parseLong(((String)weather.get("areaNo")));
						
					}
					else {
						h3 = ((String)weather.get("h3")=="" || ((String)weather.get("h3")).length()==0) ?  
								999 : Double.parseDouble((String)weather.get("h3") );
						h6 = ((String)weather.get("h6")=="" || ((String)weather.get("h6")).length()==0) ?  
								999 : Double.parseDouble((String)weather.get("h6") );
						h9 = ((String)weather.get("h9")=="" || ((String)weather.get("h9")).length()==0) ?  
								999 : Double.parseDouble((String)weather.get("h9") );
						h12 = ((String)weather.get("h12")=="" || ((String)weather.get("h12")).length()==0) ?  
								999 : Double.parseDouble((String)weather.get("h12") );
						date =format.parse((String)weather.get("date"));
						area_No = Long.parseLong(((String)weather.get("areaNo")));
						
					}
				}
				
				if(i==0) {
					vo.setJisu_foodpoison(today);
				}else if(i==1) {
					vo.setJisu_senstemp(h3);
				}else if(i==2) {
					vo.setJisu_heat(h3);
				}else if(i==3) {
					vo.setJisu_discomfort(h3);
				}else if(i==4) {
					vo.setJisu_UV(today);
				}else if(i==5) {
					vo.setJisu_sensheat(h3);
				}else if(i==6) {
					vo.setJisu_sky(h3);
				}else if(i==7) {
					vo.setJisu_frozen(h3);
				}
				vo.setJisu_time(date);
				vo.setJisu_local_code(area_No);
			}
			if(count==7) {
				continue;
			}
			int cnt=dao.selectTime(format.format(date), areaNo);
			if(cnt!=0) {
				continue;
			}
			dao.insertJisu(vo);
		}
		
	}


}
