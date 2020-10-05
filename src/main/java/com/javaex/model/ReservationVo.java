package com.javaex.model;

import java.sql.Date;

public class ReservationVo {
   private String user_email;   // 사용자 이메일(FK)      NOT NULL
   private String shop_title;   // 가게 이름         NOT NULL
   private Date res_date;      // 예약 날짜         NOT NULL
   private int res_customer;   // 예약 인원         NOT NULL
   private String shop_id;      // 사업자 번호(FK)      NOT NULL
   private String reserve_idx;      // 예약 번호      		NULL
   private String alert_new;      // 알림 확인여부      NOT NULL default 1
   private String rev_phone;      // 예약한 사용자 전화번호      NOT NULL
   private String res_name;
   
   public ReservationVo() {}


public ReservationVo(String user_email, String shop_title, Date res_date, int res_customer, String shop_id,
		String reserve_idx, String alert_new, String rev_phone, String res_name) {
	super();
	this.user_email = user_email;
	this.shop_title = shop_title;
	this.res_date = res_date;
	this.res_customer = res_customer;
	this.shop_id = shop_id;
	this.reserve_idx = reserve_idx;
	this.alert_new = alert_new;
	this.rev_phone = rev_phone;
	this.res_name = res_name;
}

	public String getUser_email() {
	return user_email;
}


public void setUser_email(String user_email) {
	this.user_email = user_email;
}



public String getRes_name() {
	return res_name;
}


public void setRes_name(String res_name) {
	this.res_name = res_name;
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


public String getReserve_idx() {
	return reserve_idx;
}


public void setReserve_idx(String reserve_idx) {
	this.reserve_idx = reserve_idx;
}


public String getAlert_new() {
	return alert_new;
}


public void setAlert_new(String alert_new) {
	this.alert_new = alert_new;
}


public String getRev_phone() {
	return rev_phone;
}


public void setRev_phone(String rev_phone) {
	this.rev_phone = rev_phone;
}


	@Override
	public String toString() {
		return "ReservationVo [user_email=" + user_email + ", shop_title=" + shop_title + ", res_date=" + res_date
				+ ", res_customer=" + res_customer + ", shop_id=" + shop_id + "]";
	}
}
