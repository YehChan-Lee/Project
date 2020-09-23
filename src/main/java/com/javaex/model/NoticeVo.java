package com.javaex.model;

import java.sql.Date;

public class NoticeVo{
	private String notice_title;	// 공지사항 제목		NOT NULL
	private Date notice_date;		// 공지사항 작성 날짜	NOT NULL
	private String notice_content;	// 공지사항 내용		NOT NULL
	private String notice_author; 	// 작성자				NOT NULL
	
	public NoticeVo() {}

	public NoticeVo(String notice_title, Date notice_date, String notice_content, String notice_author) {
		this.notice_title = notice_title;
		this.notice_date = notice_date;
		this.notice_content = notice_content;
		this.notice_author = notice_author;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public Date getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public String getNotice_author() {
		return notice_author;
	}

	public void setNotice_author(String notice_author) {
		this.notice_author = notice_author;
	}

	@Override
	public String toString() {
		return "NoticeVo [notice_title=" + notice_title + ", notice_date=" + notice_date + ", notice_content="
				+ notice_content + ", notice_author=" + notice_author + "]";
	}
}
