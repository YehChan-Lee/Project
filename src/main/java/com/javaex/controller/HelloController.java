package com.javaex.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.javaex.model.ShopUserDao;

@Controller
public class HelloController {
	
	@Autowired
	ShopUserDao userDao;
	
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
	public ModelAndView buisnesssetting(ModelAndView mav, HttpSession session, HttpServletRequest req) {
		System.out.println("/setting");
		String user_email = (String) session.getAttribute("sessionID");

		mav.addObject(user_email);
		mav.addObject("getUser", userDao.getUser(user_email));
		mav.setViewName("buisnessmypage/buisness_mypage_setting");
		return mav;
	}
	
	@RequestMapping("/buisnessmypage/setting.do")
	public void my_setting(HttpSession session, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		System.out.println("/BabPool/mypage/setting.do");
		String user_email = (String) session.getAttribute("sessionID");
		String user_name = req.getParameter("update_name");
		String user_phone = req.getParameter("update_phone");
		System.out.println(
				"기본=>user_email: " + user_email + ", update_phone : " + user_phone + ", update_name :" + user_name);

		if (!user_name.equals("")) { // 이름만 변경
			userDao.Update_shopuser(user_name, user_email);
			System.out.println("이름만=>user_email: " + user_email + ", update_phone : " + user_phone + ", update_name :"
					+ user_name);
		} else if (!user_phone.equals("")) { // 번호만 변경
			userDao.Update_phone(user_phone, user_email);
			;
			System.out.println("번호만=>user_email: " + user_email + ", update_phone : " + user_phone + ", update_name :"
					+ user_name);
		} else if (user_phone.equals("") && user_name.equals("")) {
			resp.getWriter().write("fail");
			return;
		}
		resp.getWriter().write("update_success");
	}

	@RequestMapping("/menubar")
	public String menubar() {
		System.out.println("/hellospring/menubar");
		return "menubar";
	}
	
}
