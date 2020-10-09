package com.javaex.model;

import java.sql.Date;

public class NoticeVo {
	private String notice_title;	// 공지사항 제목		NOT NULL
	private Date notice_date;		// 공지사항 작성 날짜	NOT NULL
	private String notice_content;	// 공지사항 내용		NOT NULL
	private int notice_idx; 		// 공지사항 번호				NOT NULL
	
	public NoticeVo() {}

	public NoticeVo(String notice_title, Date notice_date, String notice_content, int notice_idx) {
		super();
		this.notice_title = notice_title;
		this.notice_date = notice_date;
		this.notice_content = notice_content;
		this.notice_idx = notice_idx;
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

	public int getNotice_idx() {
		return notice_idx;
	}

	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
	}

	@Override
	public String toString() {
		return "NoticeVo [notice_title=" + notice_title + ", notice_date=" + notice_date + ", notice_content="
				+ notice_content + ", notice_idx=" + notice_idx + "]";
	}

	
}
