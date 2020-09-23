package com.javaex.model;

public class ReviewLikeVo {
	private String user_email;
	private String shop_id;
	private int review_idx;
	
	public ReviewLikeVo() {
	}
	
	public ReviewLikeVo(String user_email, String shop_id, int review_idx) {
		this.user_email = user_email;
		this.shop_id = shop_id;
		this.review_idx = review_idx;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getShop_id() {
		return shop_id;
	}

	public void setShop_id(String shop_id) {
		this.shop_id = shop_id;
	}

	public int getReview_idx() {
		return review_idx;
	}

	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}
	
	
}
