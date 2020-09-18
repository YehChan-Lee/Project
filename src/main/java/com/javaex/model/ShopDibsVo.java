package com.javaex.model;

public class ShopDibsVo {
	
	private String shop_id;
	private String user_email;
	private int dibs_idx;
	
	public ShopDibsVo() {}

	public ShopDibsVo(String shop_id, String user_email, int dibs_idx) {
		this.shop_id = shop_id;
		this.user_email = user_email;
		this.dibs_idx = dibs_idx;
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

	public int getDibs_idx() {
		return dibs_idx;
	}

	public void setDibs_idx(int dibs_idx) {
		this.dibs_idx = dibs_idx;
	}

	@Override
	public String toString() {
		return "ShopDibsVo [shop_id=" + shop_id + ", user_email=" + user_email + ", dibs_idx=" + dibs_idx + "]";
	}

}
