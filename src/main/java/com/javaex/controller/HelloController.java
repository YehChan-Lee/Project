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

	
}
