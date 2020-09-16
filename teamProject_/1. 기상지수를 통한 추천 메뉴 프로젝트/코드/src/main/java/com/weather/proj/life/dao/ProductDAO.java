package com.weather.proj.life.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

import com.weather.proj.life.vo.ProductVO;

public class ProductDAO extends SqlSessionDaoSupport {
	@Autowired
	SqlSessionTemplate session;
	
	// 메뉴 추가
	public void addProd(ProductVO vo) {
		session.insert("product.addProduct", vo);
		vo.setRecomm_prod_no((int)session.selectOne("product.productno"));
		session.insert("product.addRecomm",vo);
	}
	// 메뉴 수정
	public void updateProd(ProductVO vo) {
		session.update("product.updateProduct",vo);
	}
	
	// 메뉴 리스트 갯수 조회
	public int productListCnt() {
		return session.selectOne("product.productListCnt"); 
	}
	
	// 메뉴 리스트
	public List<ProductVO> productList() {
		return (List)session.selectList("product.productList"); 
	}
	
	// 메뉴 리스트2
	public List<ProductVO> productListSub() {
		return (List)session.selectList("product.productListSub"); 
	}
	
	// 메뉴 상세보기 조회
	public ProductVO productDetail(int recomm_prod_no) {
		return (ProductVO)session.selectOne("product.productDetail", recomm_prod_no); 
	}
	
	// 메뉴 상세보기 조회2
	public ProductVO productDetailSub(int recomm_prod_no) {
		return (ProductVO)session.selectOne("product.productDetailSub", recomm_prod_no); 
	}
	
	// 메뉴 삭제
	public void productDelete(int recomm_prod_no) {
		session.update("product.productDelete", recomm_prod_no); 
	}
	
	// 메뉴 삭제2
	public void productDeleteSub(int recomm_prod_no) {
		session.update("product.productDeleteSub", recomm_prod_no); 
	}
	
	// 좋아요 증가
	public void recommendGood(int recomm_prod_no) {
		session.update("product.recommendGood", recomm_prod_no); 
	}
	
	// 좋아요 감소
	public void recommendBad(int recomm_prod_no) {
		session.update("product.recommendBad", recomm_prod_no); 
	}
	
	// 항목 초기화
	public void recommendReset() {
		session.update("product.recommendReset"); 
	}
	// 항목 초기화2
	public void recommendReset2(ProductVO vo) {
		session.insert("product.recommendReset2", vo); 
	}
	// 항목 초기화3
	public List<Integer> recommendReset3() {
		return (List)session.selectList("product.recommendReset3"); 
	}

}
