package com.javaex.model;

public class AllVo {
	private ReservationVo Reservation;
	private ShopVo ShopVo;
	private ShopUserVo ShopUser;
	private ReviewVo ReviewVo;
	private MenuVO menu;
	private ShopDibsVo Dibs;
	private NewsVo NewsVo;
	
	public AllVo() {}

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

	public void setReviewVo(ReviewVo review) {
		this.ReviewVo = review;
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

	@Override
	public String toString() {
		return "AllVo [Reservation=" + Reservation + ", ShopVo=" + ShopVo + ", ShopUser=" + ShopUser + ", ReviewVo="
				+ ReviewVo + ", menu=" + menu + ", Dibs=" + Dibs + ", NewsVo=" + NewsVo + "]";
	}

}