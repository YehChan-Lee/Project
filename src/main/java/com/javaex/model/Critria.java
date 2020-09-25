package com.javaex.model;

public class Critria {

	private int pageNum;	// 페이지 번호
	private int amount;		// 데이터
	
	public Critria() {
		this(1,2);
	}

	public Critria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}
	
}
