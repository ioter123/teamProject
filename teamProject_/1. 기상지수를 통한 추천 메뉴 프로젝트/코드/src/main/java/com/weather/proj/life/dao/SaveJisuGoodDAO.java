package com.weather.proj.life.dao;


import java.util.HashMap;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import com.weather.proj.life.vo.LifeJisuVO;
import com.weather.proj.life.vo.ProductVO;

public class SaveJisuGoodDAO extends SqlSessionDaoSupport {
	
	@Autowired
	SqlSessionTemplate session;
	
	// 좋아요 자료 저장을 위한 조회
	public List<ProductVO> saveGood(int recomm_prod_no) throws Exception{ 
		return (List)session.selectList("saveJisuGood.saveGood", recomm_prod_no); 
	}
	
	// 지수 자료 저장을 위한 조회
	public List<LifeJisuVO> saveJisu() throws Exception{ 
		return (List)session.selectList("saveJisuGood.savejisu"); 
	}
	
	// 추천 상품 리스트 번호 조회
	public List<ProductVO> productNoList() throws Exception{ 
		return (List)session.selectList("saveJisuGood.productNoList"); 
	}
	
	// 추천 순위 업데이트
	public void updateSeq(ProductVO vo) throws Exception{
		session.update("saveJisuGood.updateSeq", vo);
	}
	
}
