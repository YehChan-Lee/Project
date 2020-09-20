package com.javaex.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.javaex.model.NoticeDao;
import com.javaex.model.ReviewDao;
import com.javaex.model.ShopDao;
import com.javaex.model.ShopUserDao;
import com.javaex.model.ShopUserVo;
import com.javaex.model.ShopVo;

@Controller
public class ListController {

	@Autowired
	ShopDao dao;

	@Autowired
	ShopUserDao userDao;
	
	@Autowired
	NoticeDao noticedao;
	
	@Autowired
	ReviewDao reviewdao;

	@RequestMapping("/list")
	public ModelAndView list(ModelAndView mav, HttpServletRequest request) {
		System.out.println("/BabPool/list");
		mav.addObject("shopList",
				dao.shopSearch(request.getParameter("location"), request.getParameterValues("shop_addr"),
						request.getParameterValues("food_type"), request.getParameter("string_search"),
						request.getParameter("solt")));
		mav.setViewName("list");
		return mav;
	}
	
	@RequestMapping("/review_upload")
	public void test(HttpServletRequest req,HttpServletResponse response) throws IOException {
		System.out.println("/BabPool/review_upload");
		String tmp = req.getParameter("star_span");
		String tmp2 = req.getParameter("review_area");
		response.getWriter().write("success");
		
		System.out.println("별점의 tmp : " + tmp + "\n" + "textarea : " + tmp2);		
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

		String user_email = request.getParameter("user_id");
		String password = request.getParameter("user_pw");

		ShopUserVo user;
		if (userDao.loginCheck(user_email) != null) {
			user = userDao.loginCheck(user_email);
			if(user.getUser_pw().equals(password)) {
				response.getWriter().write("success");
				session.setAttribute("is_owner", user.getIs_owner());
				session.setAttribute("sessionID", user_email);
			}else {
				response.getWriter().write("fail");
			}			
		}else if(user_email.equals("admin")) {
			response.getWriter().write("admin");
		}else {
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
			userDao.signUp(new ShopUserVo(email, pw, name, gender, birth, phone, "0", null, 0, null,0));
		}else {
			String buisnessNumber = req.getParameter("buisness_number");
			String buisnessName = req.getParameter("buisness_name");
			String buisnessAddress = req.getParameter("buisness_address");
			String buisnessAddressEtc = req.getParameter("buisness_address_etc");
			String buisnessFoodType = req.getParameter("buisness_food_type");
			
			System.out.println(buisnessNumber + " " + buisnessName + " " + buisnessAddress + " " + buisnessAddressEtc + " " + buisnessFoodType);
			userDao.signUp(new ShopUserVo(email, pw, name, gender, birth, phone, "1", null, 0, null,0));
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
	
	@RequestMapping("/buisness_update")
	public ModelAndView buisnessmypage_update(ModelAndView mav ,HttpServletRequest req) {
		String shop_title = req.getParameter("shop_title");
		String shop_addr = req.getParameter("shop_addr");
		String shop_location = req.getParameter("shop_location");
		String shop_id = req.getParameter("shop_id");
		String food_type = req.getParameter("food_type");
		String budget = req.getParameter("budget");
		String shop_tip = req.getParameter("shop_tip");
		String shop_comment = req.getParameter("shop_comment");
		String shop_phone = req.getParameter("shop_phone");
		String[] shop_time = req.getParameterValues("shop_time");
		String shop_addinfo = req.getParameter("shop_addinfo");
		String shop_tb = req.getParameter("shop_tb");
		String shop_alcohol = req.getParameter("shop_alcohol");
		String shop_car = req.getParameter("shop_car");
		String shop_close = req.getParameter("shop_close");
		String shop_photo = null;
		ShopVo s = new ShopVo(shop_title,shop_id,shop_addr,shop_location,food_type,
				shop_tip,budget,shop_comment,shop_phone,shop_time,shop_addinfo,shop_tb,
				shop_alcohol,shop_car,shop_close,shop_photo);
		dao.updateShop(s);
		mav.setViewName("buisnessmypage");
		System.out.println(s.toString());
		return mav;
	}
	
	@RequestMapping("/buisnessmypage/registration2")
	public ModelAndView registration2(ModelAndView mav, HttpSession session) {
		
		mav.addObject("shopOwnerList", dao.shopOwnerList((String)session.getAttribute("sessionID")));
		mav.setViewName("buisnessmypage/buisness_mypage_registration2");
		return mav;
	}

}
