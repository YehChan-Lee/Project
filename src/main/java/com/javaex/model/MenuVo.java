package com.javaex.model;

import org.springframework.stereotype.Component;

@Component
public class MenuVo {
	private String shop_id;		// 사업자 번호(FK)	NOT NULL
	private String food_name;	// 음식 이름		NOT NULL
	private String food_price;	// 음식 가격		NOT NULL
	private String food_info;	// 음식 설명		NULL
	
	public MenuVo() {}

	public MenuVo(String shop_id, String food_name, String food_price, String food_info) {
		this.shop_id = shop_id;
		this.food_name = food_name;
		this.food_price = food_price;
		this.food_info = food_info;
	}

	public String getShop_id() {
		return shop_id;
	}

	public void setShop_id(String shop_id) {
		this.shop_id = shop_id;
	}

	public String getFood_name() {
		return food_name;
	}

	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}

	public String getFood_price() {
		return food_price;
	}

	public void setFood_price(String food_price) {
		this.food_price = food_price;
	}

	public String getFood_info() {
		return food_info;
	}

	public void setFood_info(String food_info) {
		this.food_info = food_info;
	}

	@Override
	public String toString() {
		return "Menu [shop_id=" + shop_id + ", food_name=" + food_name + ", food_price=" + food_price + ", food_info="
				+ food_info + "]";
	}
}
