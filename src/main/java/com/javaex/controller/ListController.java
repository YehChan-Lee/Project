package com.javaex.controller;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.javaex.model.NoticeDao;
import com.javaex.model.ReservationDao;
import com.javaex.model.ShopDao;
import com.javaex.model.ShopUserDao;
import com.javaex.model.ShopUserVo;

@Controller
public class ListController {

	@Autowired
	ShopDao dao;

	@Autowired
	ShopUserDao userDao;
	
	@Autowired
	NoticeDao noticedao;
	
	@Autowired
	ReservationDao reservedao;

	@RequestMapping("/list")
	public ModelAndView list(ModelAndView mav) {
		System.out.println("/BabPool/list");
		mav.addObject("shopList", dao.shopList());
		mav.setViewName("list");
		return mav;
	}

	@RequestMapping("/detail")
	public ModelAndView detail(ModelAndView mav, HttpServletRequest request) {
		System.out.println("/BabPool/detail");
		int shopId = Integer.parseInt(request.getParameter("shopidx"));
		mav.addObject("shopOne", dao.shopOne(shopId));
		mav.setViewName("detail/detail");
		return mav;
	}

	@RequestMapping("/login")
	public void login(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		System.out.println("/BabPool/login");

		String email = request.getParameter("user_id");
		String password = request.getParameter("user_pw");
		System.out.println("email : " + email + "\npassword : " + password);

		ShopUserVo user;
		if (userDao.loginCheck(email) != null) {
			user = userDao.loginCheck(email);
			System.out.println("user : " + user);
			response.getWriter().write("success");
			session.setAttribute("sessionID", email);
		} else {
			System.out.println("ID가 존재하지않음");
			response.getWriter().write("fail");
		}
	}

	@RequestMapping("/logout")
	public ModelAndView logout(ModelAndView mav, HttpSession session) {
		System.out.println("/BabPool/logout");
		session.setAttribute("sessionID", null);
		mav.setViewName("main");
		return mav;
	}
	
	@RequestMapping("/join")
	public ModelAndView signup(ModelAndView mav,HttpServletRequest req) {
		System.out.println("/BabPool/signup");
		String email = req.getParameter("email");
		String pw = req.getParameter("pw");
		String name = req.getParameter("name");
		String birth = req.getParameter("bir_year")+"-"+req.getParameter("bir_mon")+"-" + req.getParameter("bir_day");
		String gender = req.getParameter("gender");
		String phone = req.getParameter("phone");
		int joinType = Integer.parseInt(req.getParameter("join_type"));
		
		if(joinType == 1) {
			userDao.signUp(new ShopUserVo(email, pw, name, gender, birth, phone, "0", null, 0, null, 0));
		}else {
			String buisnessNumber = req.getParameter("buisness_number");
			String buisnessName = req.getParameter("buisness_name");
			String buisnessAddress = req.getParameter("buisness_address");
			String buisnessAddressEtc = req.getParameter("buisness_address_etc");
			String buisnessFoodType = req.getParameter("buisness_food_type");
			
			System.out.println(buisnessNumber + " " + buisnessName + " " + buisnessAddress + " " + buisnessAddressEtc + " " + buisnessFoodType);
			userDao.signUp(new ShopUserVo(email, pw, name, gender, birth, phone, "1", null, 0, null, 0));
		}		
		mav.setViewName("main");		
		return mav;
	}
	
	// 공지사항
	@RequestMapping("/notice")
	public ModelAndView notice(ModelAndView mav) {
		System.out.println("/BabPool/notice => Notice_Page");
		mav.addObject("Notice", noticedao.noticeList());
		mav.setViewName("notice");
		return mav;
	}
	
	@RequestMapping("/detail/info.do")
	public ModelAndView detail_info(ModelAndView mav,HttpServletRequest request) {
		System.out.println("/BabPool/detail_info");
		int shop_idx = Integer.parseInt(request.getParameter("shopidx"));
		mav.addObject("shopOne",dao.shopOne(shop_idx));
		mav.setViewName("detail/detail_info");
		return mav;
	}
	
//	@RequestMapping("/detail2/photo.do")
//	public ModelAndView detail_photo(ModelAndView mav,HttpServletRequest request) {
//		System.out.println("/BabPool/detail_photo");
//		int shop_idx = Integer.parseInt(request.getParameter("shopidx"));
//		mav.addObject("shopOne",shopdao.shopOne(shop_idx));
//		mav.setViewName("detail_photo");
//		return mav;
//	}

}
