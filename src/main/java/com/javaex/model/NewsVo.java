package com.javaex.model;

import java.sql.Date;

public class NewsVo {
	private String user_email;
	private int news_idx;
	private String news_content;
	private Date news_date;
	private String is_admin;
	
	public NewsVo() {}
	
	public NewsVo(String user_email, int news_idx, String news_content, Date news_date, String is_admin) {
		this.user_email = user_email;
		this.news_idx = news_idx;
		this.news_content = news_content;
		this.news_date = news_date;
		this.is_admin = is_admin;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public int getNews_idx() {
		return news_idx;
	}

	public void setNews_idx(int news_idx) {
		this.news_idx = news_idx;
	}

	public String getNews_content() {
		return news_content;
	}

	public void setNews_content(String news_content) {
		this.news_content = news_content;
	}

	public Date getNews_date() {
		return news_date;
	}

	public void setNews_date(Date news_date) {
		this.news_date = news_date;
	}

	public String getIs_admin() {
		return is_admin;
	}

	public void setIs_admin(String is_admin) {
		this.is_admin = is_admin;
	}

	@Override
	public String toString() {
		return "NewsVo [user_email=" + user_email + ", news_idx=" + news_idx + ", news_content=" + news_content
				+ ", news_date=" + news_date + ", is_admin=" + is_admin + "]";
	}
	
}
