package com.javaex.model;

import java.sql.Date;

public class ShopUserVo {
	private String user_email;		// 사용자 이메일(PK)	NOT NULL
	private String user_pw;			// 사용자 비밀번호 		NOT NULL
	private String user_name;		// 사용자 이름			NOT NULL
	private String user_gender;		// 성별				NOT NULL
	private String user_birth;		// 생년월일			NOT NULL
	private String user_phone;		// 전화번호			NOT NULL
	private String isOwner;			// 사업자 여부			NOT NULL
	private Date sign_date;			// 가입날짜			NOT NULL
	private int point;				// 포인트				NULL
	private String user_photo;		// 사용자 사진			NULL
	
	public ShopUserVo() {}	

	public ShopUserVo(String user_email, String user_pw, String user_name, String user_gender, String user_birth,
			String user_phone, String isOwner, Date sign_date, int point, String user_photo) {
		this.user_email = user_email;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_gender = user_gender;
		this.user_birth = user_birth;
		this.user_phone = user_phone;
		this.isOwner = isOwner;
		this.sign_date = sign_date;
		this.point = point;
		this.user_photo = user_photo;
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

	public String getIsOwner() {
		return isOwner;
	}

	public void setIsOwner(String isOwner) {
		this.isOwner = isOwner;
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

	@Override
	public String toString() {
		return "ShopUserVo [user_email=" + user_email + ", user_pw=" + user_pw + ", user_name=" + user_name
				+ ", user_gender=" + user_gender + ", user_birth=" + user_birth + ", user_phone=" + user_phone
				+ ", isOwner=" + isOwner + ", sign_date=" + sign_date + ", point=" + point + ", user_photo=" + user_photo +"]";
	}
}
