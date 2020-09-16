package com.weather.proj.life.controller;

import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import com.weather.proj.life.dao.ProductDAO;
import com.weather.proj.life.service.LifeWeatherService;
import com.weather.proj.life.service.SaveJisuGood;
import com.weather.proj.life.service.UpdateJisu;
import com.weather.proj.life.vo.LifeJisuVO;
import com.weather.proj.life.vo.ProductVO;


public class LifeJisuScheduler{
	@Autowired
	UpdateJisu update;
	
	@Autowired
	ProductDAO dao;
	
	@Autowired
	LifeWeatherService lws;
	
	@Autowired
	SaveJisuGood sjg;

	//생활지수 데이터 가져오기
	@Scheduled(cron="0 0 0/1 * * ?")
	public void updateData() throws Exception {
		System.out.println("생활지수 api 실행");
		update.updatejisu();
		
	}

	// 추천 메뉴 좋아요 초기화
	// 매일 자정 00시에 상품별 좋아요 갯수 저장 및 초기화
	@Scheduled(cron="0 0 0 * * ?")
	public void updateList() throws Exception {
		System.out.println("좋아요 갯수 초기화!");
		LifeJisuVO vo1=new LifeJisuVO();
		ProductVO vo=new ProductVO();
		dao.recommendReset();
		LinkedHashMap arealist=lws.selectjisu(vo1);
		LifeJisuVO vo2=(LifeJisuVO)arealist.get("vo");
		List<Integer> list=dao.recommendReset3();		
		for(int item:list) {
			vo.setRecomm_jisu_no(vo2.getJisu_no());
			vo.setRecomm_prod_no(item);
			dao.recommendReset2(vo);	
		}		
		sjg.saveDate();
							
	}
	
	// 추천 메뉴 추천 순위 변경
	// 상품별 좋아요 갯수 초기화 후 5분 뒤 추천 순위 업데이트
	@Scheduled(cron="0 5 0 * * ?")
	public void updateSeq() throws Exception {
		System.out.println("추천 순위 업데이트!");
		sjg.updateSeq();
	}

}
