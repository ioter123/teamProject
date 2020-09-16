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

public class SelectlifeDAO extends SqlSessionDaoSupport {
	
	@Autowired
	SqlSessionTemplate session;
	
	public List<HashMap<String, Object>> localCodeList() throws Exception{ 
		return (List)session.selectList("selectJisu.location"); 
	}
	
	public LifeJisuVO selectJisu(LifeJisuVO vo) throws Exception{ 
		LifeJisuVO vo1=session.selectOne("selectJisu.alljisu", vo); 
		return vo1;
	}

}
