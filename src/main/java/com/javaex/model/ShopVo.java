package com.javaex.model;

import org.springframework.stereotype.Component;

@Component
public class ShopVo {
	private String shop_id;			// 사업자 번호(PK)			NOT NULL
	private String user_email;		// 사용자 이메일(FK)			NOT NULL
	private int shop_idx;			// 가게번호				NOT NULL
	private String shop_title;		// 가게 이름				NOT NULL
	private String shop_addr;		// 가게 세부 주소			NOT NULL
	private String shop_location;	// 가게 주소(ex. 서울/수도권)	NOT NULL
	private String food_type;		// 음식타입(ex. 한식)		NOT NULL
	private String shop_tip;		// 가게 설명 디테일			NULL
	private String budget;			// 예산					NULL
	private int shop_reserve;		// 총 예약 수				NULL
	private String shop_comment;	// 한줄 설명				NULL
	private int shop_view;			// 조회수					NULL
	private Double shop_score;		// 별점					NULL
	private String shop_phone;		// 가게 전화번호			NULL
	private String shop_time;		// 가게 운영시간			NOT NULL
	private String shop_addinfo;	// 가게 부가정보			NULL
	private String shop_tb;			// 가게 테이블 종류			NULL
	private String shop_alcohol;	// 가게 주류				NULL
	private String shop_car;		// 주차기능				NOT NULL
	private String shop_close;		// 휴무일					NULL
	private String shop_photo;		// 가게 사진				NULL
	private String shop_review;	
	private String hash_tag;
	private String shop_subphoto;
	private String shop_date;// 사업자신청일자NULL
	private String shop_state;// 사업자 승인NOT NULL
	
	public ShopVo() {}
	
	

	public ShopVo(String shop_id, String user_email, int shop_idx, String shop_title, String shop_addr,
			String shop_location, String food_type, String shop_tip, String budget, int shop_reserve,
			String shop_comment, int shop_view, Double shop_score, String shop_phone, String shop_time,
			String shop_addinfo, String shop_tb, String shop_alcohol, String shop_car, String shop_close,
			String shop_photo,String shop_review) {
		this.shop_id = shop_id;
		this.user_email = user_email;
		this.shop_idx = shop_idx;
		this.shop_title = shop_title;
		this.shop_addr = shop_addr;
		this.shop_location = shop_location;
		this.food_type = food_type;
		this.shop_tip = shop_tip;
		this.budget = budget;
		this.shop_reserve = shop_reserve;
		this.shop_comment = shop_comment;
		this.shop_view = shop_view;
		this.shop_score = shop_score;
		this.shop_phone = shop_phone;
		this.shop_time = shop_time;
		this.shop_addinfo = shop_addinfo;
		this.shop_tb = shop_tb;
		this.shop_alcohol = shop_alcohol;
		this.shop_car = shop_car;
		this.shop_close = shop_close;
		this.shop_photo = shop_photo;
		this.shop_review = shop_review;
	}
	public String getShop_date() {
		return shop_date;
	}

	public void setShop_date(String shop_date) {
		this.shop_date = shop_date;
	}

	public String getShop_state() {
		return shop_state;
	}

	public void setShop_state(String shop_state) {
		this.shop_state = shop_state;
	}
	public ShopVo(String shop_title,String shop_id, String shop_addr, String shop_location, String food_type, String shop_tip,
			String budget, String shop_comment, String shop_phone, String[] shop_time, String shop_addinfo,
			String shop_tb, String shop_alcohol, String shop_car, String shop_close,String shop_photo, String hash_tag, String shop_subphoto) {
		this.shop_title = shop_title;
		this.shop_id = shop_id;
		this.shop_addr = shop_addr;
		this.shop_location = shop_location;
		this.food_type = food_type;
		this.shop_tip = shop_tip;
		this.budget = budget;
		this.shop_comment = shop_comment;
		this.shop_phone = shop_phone;
		this.shop_time = shop_time[0] + ":"+shop_time[1] + "-" + shop_time[2] + ":" + shop_time[3];
		this.shop_addinfo = shop_addinfo;
		this.shop_tb = shop_tb;
		this.shop_alcohol = shop_alcohol;
		this.shop_car = shop_car;
		this.shop_close = shop_close;
		this.shop_photo = shop_photo;
		this.hash_tag = hash_tag;
		this.shop_subphoto = shop_subphoto;
	}
	
	

