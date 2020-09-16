package com.weather.proj.life.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.weather.proj.life.dao.ProductDAO;
import com.weather.proj.life.service.LifeWeatherService;
import com.weather.proj.life.util.RecommImageFileUtil;
import com.weather.proj.life.vo.LifeJisuVO;
import com.weather.proj.life.vo.ProductVO;

@Controller
public class RecommendController {
	
	@Autowired
	ProductDAO dao;
	
	@Autowired
	LifeWeatherService lws;	
	
	// 추천항목 보여주기
	@RequestMapping("recommendList")
	public ModelAndView recommendList(ModelAndView mv,HttpSession session) throws Exception {
		String UID =(String)session.getAttribute("UID");
		mv.addObject("UID", UID);
		String LEVEL =(String)session.getAttribute("LEVEL");
		mv.addObject("LEVEL", LEVEL);
		int cnt=dao.productListCnt();
		if(cnt==0) {
			mv.addObject("notlist",1);
			mv.setViewName("recommend/recommendList");
			return mv;
		}
		else {
			List<ProductVO> list1=dao.productList();
			List<ProductVO> list2=dao.productListSub();
			for (int i=0;i<list1.size();i++) {
				list2.get(i).setRecomm_good(list1.get(i).getRecomm_good());
				list2.get(i).setRecomm_no(list1.get(i).getRecomm_no());
			}
			
			mv.addObject("list2",list2);
			mv.setViewName("recommend/recommendList");
			return mv;
		}
	}
	
	// 추천 항목 상세보기
	@RequestMapping("recommendDetail")
	public ModelAndView recommendDetail(@RequestParam("recomm_prod_no") int recomm_prod_no, ModelAndView mv,HttpSession session) throws Exception {
		String LEVEL =(String)session.getAttribute("LEVEL");
		mv.addObject("LEVEL", LEVEL);
		String UID =(String)session.getAttribute("UID");
		mv.addObject("UID", UID);
		ProductVO vo1=dao.productDetail(recomm_prod_no);
		ProductVO vo2=dao.productDetailSub(recomm_prod_no);
		vo2.setRecomm_good(vo1.getRecomm_good());
		vo2.setRecomm_no(vo1.getRecomm_no());
		mv.addObject("vo2",vo2);
		mv.setViewName("recommend/recommendDetail");
		return mv;
	}
	
	// 항목 추가 페이지 보여주기
	@RequestMapping("addProduct")
	public ModelAndView addProduct(ModelAndView mv,HttpSession session) {
		String UID =(String)session.getAttribute("UID");
		mv.addObject("UID", UID);
		String LEVEL =(String)session.getAttribute("LEVEL");
		mv.addObject("LEVEL", LEVEL);
		mv.setViewName("recommend/addProduct");
		return mv;
	}

	// 항목 추가 프로세스
	@RequestMapping("addProductProc")
	public ModelAndView addProductProc(LifeJisuVO vo1, ProductVO vo, ModelAndView mv, HttpServletRequest request,HttpSession session) throws Exception {
		String UID =(String)session.getAttribute("UID");
		mv.addObject("UID", UID);
		String LEVEL =(String)session.getAttribute("LEVEL");
		mv.addObject("LEVEL", LEVEL);
		String oriName = vo.getFile().getOriginalFilename();
		String url = this.getClass().getResource("").getPath(); 
		String path=url.substring(1,url.indexOf(".metadata"))+"springProject2/src/main/webapp/resources/images/recommend";
		String saveName = RecommImageFileUtil.renameTo(path,oriName);

		File file = new  File(path, saveName);
		
		try {				
			vo.getFile().transferTo(file); // 파일 복사
		} catch (Exception e) {
			System.out.println("파일복사관련 에러="+e);
		}
		String path1 =path.substring(path.lastIndexOf("/resources")+1);
		vo.setProduct_image(path1+"/"+vo.getFile().getOriginalFilename());
		LinkedHashMap arealist=lws.selectjisu(vo1);
		LifeJisuVO vo2=(LifeJisuVO)arealist.get("vo");
		vo.setRecomm_jisu_no(vo2.getJisu_no());		
		dao.addProd(vo);
		RedirectView rv = new RedirectView("recommendList.do");
		mv.setView(rv);
		return mv;
	}
	
	// 항목 삭제
	@RequestMapping("recommendDelete")
	public ModelAndView recommendDelete(@RequestParam("recomm_prod_no") int recomm_prod_no, ModelAndView mv,HttpSession session) throws Exception {
		dao.productDelete(recomm_prod_no);
		dao.productDeleteSub(recomm_prod_no);
		RedirectView rv = new RedirectView("recommendList.do");
		mv.setView(rv);
		return mv;
	}
	
