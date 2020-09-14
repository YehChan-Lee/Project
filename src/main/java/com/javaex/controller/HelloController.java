package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelloController {
	@RequestMapping("/hello")
	public String hello() {
		System.out.println("/BabPool/hello");
		return "detail/detail_review";
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

	@RequestMapping("/mypage/reservation")
	public String mypage_reservation() {
		System.out.println("/BabPool/mypage/mypage_reservation");
		return "mypage/mypage_reservation";
	}
	@RequestMapping("/mypage/reservation2")
	public String mypage_reservation2() {
		System.out.println("/BabPool/mypage/mypage_reservation2");
		return "mypage/mypage_reservation2";
	}
	@RequestMapping("/mypage/reservation3")
	public String mypage_reservation3() {
		System.out.println("/BabPool/mypage/mypage_reservation3");
		return "mypage/mypage_reservation3";
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
	@RequestMapping("/mypage/dibs")
	public String mypage_star() {
		System.out.println("/BabPool/mypage/mypage_review");
		return "mypage/mypage_dibs";
	}
	@RequestMapping("/mypage/notice")
	public String mypage_notice() {
		System.out.println("/BabPool/mypage/mypage_notice");
		return "mypage/mypage_notice";
	}
	@RequestMapping("/mypage/notice2")
	public String mypage_notice2() {
		System.out.println("/BabPool/mypage/mypage_notice2");
		return "mypage/mypage_notice2";
	}
	@RequestMapping("/mypage/notice3")
	public String mypage_notice3() {
		System.out.println("/BabPool/mypage/mypage_notice3");
		return "mypage/mypage_notice3";
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

}
