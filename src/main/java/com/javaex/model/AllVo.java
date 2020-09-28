package com.javaex.model;

public class AllVo {
	private ReviewVo ReviewVo;
	private ReservationVo Reservation;
	private ShopVo ShopVo;
	private ShopUserVo ShopUserVo;
	private MenuVO menu;
	private ShopDibsVo Dibs;
	private NewsVo NewsVo;
	
	public AllVo() {}
	public ReviewVo getReviewVo() {
		return ReviewVo;
	}

	public void setReviewVo(ReviewVo reviewVo) {
		ReviewVo = reviewVo;
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
		return ShopUserVo;
	}

	public void setShopUser(ShopUserVo shopUser) {
		ShopUserVo = shopUser;
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
		return "AllVo[Reservation=" + Reservation + ", ShopVo=" + ShopVo + ", ShopUser=" + ShopUserVo + ", ReviewVo="
				+ ReviewVo + ", menu=" + menu + ", Dibs=" + Dibs + ", NewsVo=" + NewsVo + "]";
	}

}