package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelloController {
	
	@RequestMapping("/")
	public String welcom() {
		System.out.println("/BabPool/home");
		return "test/test";
	}
	
	@RequestMapping("/location")
	public String location() {
		System.out.println("/BabPool/location");
		return "location_list";
	}

	@RequestMapping("/food")
	public String food() {
		System.out.println("/BabPool/food");
		return "food_list";
	}
	@RequestMapping("/hashTag")
	public String hashTag() {
		System.out.println("/BabPool/hashTag");
		return "hashTag_list";
	}

	@RequestMapping("/detail/photo.do")
	public String detail_photo() {
		System.out.println("/BabPool/detail");
		return "detail/detail_photo";
	}

	@RequestMapping("/home")
	public String home() {
		System.out.println("/BabPool/home");
		return "home";
	}

	@RequestMapping("/signup")
	public String signup() {
		System.out.println("/BobPool/signup");
		return "signup";
	}

	@RequestMapping("/term")
	public String term() {
		System.out.println("/BabPool/term");
		return "term";
	}

	@RequestMapping("/buisnessmypage")
	public String buisnessmypage() {
		System.out.println("/buisnessmypage");
		return "buisnessmypage/buisness_mypage";
	}

	@RequestMapping("/buisnessmypage/registration")
	public String registration() {
		System.out.println("/registration");
		return "buisnessmypage/buisness_mypage_registration";
	}

	@RequestMapping("/buisnessmypage/reservation")
	public String reservation() {
		System.out.println("/reservation");
		return "buisnessmypage/buisness_mypage_reservation";
	}

	
	@RequestMapping("/buisnessmypage/setting")
	public String buisnesssetting() {
		System.out.println("/setting");
		return "buisnessmypage/buisness_mypage_setting";
	}

	@RequestMapping("/menubar")
	public String menubar() {
		System.out.println("/hellospring/menubar");
		return "menubar";
	}

	@RequestMapping("/admin")
	public String admin() {
		System.out.println("/hellospring/admin/admin");
		return "admin/admin";
	}

	@RequestMapping("/admin/admin_member")
	public String admin_member() {
		System.out.println("/hellospring/admin/admin_member");
		return "admin/admin_member";
	}

	@RequestMapping("/admin/admin_company")
	public String admin_company() {
		System.out.println("/hellospring/admin/admin_company");
		return "admin/admin_company";
	}

	@RequestMapping("/admin/admin_company2")
	public String admin_company2() {
		System.out.println("/hellospring/admin/admin_company2");
		return "admin/admin_company2";
	}

	@RequestMapping("/admin/admin_resSitu")
	public String admin_resSitu() {
		System.out.println("/hellospring/admin/admin_resSitu");
		return "admin/admin_resSitu";
	}

	@RequestMapping("/admin/admin_resRegi")
	public String admin_resRegi() {
		System.out.println("/hellospring/admin/admin_resRegi");
		return "admin/admin_resRegi";
	}

	@RequestMapping("/admin/admin_numerical1")
	public String admin_numerical1() {
		System.out.println("/hellospring/admin/admin_numerical1");
		return "admin/admin_numerical1";
	}

	@RequestMapping("/admin/admin_numerical2")
	public String admin_numerical2() {
		System.out.println("/hellospring/admin/admin_numerical2");
		return "admin/admin_numerical2";
	}

	@RequestMapping("/admin/admin_numerical3")
	public String admin_numerical3() {
		System.out.println("/hellospring/admin/admin_numerical3");
		return "admin/admin_numerical3";
	}

	@RequestMapping("/admin/admin_numerical4")
	public String admin_numerical4() {
		System.out.println("/hellospring/admin/admin_numerical4");
		return "admin/admin_numerical4";
	}

	@RequestMapping("/admin/admin_numerical5")
	public String admin_numerical5() {
		System.out.println("/hellospring/admin/admin_numerical5");
		return "admin/admin_numerical5";
	}

	@RequestMapping("/admin/admin_numerical6")
	public String admin_numerical6() {
		System.out.println("/hellospring/admin/admin_numerical6");
		return "admin/admin_numerical6";
	}

	@RequestMapping("/admin/admin_numerical7")
	public String admin_numerical7() {
		System.out.println("/hellospring/admin/admin_numerical7");
		return "admin/admin_numerical7";
	}

	@RequestMapping("/admin/admin_notice")
	public String admin_notice() {
		System.out.println("/hellospring/admin/admin_notice");
		return "admin/admin_notice";
	}

	@RequestMapping("/admin_notice_info")
	public String admin_notice_info() {
		System.out.println("/hellospring/admin/admin_notice_info");
		return "admin/admin_notice_info";
	}

	@RequestMapping("/admin_notice_modify")
	public String admin_notice_modify() {
		System.out.println("/hellospring/admin/admin_notice_modify");
		return "admin/admin_notice_modify";
	}
}
