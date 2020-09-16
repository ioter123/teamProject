package com.weather.proj.life.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class ProductVO {
	
	private int product_no;
	private String product_name;
	private String product_detail;
	private MultipartFile file;
	private String product_image;
	private String product_isshow;
	private int product_seq;
	
	private int recomm_no;
	private int recomm_good;
	private int recomm_jisu_no;
	private int recomm_prod_no;
	private Date recomm_date;
	private String recomm_isshow;

	
	public int getProduct_seq() {
		return product_seq;
	}
	public void setProduct_seq(int product_seq) {
		this.product_seq = product_seq;
	}
	public Date getRecomm_date() {
		return recomm_date;
	}
	public void setRecomm_date(Date recomm_date) {
		this.recomm_date = recomm_date;
	}
	public String getProduct_isshow() {
		return product_isshow;
	}
	public void setProduct_isshow(String product_isshow) {
		this.product_isshow = product_isshow;
	}
	public String getRecomm_isshow() {
		return recomm_isshow;
	}
	public void setRecomm_isshow(String recomm_isshow) {
		this.recomm_isshow = recomm_isshow;
	}
	public int getRecomm_no() {
		return recomm_no;
	}
	public void setRecomm_no(int recomm_no) {
		this.recomm_no = recomm_no;
	}
	public int getRecomm_good() {
		return recomm_good;
	}
	public void setRecomm_good(int recomm_good) {
		this.recomm_good = recomm_good;
	}
	public int getRecomm_jisu_no() {
		return recomm_jisu_no;
	}
	public void setRecomm_jisu_no(int recomm_jisu_no) {
		this.recomm_jisu_no = recomm_jisu_no;
	}
	public int getRecomm_prod_no() {
		return recomm_prod_no;
	}
	public void setRecomm_prod_no(int recomm_prod_no) {
		this.recomm_prod_no = recomm_prod_no;
	}
	public String getProduct_image() {
		return product_image;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_detail() {
		return product_detail;
	}
	public void setProduct_detail(String product_detail) {
		this.product_detail = product_detail;
	}

	
	
	
	
}
