package com.javaex.model;

import java.sql.Date;

public class VisitDayVo {
	private int count;
	private String day;
	
	public VisitDayVo() {
		// TODO Auto-generated constructor stub
	}

	public VisitDayVo(int count, String day) {
		this.count = count;
		this.day = day;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	@Override
	public String toString() {
		return "VisitDayVo [count=" + count + ", day=" + day + "]";
	}
		
}
