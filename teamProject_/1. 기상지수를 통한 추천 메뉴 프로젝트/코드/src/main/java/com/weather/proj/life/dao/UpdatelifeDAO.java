package com.weather.proj.life.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import com.weather.proj.life.vo.LifeJisuVO;

public class UpdatelifeDAO extends SqlSessionDaoSupport {
	
	@Autowired
	SqlSessionTemplate session;
	
	// 지점 코드 및 이름 조회
	public List<HashMap<String, Object>> localCodeList() throws Exception{ 
		return (List)session.selectList("updateJisu.location"); 
	}
	
	// 지수 데이터 제공 시간 조회
	public int selectTime(String time, long areaNo) throws Exception{ 
		HashMap map = new HashMap();
		map.put("time", time);
		map.put("areaNo", areaNo);
		return (Integer)session.selectOne("updateJisu.selectTime", map); 
	}
	
	// 지수 데이터 저장
	public void insertJisu(LifeJisuVO vo) {
		int ok=session.insert("updateJisu.insertJisu", vo);
	}
}