	// 항목 수정 페이지 보여주기
	@RequestMapping("updateProduct")
	public ModelAndView updateProduct(@RequestParam("recomm_prod_no") int recomm_prod_no, ModelAndView mv,HttpSession session) {
		String UID =(String)session.getAttribute("UID");
		mv.addObject("UID", UID);
		String LEVEL =(String)session.getAttribute("LEVEL");
		mv.addObject("LEVEL", LEVEL);
		ProductVO vo1=dao.productDetail(recomm_prod_no);
		ProductVO vo2=dao.productDetailSub(recomm_prod_no);
		vo2.setRecomm_good(vo1.getRecomm_good());
		vo2.setRecomm_no(vo1.getRecomm_no());
		String url = this.getClass().getResource("").getPath(); 
		String path=url.substring(1,url.indexOf(".metadata"))+"springProject2/src/main/webapp"+vo2.getProduct_image();
		String filename=vo2.getProduct_image().substring(vo2.getProduct_image().indexOf("recommend/")+10,vo2.getProduct_image().length());		
		mv.addObject("filename",filename);	
		mv.addObject("vo2",vo2);		
		mv.setViewName("recommend/updateProduct");
		return mv;
	}

	// 항목 수정 프로세스
	@RequestMapping("updateProductProc")
	public ModelAndView updateProductProc(@RequestParam("product_no") int product_no,LifeJisuVO vo1, ProductVO vo, ModelAndView mv, HttpServletRequest request) throws Exception {

		if(vo.getFile().getOriginalFilename()!=null && vo.getFile().getOriginalFilename().length()!=0) {
			String oriName = vo.getFile().getOriginalFilename();
			System.out.println(oriName);
			String url = this.getClass().getResource("").getPath(); 
			String path=url.substring(1,url.indexOf(".metadata"))+"springProject2/src/main/webapp/resources/images/recommend";
			
			String saveName = RecommImageFileUtil.renameTo(path,oriName);
			
			File file = new  File(path, saveName);
			
			try {				
				vo.getFile().transferTo(file); // 복사
			} catch (Exception e) {
				System.out.println("파일복사관련 에러="+e);
			}
			
			String path1 =path.substring(path.lastIndexOf("/resources")+1);
			vo.setProduct_image(path1+"/"+vo.getFile().getOriginalFilename());
			System.out.println("~~");
		}
		LinkedHashMap arealist=lws.selectjisu(vo1);
		LifeJisuVO vo2=(LifeJisuVO)arealist.get("vo");
		vo.setRecomm_jisu_no(vo2.getJisu_no());		
		vo.setProduct_no(product_no);
		dao.updateProd(vo);
		RedirectView rv = new RedirectView("recommendDetail.do?recomm_prod_no="+product_no);
		mv.setView(rv);
		return mv;
	}
	
	
	// 좋아요 기능 : 리스트에서
	@RequestMapping("recommendGood")
	public ModelAndView recommendGood(@RequestParam("recomm_prod_no") int recomm_prod_no, ModelAndView mv, HttpServletRequest request) throws Exception {
		HttpSession session=request.getSession();
		ArrayList noList=(ArrayList)session.getAttribute("noList");
		boolean isHit=false;
		String recomm_prod_no1 = String.valueOf(recomm_prod_no);
		if(noList==null || noList.size()==0) { //세션 없으면
			noList=new ArrayList(); 
			isHit=true;
			noList.add(recomm_prod_no1);
			session.setAttribute("noList", noList);
		}
		else if(noList.contains(recomm_prod_no1)){ 
			isHit=false;
			noList.remove(recomm_prod_no1);
		}else {
			isHit=true;
			noList.add(recomm_prod_no1);
			session.setAttribute("noList", noList);
		}
		if(isHit) {
			dao.recommendGood(recomm_prod_no);
		}else {
			dao.recommendBad(recomm_prod_no);
		}
		RedirectView rv = new RedirectView("recommendList.do");
		mv.setView(rv);
		return mv;
	}
	
	// 좋아요 기능 : 상세보기에서
		@RequestMapping("recommendGood2")
		public ModelAndView recommendGood2(@RequestParam("recomm_prod_no") int recomm_prod_no, ModelAndView mv, HttpServletRequest request) throws Exception {
			HttpSession session=request.getSession();
			ArrayList noList=(ArrayList)session.getAttribute("noList");
			String recomm_prod_no1 = String.valueOf(recomm_prod_no);
			boolean isHit=false;
			if(noList==null || noList.size()==0) { //세션 없으면
				noList=new ArrayList(); 
				isHit=true;
				noList.add(recomm_prod_no1);
				session.setAttribute("noList", noList);
			}
			else if(noList.contains(recomm_prod_no1)){ 
				isHit=false;
				noList.remove(recomm_prod_no1);
			}else {
				isHit=true;
				noList.add(recomm_prod_no1);
				session.setAttribute("noList", noList);
			}
			if(isHit) {
				dao.recommendGood(recomm_prod_no);
			}else {
				dao.recommendBad(recomm_prod_no);
			}
			RedirectView rv = new RedirectView("recommendDetail.do?recomm_prod_no="+recomm_prod_no);
			mv.setView(rv);
			return mv;
		}
	
}
