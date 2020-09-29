package com.javaex.model;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component(value="ShopUser")
public class ShopUserVo {
	private String user_email;		// 사용자 이메일(PK)	NOT NULL
	private String user_pw;			// 사용자 비밀번호 		NOT NULL
	private String user_name;		// 사용자 이름			NOT NULL
	private String user_gender;		// 성별				NOT NULL
	private String user_birth;		// 생년월일			NOT NULL
	private String user_phone;		// 전화번호			NOT NULL
	private String is_owner;		// 사업자 여부			NOT NULL
	private Date sign_date;			// 가입날짜			NOT NULL
	private int point;				// 포인트				NULL
	private String user_photo;		// 사용자 사진			NULL
	private int user_idx;			// 사용자 번호			NOT NULL
	private String recent_shop;		// 최근본 매장의 사업자ID	NULL
	
	public ShopUserVo() {}	

	public ShopUserVo(String user_email, String user_pw, String user_name, String user_gender, String user_birth,
			String user_phone, String is_owner, Date sign_date, int point, String user_photo, int user_idx) {
		this.user_email = user_email;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_gender = user_gender;
		this.user_birth = user_birth;
		this.user_phone = user_phone;
		this.is_owner = is_owner;
		this.sign_date = sign_date;
		this.point = point;
		this.user_photo = user_photo;
		this.user_idx = user_idx;
	}
	
	public ShopUserVo(String user_email, String user_name, String user_phone) {
		this.user_email = user_email;
		this.user_name = user_name;
		this.user_phone = user_phone;
	}
	
	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_gender() {
		return user_gender;
	}

	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}

	public String getUser_birth() {
		return user_birth;
	}

	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getIs_owner() {
		return is_owner;
	}

	public void setIs_owner(String is_owner) {
		this.is_owner = is_owner;
	}

	public Date getSign_date() {
		return sign_date;
	}

	public void setSign_date(Date sign_date) {
		this.sign_date = sign_date;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getUser_photo() {
		return user_photo;
	}

	public void setUser_photo(String user_photo) {
		this.user_photo = user_photo;
	}
	
	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public String getRecent_shop() {
		return recent_shop;
	}

	public void setRecent_shop(String recent_shop) {
		this.recent_shop = recent_shop;
	}

	@Override
	public String toString() {
		return "ShopUserVo [user_email=" + user_email + ", user_pw=" + user_pw + ", user_name=" + user_name
				+ ", user_gender=" + user_gender + ", user_birth=" + user_birth + ", user_phone=" + user_phone
				+ ", is_owner=" + is_owner + ", sign_date=" + sign_date + ", point=" + point + ", user_photo="
				+ user_photo + ", user_idx=" + user_idx + ", recent_shop=" + recent_shop + "]";
	}

	
}
