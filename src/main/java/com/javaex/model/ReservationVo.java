package com.javaex.model;

import java.sql.Date;

import org.springframework.stereotype.Component;

public class ReservationVo {
	private String user_email; // 사용자 이메일(FK) NOT NULL
	private String shop_title; // 가게 이름 NOT NULL
	private Date res_date; // 예약 날짜 NOT NULL
	private int res_customer; // 예약 인원 NOT NULL
	private String shop_id; // 사업자 번호(FK) NOT NULL
	private int reserve_idx; // 인덱스 NOT NULL
	private String res_name; // 예약 이름 NOT NULL

	public ReservationVo() {
	}

	public ReservationVo(String user_email, String shop_title, Date res_date, int res_customer, String shop_id,
			int reserve_idx, String res_name) {
		super();
		this.user_email = user_email;
		this.shop_title = shop_title;
		this.res_date = res_date;
		this.res_customer = res_customer;
		this.shop_id = shop_id;
		this.reserve_idx = reserve_idx;
		this.res_name = res_name;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getShop_title() {
		return shop_title;
	}

	public void setShop_title(String shop_title) {
		this.shop_title = shop_title;
	}

	public Date getRes_date() {
		return res_date;
	}

	public void setRes_date(Date res_date) {
		this.res_date = res_date;
	}

	public int getRes_customer() {
		return res_customer;
	}

	public void setRes_customer(int res_customer) {
		this.res_customer = res_customer;
	}

	public String getShop_id() {
		return shop_id;
	}

	public void setShop_id(String shop_id) {
		this.shop_id = shop_id;
	}

	public int getReserve_idx() {
		return reserve_idx;
	}

	public void setReserve_idx(int reserve_idx) {
		this.reserve_idx = reserve_idx;
	}

	public String getRes_name() {
		return res_name;
	}

	public void setRes_name(String res_name) {
		this.res_name = res_name;
	}

	@Override
	public String toString() {
		return "ReservationVo [user_email=" + user_email + ", shop_title=" + shop_title + ", res_date=" + res_date
				+ ", res_customer=" + res_customer + ", shop_id=" + shop_id + ", reserve_idx=" + reserve_idx
				+ ", res_name=" + res_name + "]";
	}

}
