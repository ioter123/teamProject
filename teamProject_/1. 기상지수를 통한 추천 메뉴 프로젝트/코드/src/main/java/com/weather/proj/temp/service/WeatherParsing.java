package com.weather.proj.temp.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.text.SimpleDateFormat;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weather.proj.temp.dao.WeatherDAO;
import com.weather.proj.temp.vo.WeatherVO;

import java.util.*;


@Service
public class WeatherParsing {
	
	@Autowired
	WeatherDAO dao;
	
	public void weatherParsing() throws Exception {
		List<WeatherVO> list = (List<WeatherVO>)dao.selectLoc();
		for(WeatherVO vo : list) {
			vo.setWE_LOCAL_CODE(vo.getLocal_code());
			try {
				SimpleDateFormat format= new SimpleDateFormat("yyyyMMdd");
				Date timetemp=new Date();
				String baseDate = format.format(timetemp);  // 날짜
				
				SimpleDateFormat format1= new SimpleDateFormat("HHmm");	
				Calendar calendar = Calendar.getInstance();
		        calendar.setTime(timetemp);		        
		        String baseTime = format1.format(calendar.getTime());// 시간
		        System.out.println(baseTime);
				String nx;
				String ny;
				if(vo.getLocal_longitude()==null||vo.getLocal_longitude().length()==0) {
					nx="60";
					ny="127";
				}else {
					nx = vo.getLocal_longitude(); // 경도
					ny = vo.getLocal_latitude(); // 위도				
				}
				
				String serviceKey = "YFEePy9Q9uaI5gCp%2FOM4acOX3rePGOQFYPDZ8CiSbRFX7yJr49nvhVJGEUyIetX2PiZXr69JADprzp1K%2FDyPGg%3D%3D";
				String urlStr = "http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastGrib?"+"serviceKey="+serviceKey+"&base_date="+baseDate+"&base_time="+baseTime+"&nx="+nx+"&ny="+ny+"&_type=json";
				URL url = new URL(urlStr);
				System.out.println(urlStr);
				BufferedReader bf;
				String line = " ";
				String result = " ";
				// 날씨 정보를 받아옵니다
				bf = new BufferedReader(new InputStreamReader(url.openStream()));
	
				while((line=bf.readLine())!=null){
					result=result.concat(line);
					System.out.println(result); // 받아온 데이터를 확인해봅니다.
				}
				// Json parser를 만들어 만들어진 문자열 데이터를 객체화 합니다. 
				JSONParser parser = new JSONParser();
				JSONObject obj = (JSONObject) parser.parse(result);
				// Top레벨 단계인 response 키를 가지고 데이터를 파싱합니다.
				JSONObject parse_response = (JSONObject) obj.get("response");
				// response 로 부터 body 찾아옵니다.
				JSONObject parse_body = (JSONObject) parse_response.get("body");
				// body 로 부터 items 받아옵니다.
				JSONObject parse_items = (JSONObject) parse_body.get("items");
				// items로 부터 itemlist 를 받아오기 itemlist : 뒤에 [ 로 시작하므로 jsonarray이다
				JSONArray parse_item = (JSONArray) parse_items.get("item");
				
				JSONObject weather; // parse_item은 배열형태이기 때문에 하나씩 데이터를 하나씩 가져올때 사용합니다.
				String category;
				long fcst_Value;
				Double fcst_Value1;
				// 필요한 데이터만 가져오려고합니다.
				
				for(int i = 0 ; i < parse_item.size(); i++)
				{
					weather = (JSONObject) parse_item.get(i);
					category = (String)weather.get("category");
					String baseDate2 = String.valueOf(weather.get("baseDate"));
					long baseTime3=0;
					
					if(weather.get("baseTime") instanceof Long) {
						baseTime3 = (Long)weather.get("baseTime");
					}else {
						String baseTime2 = (String)weather.get("baseTime");
						baseTime3 = Long.parseLong(baseTime2);
					}
					
					
					
					vo.setWE_DATE(baseDate2);
					vo.setWE_TIME(baseTime3);
					if(weather.get("obsrValue") instanceof Long) {
						fcst_Value = (Long)weather.get("obsrValue");
	//					System.out.println(fcst_Value);
						switch(category) {
							case "REH":		//습도 %
								vo.setWE_HUMIDITY(String.valueOf(fcst_Value));
								break;
							case "RN1":		//1시간 강수량
								vo.setWE_RAIN(String.valueOf(fcst_Value));
								break;
							case "T1H":		//온도
								vo.setWE_TEMPERATURE(String.valueOf(fcst_Value));
								break;
							case "VEC":		//풍향  0-90(북동) 90-180(동남) 180-270(남서) 270-360(북서)
								vo.setWE_WIND_DIRECTION(String.valueOf(fcst_Value));
								break;
							case "WSD":		//풍속
								vo.setWE_WIND_SPEED(String.valueOf(fcst_Value));
								break;
						}
					}else if(weather.get("obsrValue") instanceof Double) {
						fcst_Value1 = (Double)weather.get("obsrValue");
	//					System.out.println(fcst_Value1);
						switch(category) {
						case "REH":		//습도 %
							vo.setWE_HUMIDITY(String.valueOf(fcst_Value1));
							break;
						case "RN1":		//1시간 강수량
							vo.setWE_RAIN(String.valueOf(fcst_Value1));
							break;
						case "T1H":		//온도
							vo.setWE_TEMPERATURE(String.valueOf(fcst_Value1));
							break;
						case "VEC":		//풍향  0-90(북동) 90-180(동남) 180-270(남서) 270-360(북서)
							vo.setWE_WIND_DIRECTION(String.valueOf(fcst_Value1));
							break;
						case "WSD":		//풍속
							vo.setWE_WIND_SPEED(String.valueOf(fcst_Value1));
							break;
					}
					}
					
				}
				bf.close();
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			dao.SaveWeather(vo);
		}
	}
}