package com.weather.proj.temp.vo;

public class WeatherVO {
	private int WE_NO;
	private String WE_DATE; // 실측날짜
	private String WE_TEMPERATURE; // 기온
	private String WE_RAIN; // 1시간 강수량
	private String WE_WIND_DIRECTION; // 풍향
	private String WE_WIND_SPEED; // 풍속
	private String WE_HUMIDITY; // 습도
	private long WE_TIME; // 실측시간
	private long WE_LOCAL_CODE;//지역코드
	private long local_code=Long.parseLong("1100000000");
	private String local_longitude; // 경도
	private String local_latitude; // 위도
	private String local_si;	//시
	
	private String today;
	private String yesterday;
	
	public String getYesterday() {
		return yesterday;
	}
	public void setYesterday(String yesterday) {
		this.yesterday = yesterday;
	}
	public String getToday() {
		return today;
	}
	public void setToday(String today) {
		this.today = today;
	}
	public long getWE_LOCAL_CODE() {
		return WE_LOCAL_CODE;
	}
	public void setWE_LOCAL_CODE(long wE_LOCAL_CODE) {
		WE_LOCAL_CODE = wE_LOCAL_CODE;
	}
	public int getWE_NO() {
		return WE_NO;
	}
	public void setWE_NO(int wE_NO) {
		WE_NO = wE_NO;
	}
	public String getWE_DATE() {
		return WE_DATE;
	}
	public void setWE_DATE(String wE_DATE) {
		WE_DATE = wE_DATE;
	}
	public long getWE_TIME() {
		return WE_TIME;
	}
	public void setWE_TIME(long wE_TIME) {
		WE_TIME = wE_TIME;
	}
	public String getWE_HUMIDITY() {
		return WE_HUMIDITY;
	}
	public void setWE_HUMIDITY(String wE_HUMIDITY) {
		WE_HUMIDITY = wE_HUMIDITY;
	}
	public String getWE_RAIN() {
		return WE_RAIN;
	}
	public void setWE_RAIN(String wE_RAIN) {
		WE_RAIN = wE_RAIN;
	}
	public String getWE_TEMPERATURE() {
		return WE_TEMPERATURE;
	}
	public void setWE_TEMPERATURE(String wE_TEMPERATURE) {
		WE_TEMPERATURE = wE_TEMPERATURE;
	}
	public String getWE_WIND_DIRECTION() {
		return WE_WIND_DIRECTION;
	}
	public void setWE_WIND_DIRECTION(String wE_WIND_DIRECTION) {
		WE_WIND_DIRECTION = wE_WIND_DIRECTION;
	}
	public String getWE_WIND_SPEED() {
		return WE_WIND_SPEED;
	}
	public void setWE_WIND_SPEED(String wE_WIND_SPEED) {
		WE_WIND_SPEED = wE_WIND_SPEED;
	}
	public String getLocal_longitude() {
		return local_longitude;
	}
	public void setLocal_longitude(String local_longitude) {
		this.local_longitude = local_longitude;
	}
	public String getLocal_latitude() {
		return local_latitude;
	}
	public void setLocal_latitude(String local_latitude) {
		this.local_latitude = local_latitude;
	}
	public long getLocal_code() {
		return local_code;
	}
	public void setLocal_code(long local_code) {
		this.local_code = local_code;
	}
	public String getLocal_si() {
		return local_si;
	}
	public void setLocal_si(String local_si) {
		this.local_si = local_si;
	}
	
	
}

