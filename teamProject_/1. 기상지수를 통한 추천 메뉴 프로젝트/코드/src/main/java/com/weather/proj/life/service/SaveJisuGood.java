package com.weather.proj.life.service;


import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weather.proj.life.dao.SaveJisuGoodDAO;
import com.weather.proj.life.vo.LifeJisuVO;
import com.weather.proj.life.vo.ProductVO;

@Service
public class SaveJisuGood {
	
	@Autowired
	SaveJisuGoodDAO dao;
	

	// db데이터 csv로 저장
	public void saveDate() throws Exception {
		
		String url = this.getClass().getResource("").getPath(); 
		String filepath=url.substring(1,url.indexOf(".metadata"))+"springProject/src/main/webapp/resources/recomm";
		
		// 생활지수 csv로 저장
		String title="jisuData";
		BufferedWriter fw=new BufferedWriter(new FileWriter(filepath+"/jisu/"+title+".csv"));
		List<LifeJisuVO> jisuList=dao.saveJisu();
		SimpleDateFormat format = new SimpleDateFormat ( "yyyyMMddHH");
		for (LifeJisuVO vo : jisuList) {
			Date timetemp=vo.getJisu_time();
			String time = format.format(timetemp);
			fw.write(vo.getJisu_no()+","+vo.getJisu_local_code()+","+time+","+vo.getJisu_discomfort()+","
		+vo.getJisu_foodpoison()+","+vo.getJisu_frozen()+","+vo.getJisu_heat()+","+vo.getJisu_sensheat()+","
		+vo.getJisu_senstemp()+","+vo.getJisu_sky()+","+vo.getJisu_UV());
			fw.newLine();
		}
		System.out.println("생활지수 csv 생성!");
		fw.flush();
		fw.close();
		
		// 좋아요 갯수 csv로 저장
		List<ProductVO> productNoList=dao.productNoList();
		for(ProductVO vo1: productNoList) {
			String title1="GoodList"+vo1.getProduct_name()+vo1.getProduct_no();
			BufferedWriter fw1=new BufferedWriter(new FileWriter(filepath+"/csv/"+title1+".csv"));
			List<ProductVO> goodList=dao.saveGood(vo1.getProduct_no());
			for (ProductVO vo : goodList) {
				Date timetemp=vo.getRecomm_date();
				String time = format.format(timetemp);
				fw1.write(vo.getRecomm_no()+","+time+","+vo.getRecomm_good());
				fw1.newLine();
			}
			fw1.flush();
			fw1.close();
		}
		System.out.println("상품 별 좋아요 갯수 csv 생성!");
		
	}	
	
	// 추천 순위 저장
	public void updateSeq() throws Exception {
		List<List<String>> ret = new ArrayList<List<String>>();
        BufferedReader br = null;
        String url = this.getClass().getResource("").getPath(); 
		String filepath=url.substring(1,url.indexOf(".metadata"))+"springProject/src/main/webapp/resources/recomm/result";
        br = Files.newBufferedReader(Paths.get(filepath+"/prediction.csv"));
        Charset.forName("UTF-8");
        String line = "";
        while((line = br.readLine()) != null){
            List<String> tmpList = new ArrayList<String>();
            String array[] = line.split(",");
            tmpList = Arrays.asList(array);
            ret.add(tmpList);
        }
        br.close();
        ret.remove(0);
        for (int i = 0; i < ret.size(); i++) {
        	List temp;
        	for(int j=i; j<ret.size();j++) {
        		if(Integer.parseInt(ret.get(i).get(1)) >= Integer.parseInt(ret.get(j).get(1))) {	
        		}
        		else {
        			temp=ret.get(i);
        			ret.set(i, ret.get(j));
        			ret.set(j, temp);
        		}
        	}
        }
        ProductVO vo=new ProductVO();
        for(int i=0; i<ret.size(); i++) {
        	String name=(String)ret.get(i).get(0);
        	vo.setProduct_name(name);
        	int seq=i;
        	vo.setProduct_seq(seq+1);
        	dao.updateSeq(vo);
        }   
		
	}
}
