package com.javaex.model;

public class AdminVo {
	private String admin_id;	// 관리자 아이디		NOT NULL
	private String admin_pw;	// 관리자 비밀번호	NOT NULL
	private ReservationVo Reservation;
	private ShopVo ShopVo;
	private ShopUserVo ShopUser;
	private ReviewVo ReviewVo;
	private MenuVO menu;
	private ShopDibsVo Dibs;
	private NewsVo NewsVo;
	private ReserveOrderVo ReserveOrder;
	private NoticeVo NoticeVo;
	
	public AdminVo() {}

	public AdminVo(String admin_id, String admin_pw, ReservationVo reservation, com.javaex.model.ShopVo shopVo,
			ShopUserVo shopUser, com.javaex.model.ReviewVo reviewVo, MenuVO menu, ShopDibsVo dibs,
			com.javaex.model.NewsVo newsVo, ReserveOrderVo reserveOrder, com.javaex.model.NoticeVo noticeVo) {
		
		this.admin_id = admin_id;
		this.admin_pw = admin_pw;
		Reservation = reservation;
		ShopVo = shopVo;
		ShopUser = shopUser;
		ReviewVo = reviewVo;
		this.menu = menu;
		Dibs = dibs;
		NewsVo = newsVo;
		ReserveOrder = reserveOrder;
		NoticeVo = noticeVo;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getAdmin_pw() {
		return admin_pw;
	}

	public void setAdmin_pw(String admin_pw) {
		this.admin_pw = admin_pw;
	}

	public ReservationVo getReservation() {
		return Reservation;
	}

	public void setReservation(ReservationVo reservation) {
		Reservation = reservation;
	}

	public ShopVo getShopVo() {
		return ShopVo;
	}

	public void setShopVo(ShopVo shopVo) {
		ShopVo = shopVo;
	}

	public ShopUserVo getShopUser() {
		return ShopUser;
	}

	public void setShopUser(ShopUserVo shopUser) {
		ShopUser = shopUser;
	}

	public ReviewVo getReviewVo() {
		return ReviewVo;
	}

	public void setReviewVo(ReviewVo reviewVo) {
		ReviewVo = reviewVo;
	}

	public MenuVO getMenu() {
		return menu;
	}

	public void setMenu(MenuVO menu) {
		this.menu = menu;
	}

	public ShopDibsVo getDibs() {
		return Dibs;
	}

	public void setDibs(ShopDibsVo dibs) {
		Dibs = dibs;
	}

	public NewsVo getNewsVo() {
		return NewsVo;
	}

	public void setNewsVo(NewsVo newsVo) {
		NewsVo = newsVo;
	}

	public ReserveOrderVo getReserveOrder() {
		return ReserveOrder;
	}

	public void setReserveOrder(ReserveOrderVo reserveOrder) {
		ReserveOrder = reserveOrder;
	}

	public NoticeVo getNoticeVo() {
		return NoticeVo;
	}

	public void setNoticeVo(NoticeVo noticeVo) {
		NoticeVo = noticeVo;
	}

	@Override
	public String toString() {
		return "AdminVo [admin_id=" + admin_id + ", admin_pw=" + admin_pw + ", Reservation=" + Reservation + ", ShopVo="
				+ ShopVo + ", ShopUser=" + ShopUser + ", ReviewVo=" + ReviewVo + ", menu=" + menu + ", Dibs=" + Dibs
				+ ", NewsVo=" + NewsVo + ", ReserveOrder=" + ReserveOrder + ", NoticeVo=" + NoticeVo + "]";
	}

	

	

}
