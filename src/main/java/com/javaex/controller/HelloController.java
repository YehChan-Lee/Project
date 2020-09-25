package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelloController {
	/*
	 * @RequestMapping("/hello") public String hello() {
	 * System.out.println("/BabPool/hello"); return "detail/detail_review"; }
	 */

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
	@RequestMapping("/main")
	public String main() {
		System.out.println("/BabPool/main");
		return "main";
	}
	
	@RequestMapping("/signup")
	public String signup() {
		System.out.println("/BobPool/signup");
		return "signup";
	}
	
	@RequestMapping("/mypage/review")
	public String mypage_review() {
		System.out.println("/BabPool/mypage/mypage_review");
		return "mypage/mypage_review";
	}
	@RequestMapping("/mypage/review2")
	public String mypage_review2() {
		System.out.println("/BabPool/mypage/mypage_review2");
		return "mypage/mypage_review2";
	}
	@RequestMapping("/mypage/review3")
	public String mypage_review3() {
		System.out.println("/BabPool/mypage/mypage_review3");
		return "mypage/mypage_review3";
	}

	@RequestMapping("/mypage/setting")
	public String mypage_setting() {
		System.out.println("/BabPool/mypage/mypage_setting");
		return "mypage/mypage_setting";
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

	@RequestMapping("/buisnessmypage/reservation2")
	public String reservation2() {
		System.out.println("/reservation2");
		return "buisnessmypage/buisness_mypage_reservation2";
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
	
//	@RequestMapping("/admin/admin_numerical1")
//	public String admin_numerical1() {
//		System.out.println("/hellospring/admin/admin_numerical1");
//		return "admin/admin_numerical1";
//	}

}
