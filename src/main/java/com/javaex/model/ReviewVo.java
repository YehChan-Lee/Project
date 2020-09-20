package com.javaex.model;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class ReviewVo {
	private int review_idx;			// 리뷰 인덱스(PK)		NOT NULL
	private String shop_id;			// 사업자 번호(FK)		NOT NULL
	private String user_email;		// 사용자 이메일(FK)		NOT NULL
	private int review_score;		// 별점				NOT NULL
	private String review;			// 리뷰				NULL
	private String review_photo;	// 리뷰 사진			NULL
	private Date review_date;		// 리뷰 날짜			NOT NULL
	private int like_review;		// 좋아6요 수			NULL
	private int hate_review;		// 싫어요 수			NULL
	
	public ReviewVo() {}

	public ReviewVo(int review_idx, String shop_id, String user_email, int review_score, String review,
			String review_photo, Date review_date, int like_review, int hate_review) {
		this.review_idx = review_idx;
		this.shop_id = shop_id;
		this.user_email = user_email;
		this.review_score = review_score;
		this.review = review;
		this.review_photo = review_photo;
		this.review_date = review_date;
		this.like_review = like_review;
		this.hate_review = hate_review;
	}

	public int getReview_idx() {
		return review_idx;
	}

	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}

	public String getShop_id() {
		return shop_id;
	}

	public void setShop_id(String shop_id) {
		this.shop_id = shop_id;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public int getReview_score() {
		return review_score;
	}

	public void setReview_score(int review_score) {
		this.review_score = review_score;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public String getReview_photo() {
		return review_photo;
	}

	public void setReview_photo(String review_photo) {
		this.review_photo = review_photo;
	}

	public Date getReview_date() {
		return review_date;
	}

	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}

	public int getLike_review() {
		return like_review;
	}

	public void setLike_review(int like_review) {
		this.like_review = like_review;
	}

	public int getHate_review() {
		return hate_review;
	}

	public void setHate_review(int hate_review) {
		this.hate_review = hate_review;
	}

	@Override
	public String toString() {
		return "ReviewVo [review_idx=" + review_idx + ", shop_id=" + shop_id + ", user_email=" + user_email
				+ ", review_score=" + review_score + ", review=" + review + ", review_photo=" + review_photo
				+ ", review_date=" + review_date + ", like_review=" + like_review + ", hate_review=" + hate_review
				+ "]";
	}
}
