package com.javaex.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.javaex.model.AllDao;
import com.javaex.model.ReservationDao;
import com.javaex.model.ShopDao;
import com.javaex.model.ShopUserDao;

@Controller
public class JoinController {
	
	@Autowired
	ShopDao dao;

	@Autowired
	ShopUserDao userDao;
	
	@Autowired
	ReservationDao reservedao;
	
	@Autowired
	AllDao alldao;
	
	
	// 마이페이지
	@RequestMapping("/mypage")
	public ModelAndView mypage(ModelAndView mav, HttpSession session) {
		System.out.println("/BabPool/mypage");
		// 아이디 가져오기
		String user_email = (String)session.getAttribute("sessionID");
		mav.addObject("reserveList", alldao.reserveList(user_email));
		mav.addObject("reviewList", alldao.reviewList(user_email));
		mav.addObject("dibsList", alldao.dibsList(user_email));
		mav.addObject("getUser", userDao.getUser(user_email));
		mav.setViewName("mypage/mypage");
		return mav;
	}
	
	@RequestMapping("/mypage/reservation")
	public ModelAndView mypage_reservation(ModelAndView mav, HttpSession session) {
		System.out.println("/BabPool/mypage/reservation");
		String user_email = (String)session.getAttribute("sessionID");
		mav.addObject("reserveList", alldao.reserveList(user_email));
		mav.addObject("getUser", userDao.getUser(user_email));
		mav.addObject("shopList", dao.shopList());
		mav.setViewName("mypage/mypage_reservation");
		return mav;
	}
	
	@RequestMapping("/mypage/reservation2")
	public ModelAndView mypage_reservation2(ModelAndView mav, HttpSession session) {
		System.out.println("/BabPool/mypage/reservation2");
		String user_email = (String)session.getAttribute("sessionID");
		mav.addObject("reserveList", alldao.reserveList(user_email));
		mav.addObject("getUser", userDao.getUser(user_email));
		mav.addObject("shopList", dao.shopList());
		mav.setViewName("mypage/mypage_reservation2");
		return mav;
	}
	
	@RequestMapping("/mypage/reservation3")
	public ModelAndView mypage_reservation3(ModelAndView mav, HttpSession session) {
		System.out.println("/BabPool/mypage/reservation3");
		String user_email = (String)session.getAttribute("sessionID");
		mav.addObject("pastList", alldao.pastList(user_email));
		mav.addObject("getUser", userDao.getUser(user_email));
		mav.addObject("shopList", dao.shopList());
		mav.setViewName("mypage/mypage_reservation3");
		return mav;
	}
	
//	@RequestMapping("/mypage/review")
//	public ModelAndView mypage_review(ModelAndView mav, HttpSession session) {
//		System.out.println("/BabPool/mypage/review");
//		String user_email = (String)session.getAttribute("sessionID");
//		mav.addObject("reviewList", alldao.reviewList(user_email));
//		mav.addObject("getUser", userDao.getUser(user_email));
//		mav.addObject("shopList", dao.shopList());
//		mav.setViewName("mypage/mypage_review2");
//		return mav;
//	}
	
	@RequestMapping("/mypage/dibs")
	public ModelAndView mypage_dibs(ModelAndView mav, HttpSession session) {
		System.out.println("/BabPool/mypage/dibs");
		String user_email = (String)session.getAttribute("sessionID");
		mav.addObject("dibsList", alldao.dibsList(user_email));
		mav.addObject("getUser", userDao.getUser(user_email));
		mav.addObject("shopList", dao.shopList());
		mav.setViewName("mypage/mypage_dibs");
		return mav;
	}
	
	@RequestMapping("/mypage/notice")
	public ModelAndView mypage_notice(ModelAndView mav, HttpSession session) {
		System.out.println("/BabPool/mypage/notice");
		String user_email = (String)session.getAttribute("sessionID");
		mav.addObject("newsList", alldao.newsList(user_email));
		mav.addObject("getUser", userDao.getUser(user_email));
		mav.setViewName("mypage/mypage_notice");
		return mav;
	}
	
	@RequestMapping("/mypage/notice2")
	public ModelAndView mypage_notice2(ModelAndView mav, HttpSession session) {
		System.out.println("/BabPool/mypage/notice");
		String user_email = (String)session.getAttribute("sessionID");
		mav.addObject("newsList", alldao.newsList(user_email));
		mav.addObject("getUser", userDao.getUser(user_email));
		mav.setViewName("mypage/mypage_notice2");
		return mav;
	}
	
	@RequestMapping("/mypage/notice3")
	public ModelAndView mypage_notice3(ModelAndView mav, HttpSession session) {
		System.out.println("/BabPool/mypage/notice3");
		String user_email = (String)session.getAttribute("sessionID");
		mav.addObject("bpList", alldao.bpList(user_email));
		mav.addObject("getUser", userDao.getUser(user_email));
		mav.setViewName("mypage/mypage_notice3");
		return mav;
	}
	@RequestMapping("/hello")
	public ModelAndView hello(ModelAndView mav,HttpSession session) {
		System.out.println("/BabPool/hello");
		String user_email = (String)session.getAttribute("sessionID");
		mav.addObject("reviewList",alldao.shopreviewList());
		mav.setViewName("detail/detail_review");
		return mav;
	}
}
