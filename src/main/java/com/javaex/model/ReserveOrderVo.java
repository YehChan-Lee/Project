package com.javaex.model;

import java.sql.Date;

public class ReserveOrderVo {
	private String user_email; // 사용자 이메일(FK) NOT NULL
	private String food_name; // 음식 이름 NOT NULL
	private String shop_id; // 사업자 번호(FK) NOT NULL
	private int food_count; // 수량 NOT NULL
	private int table_number; // 테이블 번호 NOT NULL
	private Date pay_date; // 결제 날짜 NULL
	private String is_pay; // 결제 유무 NULL
	private int reserve_idx; // 예약 인덱스 NULL

	public ReserveOrderVo() {
	}

	public ReserveOrderVo(String user_email, String food_name, String shop_id, int food_count, int table_number,
			Date pay_date, String is_pay, int reserve_idx) {
		super();
		this.user_email = user_email;
		this.food_name = food_name;
		this.shop_id = shop_id;
		this.food_count = food_count;
		this.table_number = table_number;
		this.pay_date = pay_date;
		this.is_pay = is_pay;
		this.reserve_idx = reserve_idx;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getFood_name() {
		return food_name;
	}

	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}

	public String getShop_id() {
		return shop_id;
	}

	public void setShop_id(String shop_id) {
		this.shop_id = shop_id;
	}

	public int getFood_count() {
		return food_count;
	}

	public void setFood_count(int food_count) {
		this.food_count = food_count;
	}

	public int getTable_number() {
		return table_number;
	}

	public void setTable_number(int table_number) {
		this.table_number = table_number;
	}

	public Date getPay_date() {
		return pay_date;
	}

	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}

	public String getIs_pay() {
		return is_pay;
	}

	public void setIs_pay(String is_pay) {
		this.is_pay = is_pay;
	}

	public int getReserve_idx() {
		return reserve_idx;
	}

	public void setReserve_idx(int reserve_idx) {
		this.reserve_idx = reserve_idx;
	}

	@Override
	public String toString() {
		return "ReserveOrderVo [user_email=" + user_email + ", food_name=" + food_name + ", shop_id=" + shop_id
				+ ", food_count=" + food_count + ", table_number=" + table_number + ", pay_date=" + pay_date
				+ ", is_pay=" + is_pay + ", reserve_idx=" + reserve_idx + "]";
	}

	

}