	public String getShop_id() {
		return shop_id;
	}

	public void setShop_id(String shop_id) {
		this.shop_id = shop_id;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public int getShop_idx() {
		return shop_idx;
	}

	public void setShop_idx(int shop_idx) {
		this.shop_idx = shop_idx;
	}

	public String getShop_title() {
		return shop_title;
	}

	public void setShop_title(String shop_title) {
		this.shop_title = shop_title;
	}

	public String getShop_addr() {
		return shop_addr;
	}

	public void setShop_addr(String shop_addr) {
		this.shop_addr = shop_addr;
	}

	public String getHash_tag() {
		return hash_tag;
	}

	public void setHash_tag(String hash_tag) {
		this.hash_tag = hash_tag;
	}
	public String getShop_location() {
		return shop_location;
	}

	public void setShop_location(String shop_location) {
		this.shop_location = shop_location;
	}

	public String getFood_type() {
		return food_type;
	}

	public void setFood_type(String food_type) {
		this.food_type = food_type;
	}

	public String getShop_tip() {
		return shop_tip;
	}

	public void setShop_tip(String shop_tip) {
		this.shop_tip = shop_tip;
	}

	public String getBudget() {
		return budget;
	}

	public void setBudget(String budget) {
		this.budget = budget;
	}

	public int getShop_reserve() {
		return shop_reserve;
	}

	public void setShop_reserve(int shop_reserve) {
		this.shop_reserve = shop_reserve;
	}

	public String getShop_comment() {
		return shop_comment;
	}

	public void setShop_comment(String shop_comment) {
		this.shop_comment = shop_comment;
	}

	public int getShop_view() {
		return shop_view;
	}

	public void setShop_view(int shop_view) {
		this.shop_view = shop_view;
	}

	public Double getShop_score() {
		return shop_score;
	}

	public void setShop_score(Double shop_score) {
		this.shop_score = shop_score;
	}

	public String getShop_phone() {
		return shop_phone;
	}

	public void setShop_phone(String shop_phone) {
		this.shop_phone = shop_phone;
	}

	public String getShop_time() {
		return shop_time;
	}

	public void setShop_time(String shop_time) {
		this.shop_time = shop_time;
	}

	public String getShop_addinfo() {
		return shop_addinfo;
	}

	public void setShop_addinfo(String shop_addinfo) {
		this.shop_addinfo = shop_addinfo;
	}

	public String getShop_tb() {
		return shop_tb;
	}

	public void setShop_tb(String shop_tb) {
		this.shop_tb = shop_tb;
	}

	public String getShop_alcohol() {
		return shop_alcohol;
	}

	public void setShop_alcohol(String shop_alcohol) {
		this.shop_alcohol = shop_alcohol;
	}

	public String getShop_car() {
		return shop_car;
	}

	public void setShop_car(String shop_car) {
		this.shop_car = shop_car;
	}

	public String getShop_close() {
		return shop_close;
	}

	public void setShop_close(String shop_close) {
		this.shop_close = shop_close;
	}
	public String getShop_photo() {
		return shop_photo;
	}

	public void setShop_photo(String shop_photo) {
		this.shop_photo = shop_photo;
	}
	
	public String getShop_review() {
		return shop_review;
	}

	public void setShop_review(String shop_review) {
		this.shop_review = shop_review;
	}
	
	

	public String getShop_subphoto() {
		return shop_subphoto;
	}

	public void setShop_subphoto(String shop_subphoto) {
		this.shop_subphoto = shop_subphoto;
	}

	@Override
	public String toString() {
		return "ShopVo [shop_id=" + shop_id + ", user_email=" + user_email + ", shop_idx=" + shop_idx + ", shop_title="
				+ shop_title + ", shop_addr=" + shop_addr + ", shop_location=" + shop_location + ", food_type="
				+ food_type + ", shop_tip=" + shop_tip + ", budget=" + budget + ", shop_reserve=" + shop_reserve
				+ ", shop_comment=" + shop_comment + ", shop_view=" + shop_view + ", shop_score=" + shop_score
				+ ", shop_phone=" + shop_phone + ", shop_time=" + shop_time + ", shop_addinfo="
				+ shop_addinfo + ", shop_tb=" + shop_tb + ", shop_alcohol=" + shop_alcohol + ", shop_car=" + shop_car
				+ ", shop_close=" + shop_close + ", shop_photo=" + shop_photo + "]";
	}
}
